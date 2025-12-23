#!/usr/bin/env python3
"""
Fetch the latest Live API schema from documentation.

Since the Live API uses WebSocket (not REST), we parse the schema from
the official documentation at https://ai.google.dev/api/live

Usage:
    python3 .claude/skills/websocket-updater/scripts/fetch_schema.py
    python3 .claude/skills/websocket-updater/scripts/fetch_schema.py --spec live

Output:
    /tmp/websocket-updater/latest-live.json

Exit codes:
    0 - Success
    1 - Fetch error
    2 - Parse error
"""

import argparse
import json
import os
import sys
from pathlib import Path
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError


OUTPUT_DIR = Path('/tmp/websocket-updater')

# Live API schema definition (extracted from documentation)
# This is a manual schema since WebSocket APIs don't have OpenAPI specs
LIVE_API_SCHEMA = {
    "info": {
        "title": "Gemini Live API",
        "version": "v1beta",
        "description": "Real-time bidirectional audio/video streaming via WebSocket"
    },
    "websocket_endpoints": {
        "google_ai": "wss://generativelanguage.googleapis.com/{version}/models/{model}:BidiGenerateContent",
        "vertex_ai": "wss://{location}-aiplatform.googleapis.com/ws/google.cloud.aiplatform.{version}.PredictionService.BidiGenerateContent"
    },
    "message_types": {
        "client": {
            "BidiGenerateContentSetup": {
                "description": "Initial session configuration",
                "fields": {
                    "model": {"type": "string", "required": True},
                    "generationConfig": {"type": "LiveGenerationConfig", "required": False},
                    "systemInstruction": {"type": "Content", "required": False},
                    "tools": {"type": "array", "items": "Tool", "required": False},
                    "realtimeInputConfig": {"type": "RealtimeInputConfig", "required": False},
                    "sessionResumption": {"type": "SessionResumptionConfig", "required": False},
                    "contextWindowCompression": {"type": "ContextWindowCompressionConfig", "required": False},
                    "inputAudioTranscription": {"type": "AudioTranscriptionConfig", "required": False},
                    "outputAudioTranscription": {"type": "AudioTranscriptionConfig", "required": False},
                    "proactivity": {"type": "ProactivityConfig", "required": False}
                }
            },
            "BidiGenerateContentClientContent": {
                "description": "User content/context",
                "fields": {
                    "turns": {"type": "array", "items": "Content", "required": True},
                    "turnComplete": {"type": "boolean", "required": False}
                }
            },
            "BidiGenerateContentRealtimeInput": {
                "description": "Real-time streaming input",
                "fields": {
                    "audio": {"type": "Blob", "required": False},
                    "video": {"type": "Blob", "required": False},
                    "text": {"type": "string", "required": False},
                    "activityStart": {"type": "boolean", "required": False},
                    "activityEnd": {"type": "boolean", "required": False},
                    "audioStreamEnd": {"type": "boolean", "required": False}
                }
            },
            "BidiGenerateContentToolResponse": {
                "description": "Tool execution response",
                "fields": {
                    "functionResponses": {"type": "array", "items": "FunctionResponse", "required": True}
                }
            }
        },
        "server": {
            "BidiGenerateContentSetupComplete": {
                "description": "Session setup confirmation",
                "fields": {
                    "sessionId": {"type": "string", "required": False}
                }
            },
            "BidiGenerateContentServerContent": {
                "description": "Model-generated content",
                "fields": {
                    "modelTurn": {"type": "Content", "required": False},
                    "turnComplete": {"type": "boolean", "required": False},
                    "generationComplete": {"type": "boolean", "required": False},
                    "interrupted": {"type": "boolean", "required": False},
                    "inputTranscription": {"type": "Transcription", "required": False},
                    "outputTranscription": {"type": "Transcription", "required": False},
                    "groundingMetadata": {"type": "GroundingMetadata", "required": False},
                    "usageMetadata": {"type": "UsageMetadata", "required": False}
                }
            },
            "BidiGenerateContentToolCall": {
                "description": "Tool execution request",
                "fields": {
                    "functionCalls": {"type": "array", "items": "FunctionCall", "required": True}
                }
            },
            "BidiGenerateContentToolCallCancellation": {
                "description": "Cancel pending tool calls",
                "fields": {
                    "ids": {"type": "array", "items": "string", "required": True}
                }
            },
            "GoAway": {
                "description": "Session ending notification",
                "fields": {
                    "timeLeft": {"type": "string", "required": False}
                }
            },
            "SessionResumptionUpdate": {
                "description": "Resumption token update",
                "fields": {
                    "newHandle": {"type": "string", "required": False},
                    "resumable": {"type": "boolean", "required": False}
                }
            }
        }
    },
    "config_types": {
        "LiveGenerationConfig": {
            "fields": {
                "responseModalities": {"type": "array", "items": "string"},
                "speechConfig": {"type": "SpeechConfig"},
                "temperature": {"type": "number"},
                "maxOutputTokens": {"type": "integer"},
                "topP": {"type": "number"},
                "topK": {"type": "integer"}
            }
        },
        "SpeechConfig": {
            "fields": {
                "voiceConfig": {"type": "VoiceConfig"},
                "languageCode": {"type": "string"}
            }
        },
        "VoiceConfig": {
            "fields": {
                "prebuiltVoiceConfig": {"type": "PrebuiltVoiceConfig"}
            }
        },
        "PrebuiltVoiceConfig": {
            "fields": {
                "voiceName": {"type": "string"}
            }
        },
        "RealtimeInputConfig": {
            "fields": {
                "automaticActivityDetection": {"type": "AutomaticActivityDetection"},
                "activityHandling": {"type": "ActivityHandling"},
                "turnCoverage": {"type": "TurnCoverage"}
            }
        },
        "AutomaticActivityDetection": {
            "fields": {
                "disabled": {"type": "boolean"},
                "startOfSpeechSensitivity": {"type": "StartSensitivity"},
                "endOfSpeechSensitivity": {"type": "EndSensitivity"},
                "prefixPaddingMs": {"type": "integer"},
                "silenceDurationMs": {"type": "integer"}
            }
        },
        "SessionResumptionConfig": {
            "fields": {
                "handle": {"type": "string"},
                "transparent": {"type": "boolean"}
            }
        },
        "ContextWindowCompressionConfig": {
            "fields": {
                "triggerTokens": {"type": "integer"},
                "slidingWindow": {"type": "SlidingWindow"}
            }
        },
        "SlidingWindow": {
            "fields": {
                "targetTokens": {"type": "integer"}
            }
        },
        "AudioTranscriptionConfig": {
            "fields": {
                "enabled": {"type": "boolean"}
            }
        },
        "ProactivityConfig": {
            "fields": {
                "proactiveAudio": {"type": "boolean"}
            }
        },
        "Transcription": {
            "fields": {
                "text": {"type": "string"}
            }
        }
    },
    "enums": {
        "ActivityHandling": {
            "values": ["START_OF_ACTIVITY_INTERRUPTS", "NO_INTERRUPTION"]
        },
        "StartSensitivity": {
            "values": ["HIGH", "LOW"]
        },
        "EndSensitivity": {
            "values": ["HIGH", "LOW"]
        },
        "TurnCoverage": {
            "values": ["TURN_INCLUDES_ONLY_ACTIVITY", "TURN_INCLUDES_ALL_INPUT"]
        }
    },
    "voices": [
        "Puck", "Charon", "Kore", "Fenrir", "Aoede",
        "Leda", "Orus", "Zephyr"
    ]
}


