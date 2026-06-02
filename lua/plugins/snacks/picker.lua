local presets = { "vscode", "ivy", "telescope", "dropdown", "sidebar" }
local persist_path = vim.fn.stdpath "data" .. "/picker_layout"

local function load_preset()
    local f = io.open(persist_path, "r")
    if f then
        local p = f:read "*l"
        f:close()
        if p and vim.tbl_contains(presets, p) then
            return p
        end
    end
    return "vscode"
end

local function save_preset(preset)
    local f = io.open(persist_path, "w")
    if f then
        f:write(preset)
        f:close()
    end
end

local function switch_layout()
    vim.ui.select(presets, { prompt = "Picker layout: " }, function(choice)
        if not choice then
            return
        end
        save_preset(choice)
        Snacks.config.picker.layout = { preset = choice }
    end)
end

return {
    opts = {
        enabled = true,
        layout = { preset = load_preset() },
    },
    switch_layout = switch_layout,
}
