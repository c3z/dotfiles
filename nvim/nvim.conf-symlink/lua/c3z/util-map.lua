-- Code copied from https://github.com/lazytanuki/nvim-mapper
-- It defines functions to create searchable keys maps (which have
-- descriptions) with fallback to neovim native functions in case when
-- nvim-mapper is not present.

local M = {}

local function is_module_available(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == "function" then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

local wk = require("which-key")
if is_module_available("nvim-mapper") then
    local mapper = require("nvim-mapper")

    M.map = function(mode, keys, cmd, options, category, unique_identifier, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        mapper.map(mode, keys, cmd, options, category, unique_identifier, description)
    end
    M.map_buf = function(bufnr, mode, keys, cmd, options, category, unique_identifier, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        mapper.map_buf(bufnr, mode, keys, cmd, options, category, unique_identifier, description)
    end
    M.map_virtual = function(mode, keys, cmd, options, category, unique_identifier, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        mapper.map_virtual(mode, keys, cmd, options, category, unique_identifier, description)
    end
    M.map_buf_virtual = function(mode, keys, cmd, options, category, unique_identifier, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        mapper.map_buf_virtual(mode, keys, cmd, options, category, unique_identifier, description)
    end
else
    M.map = function(mode, keys, cmd, options, _, _, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        vim.api.nvim_set_keymap(mode, keys, cmd, options)
    end
    M.map_buf = function(mode, keys, cmd, options, _, _, description)
        wk.register({ [keys] = { description } }, { mode = mode })
        vim.api.nvim_buf_set_keymap(mode, keys, cmd, options)
    end
    M.map_virtual = function(mode, keys, _, _, _, _, description)
        wk.register({ [keys] = { description } }, { mode = mode })
    end
    M.map_buf_virtual = function(mode, keys, _, _, _, _, description)
        wk.register({ [keys] = { description } }, { mode = mode })
    end
end

return M
