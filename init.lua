-- vim: et ts=2 sts=2 sw=2
vim.g.mapleader = " "

vim.o.undofile = true
vim.o.splitbelow = true

if vim.g.neovide then
  vim.keymap.set({'n', 'v', 'o'}, "<leader>p", '"+p')

  vim.g.neovide_theme = "auto"
  vim.g.neovide_scroll_animation_length = 0.05
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_animate_command_line = false
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

require'config.plugins'
