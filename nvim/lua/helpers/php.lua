local M = {}

M.php_project_version = function(root_dir)
    local lock_path = root_dir .. "/composer.lock"
    if vim.fn.filereadable(lock_path) == 1 then
        local lines = vim.fn.readfile(lock_path)
        local decoded = vim.fn.json_decode(table.concat(lines, "\n"))

        if decoded and decoded.packages then
            local versions = {}
            for _, pkg in ipairs(decoded.packages) do
                if pkg.require and pkg.require.php then
                    local php_req = pkg.require.php
                    local match = string.match(php_req, "(%d+%.%d+)")
                    if match then
                        table.insert(versions, tonumber(match))
                    end
                end
            end
            if #versions > 0 then
                table.sort(versions)
                return versions[1]
            end
        end
    end
    return nil
end

return M
