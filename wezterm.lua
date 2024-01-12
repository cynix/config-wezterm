local wezterm = require('wezterm')
local action = wezterm.action
local config = {}

config.canonicalize_pasted_newlines = 'LineFeed'

config.initial_cols = 180
config.initial_rows = 50

config.color_scheme = 'kanagawa (Gogh)'
config.colors = {
  selection_bg = '#fffacd',
  selection_fg = '#000000',
}

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14.5

config.disable_default_key_bindings = true
config.keys = {
  { key = 'q', mods = 'CMD', action = action.QuitApplication },
  { key = 't', mods = 'CMD', action = action.SpawnTab('CurrentPaneDomain') },
  { key = 'V', mods = 'CMD|SHIFT', action = action.PasteFrom('Clipboard') }
}

for i = 1, 9 do
  table.insert(config.keys, { key = tostring(i), mods = 'SUPER', action = wezterm.action.ActivateTab(i - 1) })
end

for i = string.byte('a'), string.byte('z') do
  local c = string.char(i)
  if c ~= 'q' and c ~= 't' then
    table.insert(config.keys, { key = c, mods = 'CMD', action = wezterm.action.SendKey({ key = c, mods = 'CTRL' }) })
  end
end

return config
