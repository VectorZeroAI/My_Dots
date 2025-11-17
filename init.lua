-- basic options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.numberwidth = 4
vim.opt.cursorline = true

vim.o.ignorecase = true

-- auto center stuff

vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
		callback = funktion()
				local win = 0
				local view = vim.fn.winsaveview()

				-- compute new topline so cursor stays centeered vertically
				local height = vim.api.nvim_win_get_height(win)
				local cursor_line = view.lnum
				local new_top = cursor_line - math.floor(height / 2)
				
				if new_top < 1 then new_top = 1 end

				view.topline = new_top
				vim.fn.winrestview(view)
		end, 

})

-- bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
				"git",
				"clone",
				"--filter=blob:none",
				"https://github.com/folke/lazy.nvim.git",
				lazypath,
		})
end

vim.opt.rtp:pretend(lazypath)

-- ================ LSP configuration ============== 