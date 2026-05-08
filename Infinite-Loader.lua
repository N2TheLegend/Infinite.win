-- // Infinite.win Loader — by NG/Cooler

-- // Config
local Branch = "main"
local BaseURL = "https://raw.githubusercontent.com/N2TheLegend/Infinite.win/refs/heads/" .. Branch .. "/"

local GameMap = {
    -- // Baddies
    [11158043705] = "Baddies-obfuscated.lua",

    -- // FF3 & FF3 Practice
    [81310542478972] = "Infinite-obfuscated.lua",
    [82866880824588] = "Infinite-obfuscated.lua"
}

-- // Loader
local PlaceId = game.PlaceId
local ScriptFile = GameMap[PlaceId]

if not ScriptFile then
    warn("[Infinite.win] Unsupported game — PlaceId: " .. tostring(PlaceId))
    return
end

local Success, Error = pcall(function()
    loadstring(game:HttpGet(BaseURL .. ScriptFile))()
end)

if not Success then
    warn("[Infinite.win] Failed to load " .. ScriptFile .. ": " .. tostring(Error))
end
