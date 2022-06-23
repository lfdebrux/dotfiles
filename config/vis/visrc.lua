-- load standard vis module, providing parts of the Lua API
require('vis')

-- load plugins
require('syntaxtheme')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set layout v')
	vis:command('set theme term')
	vis:command('set syntaxtheme peachpuff')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set show-tabs on')
	vis:command('set show-spaces on')

	vis:command('set tw 2')
	vis:command('set ai on')
	vis:command('set et on')
end)
