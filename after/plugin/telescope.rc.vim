if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <C-N> :Telescope file_browser<CR>
nnoremap <silent> <C-F> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> ;t <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> ;; <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <silent> ;e <cmd>lua require('telescope.builtin').diagnostics()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')


telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },

  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
  },
  
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
│   },
  },
}

require("telescope").load_extension "file_browser"

EOF


