export interface StreamOptions {
  include_usage: boolean;
}

export interface DeepSeekParams {
  model: string;
  max_tokens: number;
  messages: Message[];

  // stream: boolean;
  // stream_options?: StreamOptions;
  // temperature: number;
  thinking: Thinking
}


export interface Message {
  role: 'system' | 'user' | 'assistant';
  content: string;
}

export interface Thinking {
  type: string
}

export interface ChatCompletionChunk {
  id: string;
  object: string;
  created: number;
  model: string;
  choices: ChoiceItem[];
  usage: UsageItem;
}

interface ChoiceItem {
  index: number;
  message: deltaItem;
  logprobs: null;
  finish_reason: string | null;

}

interface deltaItem {
  role: string;
  reasoning_content: string
  content: string;
}

interface UsageItem {
  prompt_tokens: number;
  total_tokens: number;
  completion_tokens: number;
}