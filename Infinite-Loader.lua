-- // Infinite.win Loader — by NG/Cooler

-- // Config
local Branch = "main"
local BaseURL = "https://raw.githubusercontent.com/N2TheLegend/Infinite.win/refs/heads/" .. Branch .. "/"

-- // Services
local Players = game:GetService("Players")

-- // Variables
local LocalPlayer = Players.LocalPlayer
local GameMap = {
    -- // Baddies
    [11158043705] = "Baddies-obfuscated.lua",

    -- // FF3 & FF3 Practice
    [81310542478972] = "Infinite-obfuscated.lua",
    [82866880824588] = "Infinite-obfuscated.lua",

    -- // SlimeRNG
    [92416421522960] = "SlimeRNG-obfuscated.lua",

    -- // World Fighters
    [95630541662383] = "WorldFighters-obfuscated.lua",

    [96090419825540] = "IncPiece-obfuscated.lua"
}

-- // Loader
local PlaceId = game.PlaceId
local ScriptFile = GameMap[PlaceId]

if not ScriptFile then
    LocalPlayer:Kick("[Infinite.win]: This game is not supported.")
    return
end

local Success, Error = pcall(function()
    loadstring(game:HttpGet(BaseURL .. ScriptFile))()
end)

if not Success then
    LocalPlayer:Kick("[Infinite.win]:\nFailed to load script.\n" .. tostring(Error))
end
