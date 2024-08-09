return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<C-n>', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
    },
    opts = {
      -- file_size = {
      --   enabled = false,
      -- },
      -- type = {
      --   enabled = false,
      -- },
      -- last_modified = {
      --   enabled = false,
      -- },
      -- created = {
      --   enabled = false,
      -- },
      filesystem = {
        window = {
          width = 30,
          mappings = {
            ['<C-n>'] = 'close_window',
          },
        },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
      vim.keymap.set('n', '<Tab>', '<cmd>bp<cr>', { desc = 'next buffer' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>bp<cr>', { desc = 'previous buffer' })
    end,
  },
}
