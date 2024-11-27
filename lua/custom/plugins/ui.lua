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
          position = 'right',
          width = 30,
          mappings = {
            ['<C-n>'] = 'close_window',
            ['O'] = {
              command = function(state)
                local node = state.tree:get_node()
                local filepath = node.path
                local osType = os.getenv 'OS'

                local command

                if osType == 'Windows_NT' then
                  command = 'start ' .. filepath
                elseif osType == 'Darwin' then
                  command = 'open ' .. filepath
                else
                  command = 'xdg-open ' .. filepath
                end
                os.execute(command)
              end,
              desc = 'open_with_system_defaults',
            },
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
      require('bufferline').setup {
        options = {
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icon = level:match 'error' and ' ' or ' '
            return ' ' .. icon .. count
          end,
        },
      }
      vim.keymap.set('n', '<Tab>', '<cmd>bn<cr>', { desc = 'next buffer' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>bp<cr>', { desc = 'previous buffer' })
    end,
  },
}
