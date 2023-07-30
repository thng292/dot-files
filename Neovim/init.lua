-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.colorcolumn = "80"

-- Hybrid line number stuff
function relativeln(target)
	if vim.b.lnstatus == nil then
		vim.b.lnstatus = "number"
	end

	if vim.b.lnstatus ~= "nonumber" then
		if target == "number" then
			vim.o.number = true
			vim.o.relativenumber = false
		else
			vim.o.number = true
			vim.o.relativenumber = true
		end
	else
		vim.o.number = false
	end
end

-- Show relative line number when in command mode and absolute line number in edit mode
local _group = vim.api.nvim_create_augroup("LineNumber", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		relativeln("number")
	end,
	once = true,
	group = _group,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		relativeln("relativenumber")
	end,
	once = true,
	group = _group,
})
vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	callback = function()
		relativeln("number")
	end,
	once = true,
	group = _group,
})
vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = "*",
	callback = function()
		relativeln("relativenumber")
	end,
	once = true,
	group = _group,
})


