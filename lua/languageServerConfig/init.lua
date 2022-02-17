require('languageServerConfig.tsserver')
require('languageServerConfig.cssls')
-- 在volar和vuels之间切换的时候，ale.rc.lua中关于vue的linter部分也要跟着切换:{'volar'}或{'eslint','vls'}
require('languageServerConfig.volar')
-- require('languageServerConfig.vuels')
