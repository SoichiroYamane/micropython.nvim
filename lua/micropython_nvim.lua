local run = require('micropython_nvim.run')
local setup = require('micropython_nvim.setup')
local utils = require('micropython_nvim.utils')
local repl = require('micropython_nvim.repl')
local project = require('micropython_nvim.project')

local MP = {}

function MP.repl()
  repl.repl()
end

function MP.run()
  run.mprun()
end

function MP.upload_current()
  run.mp_upload_current()
end

function MP.set_baud_rate()
  setup.show_baud_rate_list()
end

function MP.set_port()
  setup.set_port()
end

function MP.init()
  project.init()
end

function MP.statusline()
  return ' P:' .. _G['AMPY_PORT'] .. ' BR: ' .. _G['AMPY_BAUD']
end

function MP.exists()
  local cw_dir = vim.fn.getcwd()
  return vim.fn.glob(cw_dir .. '/.ampy') ~= ''
end

function MP.initialise()
  utils.readAmpyConfig()
  vim.api.nvim_create_user_command('MPRun', MP.run, {})
  vim.api.nvim_create_user_command('MPUpload', MP.upload_current, {})
  vim.api.nvim_create_user_command('MPSetBaud', MP.set_baud_rate, {})
  vim.api.nvim_create_user_command('MPSetPort', MP.set_port, {})
  vim.api.nvim_create_user_command('MPRepl', MP.repl, {})
  vim.api.nvim_create_user_command('MPInit', MP.init, {})
end

return MP
