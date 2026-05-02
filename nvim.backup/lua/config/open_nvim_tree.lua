local function open_nvim_tree(data)
	--- buffer is a real file
	local real_file = vim.fn.filereadable(data.file) == 1
	
	--- buffer is a [No name]
	local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

	--- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if real_file or no_name then
		require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
	end

	if directory then
		vim.cmd.cd(data.file)
		
		require('nvim-tree.api').tree.open()
	end

	--- don't do anything if not above
	return
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

