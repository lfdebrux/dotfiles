-- load standard vis module, providing parts of the Lua API
require('vis')

-- load plugins
require('editorconfig/editorconfig')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set show-tabs on')
	vis:command('set show-spaces on')
end)
