require('vis')

styles_to_preserve = {
	'STYLE_DEFAULT',
	'STYLE_WHITESPACE',
	'STYLE_CURSOR',
	'STYLE_CURSOR_PRIMARY',
	'STYLE_SELECTION',
	'STYLE_STATUS',
	'STYLE_STATUS_FOCUSED',
	'STYLE_SEPARATOR',
}

vis:option_register("syntaxtheme", "string", function(name)
	local old_styles = {}

	for i, k in ipairs(styles_to_preserve) do
		old_styles[k] = vis.lexers[k]
	end

	if name ~= nil then
		local theme = 'themes/'..name
		package.loaded[theme] = nil
		require(theme)
	end

	for i, k in ipairs(styles_to_preserve) do
		vis.lexers[k] = old_styles[k]
	end

	-- needed to propogate changes from restoring old styles
	vis.lexers.lexers = {}

	for win in vis:windows() do
		win:set_syntax(win.syntax)
	end

	return true
end, "Set theme for syntax highlighting only")
