/// Unofficial Dart client for the Google AI Gemini Developer API and Vertex AI Gemini API with unified interface.
library;

// Auth
export 'src/auth/auth_provider.dart';
// Client
export 'src/client/config.dart'
    show ApiMode, ApiVersion, GoogleAIConfig, RetryPolicy;
export 'src/client/googleai_client.dart';
// Errors
export 'src/errors/exceptions.dart';
export 'src/models/batch/batch_state.dart';
export 'src/models/batch/batch_stats.dart';
export 'src/models/batch/embed_content_batch.dart';
export 'src/models/batch/embed_content_batch_stats.dart';
// Models - Batch API
export 'src/models/batch/generate_content_batch.dart';
export 'src/models/batch/inlined_embed_content_request.dart';
export 'src/models/batch/inlined_embed_content_requests.dart';
export 'src/models/batch/inlined_request.dart';
export 'src/models/batch/inlined_requests.dart';
export 'src/models/batch/inlined_response.dart';
export 'src/models/batch/input_config.dart';
export 'src/models/batch/input_embed_content_config.dart';
export 'src/models/batch/list_batches_response.dart';
export 'src/models/batch/status.dart';
// Models - Caching API
export 'src/models/caching/cached_content.dart';
export 'src/models/caching/cached_content_usage_metadata.dart';
export 'src/models/caching/list_cached_contents_response.dart';
// Models - Content
export 'src/models/content/blob.dart';
export 'src/models/content/candidate.dart';
export 'src/models/content/citation_metadata.dart';
export 'src/models/content/content.dart';
export 'src/models/content/file_data.dart';
export 'src/models/content/logprobs_result.dart';
export 'src/models/content/part.dart';
export 'src/models/corpus/condition.dart'; // Includes ConditionOperator enum
// Models - Corpus & RAG API
export 'src/models/corpus/corpus.dart';
export 'src/models/corpus/custom_metadata.dart';
export 'src/models/corpus/document.dart';
export 'src/models/corpus/list_corpora_response.dart';
export 'src/models/corpus/list_documents_response.dart';
export 'src/models/corpus/metadata_filter.dart';
export 'src/models/corpus/semantic_retriever_config.dart';
export 'src/models/corpus/string_list.dart';
// Models - Embeddings
export 'src/models/embeddings/batch_embed_contents_request.dart';
export 'src/models/embeddings/batch_embed_contents_response.dart';
export 'src/models/embeddings/content_embedding.dart';
export 'src/models/embeddings/embed_content_request.dart';
export 'src/models/embeddings/embed_content_response.dart';
export 'src/models/embeddings/task_type.dart';
// Models - Files API
export 'src/models/files/file.dart';
export 'src/models/files/file_state.dart';
export 'src/models/files/generated_file.dart';
export 'src/models/files/list_files_response.dart';
export 'src/models/files/list_generated_files_response.dart';
// Models - Files
export 'src/models/files/video_metadata.dart';
// Models - Generation
export 'src/models/generation/answer_style.dart';
export 'src/models/generation/block_reason.dart';
export 'src/models/generation/count_tokens_request.dart';
export 'src/models/generation/count_tokens_response.dart';
export 'src/models/generation/generate_answer_request.dart';
export 'src/models/generation/generate_answer_response.dart';
export 'src/models/generation/generate_content_request.dart';
export 'src/models/generation/generate_content_response.dart';
export 'src/models/generation/generation_config.dart';
export 'src/models/generation/grounding_passage.dart';
export 'src/models/generation/grounding_passages.dart';
export 'src/models/generation/input_feedback.dart';
export 'src/models/generation/prompt_feedback.dart';
// Models - Generation (additional)
export 'src/models/generation/schema.dart';
export 'src/models/generation/thinking_config.dart';
export 'src/models/generation/thinking_level.dart';
// Models - Metadata
export 'src/models/metadata/finish_reason.dart';
export 'src/models/metadata/modality_token_count.dart';
export 'src/models/metadata/usage_metadata.dart';
// Models - Models API
export 'src/models/models/dataset.dart';
export 'src/models/models/hyperparameters.dart';
export 'src/models/models/list_models_response.dart';
export 'src/models/models/list_operations_response.dart';
export 'src/models/models/list_tuned_models_response.dart';
export 'src/models/models/model.dart';
export 'src/models/models/operation.dart';
export 'src/models/models/tuned_model.dart';
export 'src/models/models/tuning_task.dart';
export 'src/models/permissions/grantee_type.dart';
export 'src/models/permissions/list_permissions_response.dart';
// Models - Permissions API
export 'src/models/permissions/permission.dart';
export 'src/models/permissions/permission_role.dart';
export 'src/models/permissions/transfer_ownership_request.dart';
// Models - Prediction (Video Generation)
export 'src/models/prediction/media.dart';
export 'src/models/prediction/predict_long_running_generated_video_response.dart';
export 'src/models/prediction/predict_long_running_metadata.dart';
export 'src/models/prediction/predict_long_running_operation.dart';
export 'src/models/prediction/predict_long_running_request.dart';
export 'src/models/prediction/predict_long_running_response.dart';
export 'src/models/prediction/predict_request.dart';
export 'src/models/prediction/predict_response.dart';
// Models - Safety
export 'src/models/safety/harm_category.dart';
export 'src/models/safety/harm_probability.dart';
export 'src/models/safety/safety_rating.dart';
export 'src/models/safety/safety_setting.dart';
// Models - Tools
export 'src/models/tools/code_execution_result.dart';
export 'src/models/tools/executable_code.dart';
export 'src/models/tools/function_call.dart';
// Models - Tools (additional)
export 'src/models/tools/function_calling_config.dart';
export 'src/models/tools/function_declaration.dart';
export 'src/models/tools/function_response.dart';
export 'src/models/tools/tool.dart';
export 'src/models/tools/tool_config.dart';
// Utilities
export 'src/utils/lro_poller.dart';
export 'src/utils/paginator.dart';
