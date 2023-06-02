vim.o.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") ~= 0 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "minilab"

local hi_set = function(group)
  vim.cmd(
    "hi! "    .. group.name ..
    " guifg=" .. (group.fg   or "NONE") ..
    " guibg=" .. (group.bg   or "NONE") ..
    " gui="   .. (group.attr or "NONE")
  )
end

local hi_link = function(group)
  vim.cmd("hi! link " .. group.dst .. " " .. (group.src or "NONE"))
end

local theme = require "theme"

for _,group in pairs(theme.set)  do hi_set(group)  end
for _,group in pairs(theme.link) do hi_link(group) end
