return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-orgmode/telescope-orgmode.nvim',
    'nvim-orgmode/org-bullets.nvim',
  },
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '~/cs/orgfiles/**/*',
      org_default_notes_file = '~/cs/orgfiles/refile.org',
      org_capture_templates = {
        r = {
          description = 'Notes',
          template = '* Notes on %?\n %u',
          target = '~/cs/orgfiles/notes.org',
        },
      },
    }
    require('org-bullets').setup()
    require('blink.cmp').setup {
      sources = {
        per_filetype = {
          org = { 'orgmode' },
        },
        providers = {
          orgmode = {
            name = 'Orgmode',
            module = 'orgmode.org.autocompletion.blink',
            fallbacks = { 'buffer' },
          },
        },
      },
    }

    require('telescope').load_extension 'orgmode'
    vim.keymap.set('n', '<leader>sx', require('telescope').extensions.orgmode.refile_heading, { desc = 'Orgmode refile heading' })
    vim.keymap.set('n', '<leader>so', require('telescope').extensions.orgmode.search_headings, { desc = 'Orgmode search headings' })
    vim.keymap.set('n', '<leader>si', require('telescope').extensions.orgmode.insert_link, { desc = 'Orgmode insert link ' })
  end,

  -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
  -- add ~org~ to ignore_install
  -- require('nvim-treesitter.configs').setup({
  --   ensure_installed = 'all',
  --   ignore_install = { 'org' },
  -- })
}
