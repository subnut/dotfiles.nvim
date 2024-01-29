-- vim: et ts=2 sts=2 sw=2

local ret = {}

local function install_pckr()
  if vim.fn.exepath("git") == "" then
    vim.cmd.echohl("ErrorMsg")
      vim.cmd.echomsg("'git: command not found'")
    vim.cmd.echohl("None")
    return false
  end
  vim.cmd.echomsg("'Installing packer.nvim'")
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/lewis6991/pckr.nvim",
    pckr_path
  })
  if not vim.v.shell_error == 0 then
    vim.cmd.echomsg("'packer.nvim installation failed'")
    return false
  end
  return true
end


function ret.ensure_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if vim.loop.fs_stat(pckr_path) then 
    -- Already installed.
    vim.opt.rtp:prepend(pckr_path)
    return true
  end
  vim.cmd.echohl("WarningMsg")
    vim.cmd.echomsg("'pckr.nvim not installed'")
  vim.cmd.echohl("None")
  if not install_pckr() then
    vim.cmd.echohl("WarningMsg")
      vim.cmd.echomsg("'plugins disabled.'")
    vim.cmd.echohl("None")
    return false
  end
  vim.opt.rtp:prepend(pckr_path)
  return true
end

return ret
