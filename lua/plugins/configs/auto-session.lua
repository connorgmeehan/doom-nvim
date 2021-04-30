require('auto-session').setup({
	-- Sets the log level of the plugin (debug, info, error)
	logLevel = 'info',
	-- Root dir where sessions will be stored (/home/user/.config/nvim/sessions/)
	auto_session_root_dir = fn.stdpath('data') .. '/sessions/',
	-- Enables/disables auto save/restore
	auto_session_enabled = g.doom_autosave_sessions,
	-- Enable keeping track and loading of the last session
	auto_session_enable_last_session = g.doom_autoload_last_session,
})