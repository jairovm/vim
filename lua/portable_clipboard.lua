local M = {}

function M.setup()
  local osc52 = require('vim.ui.clipboard.osc52')
  local cached = { ['+'] = { {}, 'v' }, ['*'] = { {}, 'v' } }
  local function copy(register)
    local send = osc52.copy(register)
    return function(lines, regtype)
      cached[register] = { vim.deepcopy(lines), regtype }
      send(lines)
    end
  end
  vim.g.clipboard = {
    name = 'OSC 52 (copy only)',
    copy = { ['+'] = copy('+'), ['*'] = copy('*') },
    -- Do not query the host clipboard over SSH. Paste through the terminal.
    paste = {
      ['+'] = function() return cached['+'] end,
      ['*'] = function() return cached['*'] end,
    },
    cache_enabled = 0,
  }
end

return M
