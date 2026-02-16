local M = {}

function M.setup()
    local jdtls_home = os.getenv("JDTLS_HOME")
    if not jdtls_home then
        error("JDTLS_HOME not defined! eg.: export JDTLS_HOME=$HOME/.local/share/jdtls")
    end

    local lombok_jar_path = os.getenv("LOMBOK_JAR_PATH")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") ..
        package.config:sub(1, 1) .. "jdtls-workspace" .. package.config:sub(1, 1) .. project_name

    -- detecta o launcher jar mais recente
    local handle = io.popen("ls " .. jdtls_home .. "/plugins/org.eclipse.equinox.launcher*.jar | sort -V | tail -n 1")

    if not handle then
        error("Fail to find jdtls launcher JAR")
    end

    local launcher_jar = handle:read("*a"):gsub("\n", "")
    handle:close()

    local cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        launcher_jar,
        "-configuration",
        jdtls_home .. "/config_linux",
        "-data",
        workspace_dir,
    }

    if lombok_jar_path and lombok_jar_path ~= "" then
        table.insert(cmd, 2, "-javaagent:" .. lombok_jar_path)
    end

    local config = {
        name = "jdtls",
        cmd = cmd,
        root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
        settings = {
            java = {}
        },
        init_options = {
            bundles = {}
        },
    }

    require('jdtls').start_or_attach(config)
end

return M
