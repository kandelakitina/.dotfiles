-- import null-ls plugin safely
local setup, lualine = pcall(require, "lualine")
if not setup then
  return
end

require('lualine').setup {
  options = {
		icons_enabled = true,
		theme = 'gruvbox',
	},
	sections = {
		lualine_a = {
			{
				-- Puts a full path of the file
				'filename',
				path = 1,
			}
		}
	}
}