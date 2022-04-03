local create_plugin = {}

-- if a module is mature enough then move the module into its own plugin.
-- use:
--  boilit
--  refactor
--  ghq
--
--  to migrate a module into a new plugin.

create_plugin.cmd = {
  { "CreatePlugin", function() end },
  { "CreatePluginMigrateByname", function() end },
}

return create_plugin
