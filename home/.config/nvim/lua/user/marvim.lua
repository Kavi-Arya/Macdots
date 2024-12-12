local M = {
  "chamindra/marvim",
  init = function()
    vim.g.marvim_store = '/usr/local/.marvim'
    vim.g.marvim_find_key = '<leader>mM'
    vim.g.marvim_store_key = 'ms'
    vim.g.marvim_register = 'c'
    vim.g.marvim_prefix = 0
  end
}


return M
