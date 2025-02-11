-- https://github.com/ahmedkhalf/project.nvim
-- 输出保存目录
-- :lua print(require("project_nvim.utils.path").historyfile)
-- 我的文件在
--  ~/.local/share/nvim/project_nvim/project_history

local status, project = pcall(require, "project_nvim")
if not status then
  vim.notify("没有找到 project_nvim")
  return
end

vim.g.nvim_tree_respect_buf_cwd = 1
project.setup({
  active = true,
  on_config_done = nil,
  manual_mod = false,
  detection_methods = { "lsp","pattern" },
  patterns = {
    "README.md",
    "Cargo.toml",
    "package.json",
    ".sln",
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
    "CMakeLists.txt",
  },
  exclude_dirs = {
    "cmake-build*"
  },

})

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "projects")
