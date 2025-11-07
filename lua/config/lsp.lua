require("mason").setup()
require("mason-lspconfig").setup()

-- List of LSP servers, add more servers if needed
-- Custom language config stuff should be put in after/ftplugin
local servers = {
	"lua_ls",
	"clangd",
}

-- ensure lsp servers are installed
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Enable all LSP servers
for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

vim.diagnostic.config({
	virtual_text = true,  -- show inline messages
	signs = true,         -- show signs in the gutter
	underline = true,     -- underline problematic text
	update_in_insert = false, -- don't update diagnostics while typing
	severity_sort = true,     -- sort diagnostics by severity
})

--[[ vim.lsp.config('harper_ls', {
 settings = {
    ["harper-ls"] = {
      userDictPath = "",
      workspaceDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000,
      ignoredLintsPath = "",
      excludePatterns = {}
    }
  }
}) --]]

