# langchain_anthropic Migration Guide

## Image URL support

Previously, only base64-encoded images were supported when sending images
to Anthropic models. Now, image URLs are also supported:

```dart
final message = ChatMessage.human(
  ChatMessageContent.image(
    data: 'https://example.com/image.png',
  ),
);
```

Base64-encoded images continue to work as before.

## PDF document support

PDF documents can now be sent to Claude models via base64 encoding.
Use the `application/pdf` MIME type:

```dart
final message = ChatMessage.human(
  ChatMessageContent.image(
    data: base64EncodedPdfData,
    mimeType: 'application/pdf',
  ),
);
```

## Base URL change

The default base URL has changed from `https://api.anthropic.com/v1` to
`https://api.anthropic.com`. This is a **breaking change** if you relied on
the old default or appended paths to it.

If you were manually constructing URLs by appending to the base URL, update
your code accordingly.

## Updated model list

The model list in `ChatAnthropicOptions` has been updated to include:
- `claude-sonnet-4-5-20250514`
- `claude-sonnet-4-5-latest`
- `claude-haiku-3-5-latest`
- `claude-haiku-3-5-20250414`
- `claude-3-5-haiku-latest`
- `claude-3-5-haiku-20241022`
