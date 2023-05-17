local type_lib      = require 'nd.lib.core.type'
local assert_lib    = require 'nd.lib.core.assert'

local is_tab        = type_lib.is_tab

local nd_assert     = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err        = assert_lib.get_err_fn 'nd.res.core.language.nvim.lsp'

local bash_fn       = require 'nd.res.core.language.nvim.lsp.bash'
local lua_fn        = require 'nd.res.core.language.nvim.lsp.lua'
local cmake_fn      = require 'nd.res.core.language.nvim.lsp.cmake'
local cpp_fn        = require 'nd.res.core.language.nvim.lsp.cpp'
local glsl_fn       = require 'nd.res.core.language.nvim.lsp.glsl'
local rust_fn       = require 'nd.res.core.language.nvim.lsp.rust'
local haskell_fn    = require 'nd.res.core.language.nvim.lsp.haskell'
local csharp_fn     = require 'nd.res.core.language.nvim.lsp.csharp'
local sql_fn        = require 'nd.res.core.language.nvim.lsp.sql'
local html_fn       = require 'nd.res.core.language.nvim.lsp.html'
local css_fn        = require 'nd.res.core.language.nvim.lsp.css'
local typescript_fn = require 'nd.res.core.language.nvim.lsp.typescript'
local json_ls       = require 'nd.res.core.language.nvim.lsp.json'
local yaml_fn       = require 'nd.res.core.language.nvim.lsp.yaml'
local toml_fn       = require 'nd.res.core.language.nvim.lsp.toml'

return function(config)
    nd_assert(is_tab(config), nd_err, 'fn(): config must be of type table')

    return {
        { 'bashls',        bash_fn(config.bash) },
        { 'lua_ls',        lua_fn(config.lua) },

        { 'cmake',         cmake_fn(config.cmake) },
        { 'ccls',          cpp_fn(config.cpp) },
        { 'glslls',        glsl_fn(config.glsl) },
        { 'rust_analyzer', rust_fn(config.rust) },
        { 'hls',           haskell_fn(config.haskell) },

        { 'omnisharp',     csharp_fn(config.csharp) },
        { 'sqlls',         sql_fn(config.sql) },
        { 'html',          html_fn(config.html) },
        { 'cssls',         css_fn(config.css) },
        { 'tsserver',      typescript_fn(config.typescript) },

        { 'jsonls',        json_ls(config.json) },
        { 'yamlls',        yaml_fn(config.yaml) },
        { 'taplo',         toml_fn(config.toml) },
    }
end
