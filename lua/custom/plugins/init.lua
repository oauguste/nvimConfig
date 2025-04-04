-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'michhernand/RLDX.nvim',
    event = 'VeryLazy',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    opts = { filename = os.getenv 'HOME' .. '/cs/.rolodex/db.json' }, -- see configuration docs for details
    keys = {
      { '<leader>Xa', '<cmd>RldxAdd<CR>' },
      { '<leader>Xl', '<cmd>RldxLoad<CR>' },
      { '<leader>Xs', '<cmd>RldxSave<CR>' },
      { '<leader>Xd', '<cmd>RldxDelete<CR>' },
    },
  },
  {
    'zk-org/zk-nvim',
    config = function()
      require('zk').setup {
        -- See Setup section below
      }
    end,
  },
  {
    'saghen/blink.cmp',
    build = 'cargo +nightly build --release',
  },
}
