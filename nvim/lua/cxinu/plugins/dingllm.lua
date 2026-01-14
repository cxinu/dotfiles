return {
  "yacineMTB/dingllm.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local dingllm = require "dingllm"
    local replace_prompt = "SYSTEM: You are a raw text-replacement engine for a code editor. "
      .. "TASK: Rewrite the code to satisfy the comments. "
      .. "CRITICAL RULES: "
      .. "1. DO NOT USE MARKDOWN. NO BACKTICKS (```). "
      .. "2. EVERY CHARACTER you output is written directly to a source file. Prose will break the build. "
      .. "3. Remove the specific comments/instructions you have fulfilled. "
      .. "4. Output ONLY valid source code."

    local explain_prompt = "SYSTEM: You are a real-time code completion stream. "
      .. "TASK: Continue the code or notes provided. "
      .. "CRITICAL RULES: "
      .. "1. DO NOT USE BACKTICKS. NO MARKDOWN. "
      .. "2. DO NOT REPEAT the code I sent you. Only stream the NEW characters. "
      .. "3. If you write prose, you MUST use the correct comment syntax for the language (e.g., // or #). "
      .. "4. You are writing directly into a live buffer; do not yap."

    local doc_prompt = "SYSTEM: You are a professional source-code documenter. "
      .. "TASK: Add high-quality docstrings/comments to the provided code. "
      .. "CRITICAL RULES: "
      .. "1. NO MARKDOWN. NO BACKTICKS. "
      .. "2. Return the ORIGINAL CODE with the STANDARD DOCUMENTATION COMMENTS added. "
      .. "3. Use standard conventions (Doxygen, JSDoc, etc.) based on the language. "
      .. "4. Do not explain what you did; just output the documented code."

    local function groq_replace()
      dingllm.invoke_llm_and_stream_into_editor({
        url = "https://api.groq.com/openai/v1/chat/completions",
        model = "llama-3.3-70b-versatile",
        api_key_name = "GROQ_API_KEY",
        system_prompt = replace_prompt,
        replace = true,
      }, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
    end

    local function groq_explain()
      dingllm.invoke_llm_and_stream_into_editor({
        url = "https://api.groq.com/openai/v1/chat/completions",
        model = "llama-3.3-70b-versatile",
        api_key_name = "GROQ_API_KEY",
        system_prompt = explain_prompt,
        replace = false,
      }, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
    end

    local function groq_doc()
      dingllm.invoke_llm_and_stream_into_editor({
        url = "https://api.groq.com/openai/v1/chat/completions",
        model = "llama-3.3-70b-versatile",
        api_key_name = "GROQ_API_KEY",
        system_prompt = doc_prompt,
        replace = true,
      }, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
    end

    vim.keymap.set({ "n", "v" }, "<leader>kr", groq_replace, { desc = "groq replace" })
    vim.keymap.set({ "n", "v" }, "<leader>ke", groq_explain, { desc = "groq explain" })
    vim.keymap.set({ "n", "v" }, "<leader>kd", groq_doc, { desc = "groq document" })
  end,
}
