return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    'theHamsta/nvim-dap-virtual-text',
    "nvim-neotest/nvim-nio"
  },
  config = function ()
    require("dapui").setup()

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Open DAP Ui"})
    vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<cr>", { desc = "Reset DAP Ui"})
  end
}
