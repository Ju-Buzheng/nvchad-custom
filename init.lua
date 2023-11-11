-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- Powershell setting
local isWindows = function ()
  local arch = os.getenv("os")
  if arch and string.match(arch, "Windows") then
    return true
  end
  return false
end

if isWindows() then
  local cmd = "pwsh.exe"
  local avaiable = vim.fn.executable(cmd)
  vim.o.shell = avaiable and cmd or "powershell.exe"
  vim.o.shellcmdflag =  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
  vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  vim.o.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
  vim.o.shellquote = nil
  vim.o.shellxquote = nil
end

-- intent setting
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua,yml,yaml",
  callback = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})
