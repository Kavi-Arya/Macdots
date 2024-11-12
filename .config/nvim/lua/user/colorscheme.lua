local M = {
  -- "LunarVim/darkplus.nvim",
  "sainnhe/gruvbox-material",
  -- "shaunsingh/nord.nvim",
  -- "slugbyte/lackluster.nvim",
  -- "sainnhe/everforest",
  -- "catppuccin/nvim",
}

function M.config()
  vim.cmd.colorscheme "gruvbox-material"
end

return M
