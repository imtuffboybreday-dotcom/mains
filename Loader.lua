local CONFIG_URL = "https://raw.githubusercontent.com/imtuffboybreday-dotcom/LeoWinners/main/Config.lua"
local CORE_URL = "https://raw.githubusercontent.com/imtuffboybreday-dotcom/LeoWinners/main/Core.lua"

local function fetch(url)
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or type(result) ~= "string" or #result == 0 then
        return nil
    end

    return result
end

local function execute(source)
    local ok, result = pcall(function()
        local fn = loadstring(source)
        if type(fn) ~= "function" then
            return nil
        end
        return fn()
    end)

    if not ok then
        return nil
    end

    return result
end

local configSource = fetch(CONFIG_URL)
if not configSource then
    return
end

local Config = execute(configSource)
if type(Config) ~= "table" then
    return
end

local coreSource = fetch(CORE_URL)
if not coreSource then
    return
end

local Core = execute(coreSource)
if type(Core) ~= "function" then
    return
end

pcall(Core, Config)