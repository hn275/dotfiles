local markdown_options = {
  mkdp_auto_start = 0, -- Open preview window when entering the markdown buffer, fkin annoying
  mkdp_auto_close = 0, -- Same as above but for closing, best not to have it anyway
  mkdp_refresh_slow = 0, -- Refresh markdown when savethe buffer or leave from insert mode, if 0 then markdown is auto refresh as edit
  mkdp_command_for_global = 0, -- Set to 1 and MarkdownPreview can be used for all files
  mkdp_open_to_the_world = 0, -- Set to 1 and the preview server is available to others in your network
  mkdp_browser = '/usr/bin/firefox', -- Set Markdown browser to Firefox
  mkdp_theme = 'dark', -- Either dark or light
}

for key, value in pairs(markdown_options) do
  vim.api.nvim_set_var(key, value)
end
