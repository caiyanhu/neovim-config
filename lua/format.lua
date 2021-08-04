local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%cL %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true,
}

local prettier ={
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}

return {
    css = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {prettier},
    ["javascript.jsx"] = {prettier},
    typescript = {prettier},
    ["typescript.tsx"] = {prettier},
    typescriptreact = {eslint, prettier},
    html = {prettier},
    json = {prettier},
    scss = {prettier},
    yaml = {prettier}
}
