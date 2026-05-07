vim.cmd.colorscheme("tokyonight")

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.g.mapleader = " "

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.format_on_save = true
local function toggle_format_on_save()
	vim.g.format_on_save = not vim.g.format_on_save
	if vim.g.format_on_save == true then
		print("Format on save: true")
	else
		print("Format on save: false")
	end
end

vim.g.tab_len = 2
local function toggle_tab_len(log_change)
	-- local tab_len = 8
	-- local short_tab = 4
	-- local short_tab = 4
	-- vim.g.tab_len = not vim.g.tab_len
	vim.g.tab_len = 2 * vim.g.tab_len
	if vim.g.tab_len == 16 then
		vim.g.tab_len = 2
	end
	vim.o.tabstop = vim.g.tab_len
	vim.o.softtabstop = vim.g.tab_len
	vim.o.shiftwidth = vim.g.tab_len
	if log_change then
		print("Tab toggled to: " .. vim.g.tab_len)
	end
end

toggle_tab_len(false)

vim.keymap.set({ "n" }, "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition)
vim.keymap.set({ "n" }, "gr", vim.lsp.buf.references)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set({ "n", "v" }, "<leader>cd", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v" }, "<leader>cf", toggle_format_on_save)
vim.keymap.set({ "n", "v" }, "<leader>ct", function() toggle_tab_len(true) end)
vim.keymap.set({ "n", "v" }, "<leader>ch", ":LspClangdSwitchSourceHeader<cr>")

-- be a man and use fuzzy finder, harpoon or something
-- vim.keymap.set({ "n", "v" }, "<leader>pe", "<cmd>Ex<cr>")

vim.lsp.enable({
	"lua_ls", "pyright", "clangd", "cmake", "docker_language_service"
})

-- Source - https://stackoverflow.com/a
-- Posted by Blomiir, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-12-12, License - CC BY-SA 4.0
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" and vim.g.format_on_save == true then
			vim.cmd('lua vim.lsp.buf.format()')
		else
		end
	end
})