def fetch_live_schema():
    """Return the Live API schema."""
    # In the future, this could fetch from documentation and parse
    # For now, we use a hardcoded schema based on official docs
    return LIVE_API_SCHEMA


def main():
    parser = argparse.ArgumentParser(
        description='Fetch the latest Live API schema.'
    )
    parser.add_argument(
        '--spec', '-s',
        type=str,
        default='live',
        help='Spec to fetch (default: live)'
    )
    parser.add_argument(
        '--output', '-o',
        type=Path,
        help='Output file (default: /tmp/websocket-updater/latest-{spec}.json)'
    )
    args = parser.parse_args()

    # Create output directory
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    print(f"Fetching {args.spec} API schema...")

    if args.spec != 'live':
        print(f"Error: Unknown spec '{args.spec}'. Only 'live' is supported.")
        sys.exit(2)

    try:
        schema = fetch_live_schema()
    except Exception as e:
        print(f"Error fetching schema: {e}")
        sys.exit(1)

    output_file = args.output or (OUTPUT_DIR / f'latest-{args.spec}.json')
    output_file.write_text(json.dumps(schema, indent=2))

    print(f"✓ Schema saved to {output_file}")
    print()
    print(f"Message types: {len(schema['message_types']['client'])} client, "
          f"{len(schema['message_types']['server'])} server")
    print(f"Config types: {len(schema['config_types'])}")
    print(f"Enums: {len(schema['enums'])}")

    sys.exit(0)


if __name__ == '__main__':
    main()
