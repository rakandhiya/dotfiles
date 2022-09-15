local wezterm = require "wezterm"
local mux = wezterm.mux

-- maximize wezterm on startup
wezterm.on("gui-startup", function ()
	local tab, pane, window = mux.spawn_window {}
	window:gui_window():maximize()
end)

function selectDefaultProgram() 
	if wezterm.target_triple == 'x86_64-pc-windows-msvc' then 
		return { "powershell.exe" }
	end
	
	return { "usr/bin/zsh" }
end

return {
	-- color scheme
	color_scheme = "AyuDark (Gogh)",

	-- cursor
	default_cursor_style = "SteadyBar",

	-- window settings	
	window_padding = {
  	left = 0,
    right = 0,
    top = 0,
    bottom = 0,
	},
	
	-- tab bar settings
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,
	tab_max_width = 20,

	-- scroll bar
	enable_scroll_bar = false,

	-- font settings
	font = wezterm.font "JetBrainsMono NF",
	font_size = 10.0,
	
	-- default program/shell to launch
	default_prog = selectDefaultProgram(),
	
	-- keybindings
	keys = {
		{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher }
	}
}
