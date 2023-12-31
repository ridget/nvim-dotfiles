local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
	group = augroup("yank", { clear = true }),
})

-- FIXME use modelines instead?
local filegroup = augroup("filegroup", { clear = true })
autocmd("FileType", {
	pattern = "html",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
autocmd("FileType", {
	pattern = "css",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
autocmd("FileType", {
	pattern = "scss",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
autocmd("FileType", {
	pattern = "javascript",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 noexpandtab",
})
autocmd("FileType", {
	pattern = "ruby",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
autocmd("FileType", {
	pattern = "json",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
autocmd("FileType", {
	pattern = "lua",
	group = filegroup,
	command = "setlocal ts=2 sts=2 sw=2 noexpandtab",
})
autocmd("FileType", {
	pattern = "markdown",
	group = filegroup,
	-- Don't hide markdown elements
	command = "setlocal conceallevel=0",
})
-- Hide statusline on dashboard
autocmd("FileType", {
	pattern = "alpha",
	group = filegroup,
	command = "setlocal laststatus=0 noruler",
})

autocmd("BufRead", {
	-- I do not want the filetype to be htmldjango when it contains a {% ... %} string.
	pattern = "*.html",
	group = filegroup,
	command = "set filetype=html",
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*html.pm,*html.p,*xml.p,index.ptree",
	group = filegroup,
	callback = function()
		vim.cmd("set filetype=pollen")
		vim.opt_local.wrap = true
		vim.opt_local.ts = 2
		vim.opt_local.sts = 2
		vim.opt_local.sw = 2
		require("config.keymaps").pollen()
	end,
})

-- Cursor line only in active window
local cursorlinegroup = augroup("cursorlinegroup", { clear = true })
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = cursorlinegroup,
	pattern = "*",
	callback = function(x)
		-- Not sure how to hide this from certain file buffers?
		-- Maybe we can query for the filetype of buffer, and then exclude some things?
		-- This ignores the dashboard at least, which maybe is good enough?
		if string.len(x.file) > 0 then
			-- print(vim.inspect(x))
			vim.opt_local.cursorline = true
		end
	end,
})
autocmd("WinLeave", {
	group = cursorlinegroup,
	pattern = "*",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

local foldgroup = augroup("openfoldsgroup", { clear = true })
autocmd({ "BufReadPost", "FileReadPost" }, {
	group = foldgroup,
	pattern = "*.markdown,*.md",
	callback = function()
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
		-- Folds will start closed, this will force them all open
		vim.cmd("normal zR")
	end,
})

autocmd({ "BufReadPost", "FileReadPost" }, {
	group = foldgroup,
	pattern = "*.beancount",
	callback = function()
		vim.opt_local.foldmethod = "marker"
		vim.opt_local.foldtext = "v:folddashes.substitute(getline(v:foldstart),';?\\s*\\d*{{{','','g')"
		-- Sad panda
		-- vim.opt_local.foldexpr = "BeginningStarLevel()"
	end,
})
