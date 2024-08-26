-- require("chatgpt").setup({
        --     api_key_cmd = os.getenv("OPENAI_API_KEY")
    -- })


require("CopilotChat").setup {
    -- 自定义配置
    debug = true,  -- 启用 debug 模式
    chat_history = true,  -- 保存聊天历史
}
