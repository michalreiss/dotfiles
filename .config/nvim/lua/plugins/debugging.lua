return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
        -- init plugins
		local dapgo = require("dap-go")
		local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
		dapgo.setup()
		require("nvim-dap-virtual-text").setup()

        -- dap listeners
        dap.listeners.after.event_initialized["dapui_config"] = function ()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function ()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function ()
            dapui.close()
        end

        -- keymaps
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<leader>dt", dapgo.debug_test)
	end,
}
