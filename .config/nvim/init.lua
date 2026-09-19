vim.pack.add({
  { src = 'https://github.com/sainnhe/gruvbox-material' },
})

vim.cmd.colorscheme("gruvbox-material")

-- not configurable deps
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" }
})

vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" }
})

vim.pack.add({ "https://github.com/phrmendes/todotxt.nvim" })

vim.filetype.add({
  filename = {
    ["todo.txt"] = "todotxt",
  },
})

require("todotxt").setup({
  todotxt = vim.env.HOME .. "/notes/todo/todo.txt",
  -- donetxt = vim.env.HOME .. "/Documents/notes/done.txt",
  max_priority = "Z",
  metadata = {
    -- asc/desc strings
    tag = { sort = "asc" },
    due = { sort = "desc" },
    -- custom comparator: a comes before b if tonumber(a) < tonumber(b)
    effort = { sort = function(a, b) return tonumber(a) < tonumber(b) end },
  },
  ghost_text = {
    enable = true,
    mappings = {
      ["(A)"] = "today",
      ["(B)"] = "tomorrow",
      ["(C)"] = "this week",
    },
  },
})

vim.pack.add({
    { src = "https://github.com/3rd/image.nvim" }
})

-- TODO to configure for you likings
-- https://github.com/3rd/image.nvim#integrations-1
-- TODO in general add obsidian here and sync obsidian from work
-- https://github.com/3rd/image.nvim/issues/190#issuecomment-2378156235
-- TODO tmux integration in general
-- https://github.com/3rd/image.nvim#tmux

require("image").setup({
  backend = "kitty", -- or "ueberzug" or "sixel"
  processor = "magick_cli", -- or "magick_rock"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup", -- or "inline"
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki", "telekasten" }, -- markdown extensions (ie. quarto) can go here
    },
    asciidoc = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup",
      floating_windows = false,
      filetypes = { "asciidoc", "adoc" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    rst = {
      enabled = true,
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  scale_factor = 1.0,
  kitty_direct_chunk_size = 4096, -- chunk size for direct Kitty graphics protocol transmission
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

vim.pack.add({ 
  { src = "https://github.com/nvim-telekasten/telekasten.nvim" }
})

require('telekasten').setup({
  home = vim.fn.expand("~/notes/zettel"), -- Put the name of your notes directory here
})
