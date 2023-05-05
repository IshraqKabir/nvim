local status_ok, dn = pcall(require, "dark_notify")
if not status_ok then
	print("dark_notify not found!")
	return
end

dn.run({
	schemes = {
		-- you can use a different colorscheme for each
		dark = "catppuccin-mocha",
		-- even a different `set background=light/dark` setting or lightline theme
		-- if you use lightline, you may want to configure lightline themes,
		-- even if they're the same one, especially if the theme reacts to :set bg
		light = "tokyonight-day",
	},
	onchange = function(mode)
		print("mode changed to: " .. mode)
		-- optional, you can configure your own things to react to changes.
		-- this is called at startup and every time dark mode is switched,
		-- either via the OS, or because you manually set/toggled the mode.
		-- mode is either "light" or "dark"
	end,
})
