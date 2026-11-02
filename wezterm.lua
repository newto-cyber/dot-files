local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- ==========================================
-- Wayland & Fedora Desktop Optimizations
-- ==========================================

-- Ensure native Wayland backend is used (avoids blurry XWayland scaling)
config.enable_wayland = true

-- Default ColorScheme
config.color_scheme= 'OneDark (Gogh)'

-- Wayland blur support (works on compositors supporting org_kde_kwin_blur)
config.window_background_opacity = 0.88
config.wayland_window_background_blur = true
config.text_background_opacity=0.3

config.colors = {
    background = '#000000' ,
}

-- Borderless / clean look
config.window_decorations = "RESIZE"

-- ==========================================
-- Appearance & Colors
-- ==========================================

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 11.0

-- Window padding
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- Hide tabs when only one session/tab is active
config.hide_tab_bar_if_only_one_tab = true

-- ==========================================
-- Performance & Integration
-- ==========================================

-- EGL provides smooth GPU-accelerated rendering on modern Fedora mesa drivers
config.prefer_egl = true

-- Smooth cursor animation
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 600

-- ==========================================
-- Multiplexer & Keybindings
-- ==========================================

-- Set 'Ctrl + a' as the Leader key.
-- You have 1000 milliseconds to press the next key after hitting Ctrl+a.
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Press 'Ctrl+a', release, then press 'v' to split vertically (left/right)
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- Press 'Ctrl+a', release, then press 'h' to split horizontally (top/bottom)
  {
    key = 'h',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Press 'Ctrl+a', release, then press 'x' to close the current pane
  {
    key = 'x',
    mods = 'LEADER',
    action = act.CloseCurrentPane { confirm = true },
  },

  -- ==========================================
  -- Pane Navigation
  -- ==========================================

  -- Press 'Ctrl+a', release, then press an Arrow Key to switch active panes
  { key = 'LeftArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Down' }
}




return config
