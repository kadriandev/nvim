local home = os.getenv 'HOME'
local workspace_path = home .. '/.cache/jdtls/workspace/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name
local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
local java_debug_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
local java_test_path= require("mason-registry").get_package("java-test"):get_install_path()

local bundles = {
	vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(java_test_path .. "/java-test/extension/server/*.jar", "\n"))

local status, jdtls = pcall(require, 'jdtls')
if not status then
  return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' ..  jdtls_path .. "/lombok.jar",
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
    '-configuration', jdtls_path .. '/config_mac',
    '-data', workspace_dir,
  },
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", 'pom.xml'}),
  on_attach = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })

    vim.keymap.set("n", "<leader>vc", jdtls.test_class, { desc = "Test class (DAP)" });
    vim.keymap.set("n", "<leader>vm", jdtls.test_nearest_method, {desc = "Test method (DAP)"})

  end,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      signatureHelp = { enabled = true },
      extendedClientCapabilities = extendedClientCapabilities,
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all', -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
}
require('jdtls').start_or_attach(config)

