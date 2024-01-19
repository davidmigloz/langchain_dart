openapi: 3.0.0
info:
  title: Mistral AI API
  description: Chat Completion and Embeddings APIs
  version: 0.0.1
servers:
  - url: https://api.mistral.ai/v1
paths:
  /chat/completions:
    post:
      operationId: createChatCompletion
      summary: Create Chat Completions
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/ChatCompletionRequest'
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ChatCompletionResponse'
  /embeddings:
    post:
      operationId: createEmbedding
      summary: Create Embeddings
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/EmbeddingRequest'
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/EmbeddingResponse'
  /models:
    get:
      operationId: listModels
      summary: List Available Models
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ModelList'
components:
  schemas:
    Error:
      type: object
      properties:
        type:
          type: string
          nullable: false
        message:
          type: string
          nullable: false
        param:
          type: string
          nullable: true
        code:
          type: string
          nullable: true
      required:
        - type
        - message
        - param
        - code
    ErrorResponse:
      type: object
      properties:
        error:
          $ref: '#/components/schemas/Error'
      required:
        - error
    ModelList:
      type: object
      properties:
        object:
          type: string
        data:
          type: array
          items:
            $ref: '#/components/schemas/Model'
      required:
        - object
        - data
    ChatCompletionRequest:
      type: object
      properties:
        model:
          description: >
            ID of the model to use. You can use the [List Available
            Models](/api#operation/listModels) API to see all of your available
            models, or see our [Model overview](/models) for model descriptions.
          type: string
          example: mistral-tiny
        messages:
          description: >
            The prompt(s) to generate completions for, encoded as a list of dict
            with role and content. The first prompt role should be `user` or
            `system`.
          type: array
          items:
            type: object
            properties:
              role:
                type: string
                enum:
                  - system
                  - user
                  - assistant
              content:
                type: string
          example:
            - role: user
              content: What is the best French cheese?
        temperature:
          type: number
          minimum: 0
          maximum: 1
          default: 0.7
          example: 0.7
          nullable: true
          description: >
            What sampling temperature to use, between 0.0 and 1.0. Higher values
            like 0.8 will make the output more random, while lower values like
            0.2 will make it more focused and deterministic.


            We generally recommend altering this or `top_p` but not both.
        top_p:
          type: number
          minimum: 0
          maximum: 1
          default: 1
          example: 1
          nullable: true
          description: >
            Nucleus sampling, where the model considers the results of the
            tokens with `top_p` probability mass. So 0.1 means only the tokens
            comprising the top 10% probability mass are considered.


            We generally recommend altering this or `temperature` but not both.
        max_tokens:
          type: integer
          minimum: 0
          default: null
          example: 16
          nullable: true
          description: >
            The maximum number of tokens to generate in the completion.


            The token count of your prompt plus `max_tokens` cannot exceed the
            model's context length. 
        stream:
          type: boolean
          default: false
          nullable: true
          description: >
            Whether to stream back partial progress. If set, tokens will be sent
            as data-only server-sent events as they become available, with the
            stream terminated by a data: [DONE] message. Otherwise, the server
            will hold the request open until the timeout or until completion,
            with the response containing the full result as JSON.
        safe_prompt:
          type: boolean
          default: false
          description: |
            Whether to inject a safety prompt before all conversations.
        random_seed:
          type: integer
          default: null
          description: >
            The seed to use for random sampling. If set, different calls will
            generate deterministic results.
      required:
        - model
        - messages
    ChatCompletionResponse:
      type: object
      properties:
        id:
          type: string
          example: cmpl-e5cc70bb28c444948073e77776eb30ef
        object:
          type: string
          example: chat.completion
        created:
          type: integer
          example: 1702256327
        model:
          type: string
          example: mistral-tiny
        choices:
          type: array
          items:
            type: object
            required:
              - index
              - text
              - finish_reason
            properties:
              index:
                type: integer
                example: 0
              message:
                type: object
                properties:
                  role:
                    type: string
                    enum:
                      - user
                      - assistant
                    example: assistant
                  content:
                    type: string
                    example: >-
                      I don't have a favorite condiment as I don't consume food
                      or condiments. However, I can tell you that many people
                      enjoy using ketchup, mayonnaise, hot sauce, soy sauce, or
                      mustard as condiments to enhance the flavor of their
                      meals. Some people also enjoy using herbs, spices, or
                      vinegars as condiments. Ultimately, the best condiment is
                      a matter of personal preference.
              finish_reason:
                type: string
                enum:
                  - stop
                  - length
                  - model_length
        usage:
          type: object
          properties:
            prompt_tokens:
              type: integer
              example: 14
            completion_tokens:
              type: integer
              example: 93
            total_tokens:
              type: integer
              example: 107
          required:
            - prompt_tokens
            - completion_tokens
            - total_tokens
    EmbeddingRequest:
      type: object
      properties:
        model:
          type: string
          example: mistral-embed
          description: |
            The ID of the model to use for this request.
        input:
          type: array
          items:
            type: string
          example:
            - Hello
            - world
          description: |
            The list of strings to embed.
        encoding_format:
          type: string
          enum:
            - float
          example: float
          description: |
            The format of the output data.
    EmbeddingResponse:
      type: object
      properties:
        id:
          type: string
          example: embd-aad6fc62b17349b192ef09225058bc45
        object:
          type: string
          example: list
        data:
          type: array
          items:
            type: object
            properties:
              object:
                type: string
                example: embedding
              embedding:
                type: array
                items:
                  type: number
                example:
                  - 0.1
                  - 0.2
                  - 0.3
              index:
                type: int
                example: 0
          example:
            - object: embedding
              embedding:
                - 0.1
                - 0.2
                - 0.3
              index: 0
            - object: embedding
              embedding:
                - 0.4
                - 0.5
                - 0.6
              index: 1
        model:
          type: string
        usage:
          type: object
          properties:
            prompt_tokens:
              type: integer
              example: 9
            total_tokens:
              type: integer
              example: 9
          required:
            - prompt_tokens
            - total_tokens
      required:
        - id
        - object
        - data
        - model
        - usage
    Model:
      title: Model
      properties:
        id:
          type: string
        object:
          type: string
        created:
          type: integer
        owned_by:
          type: string
      required:
        - id
        - object
        - created
        - owned_by
