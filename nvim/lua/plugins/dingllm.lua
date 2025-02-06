return {
    'yacineMTB/dingllm.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local system_prompt =
        'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks'
        local helpful_prompt = 'You are a helpful assistant. What I have sent are my notes so far.'
        local dingllm = require 'dingllm'

        local function groq_replace()
            dingllm.invoke_llm_and_stream_into_editor({
                url = 'https://api.groq.com/openai/v1/chat/completions',
                model = 'deepseek-r1-distill-llama-70b',
                api_key_name = 'GROQ_API_KEY',
                system_prompt = system_prompt,
                replace = true,
            }, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
        end

        local function groq_help()
            dingllm.invoke_llm_and_stream_into_editor({
                url = 'https://api.groq.com/openai/v1/chat/completions',
                model = 'deepseek-r1-distill-llama-70b',
                api_key_name = 'GROQ_API_KEY',
                system_prompt = helpful_prompt,
                replace = false,
            }, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
        end

        vim.keymap.set({ 'n', 'v' }, '<leader>k', groq_replace, { desc = 'llm groq' })
        vim.keymap.set({ 'n', 'v' }, '<leader>K', groq_help, { desc = 'llm groq_help' })
    end,
}

