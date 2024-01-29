if not require'config.helpers'.ensure_pckr()
  then return
end

require'pckr'.add{
  "junegunn/fzf.vim";
  "NLKNguyen/papercolor-theme";

  { "jiaoshijie/undotree",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require'undotree'.setup()
      vim.keymap.set("n", "<leader>u", require'undotree'.toggle)
    end
  };
  { "windwp/nvim-autopairs",
    config = function()
      require'nvim-autopairs'.setup()
    end
  };
  { "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end
  };
}

-- vim: et ts=2 sts=2 sw=2
