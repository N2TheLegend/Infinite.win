-- // Infinite.win Loader — by NG/Cooler

-- // Config
local Branch = "main"
local BaseURL = "https://raw.githubusercontent.com/N2TheLegend/Infinite.win/refs/heads/" .. Branch .. "/"

-- // Services
local Players = game:GetService("Players")
local CoreGui = cloneref(game:GetService("CoreGui"))

-- // Variables
local LocalPlayer = Players.LocalPlayer
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

-- // Functions
local function ShowError(Title, Body)
    LocalPlayer:Kick()

    local ErrorPrompt = CoreGui:FindFirstChild("RobloxPromptGui")
    if not ErrorPrompt then return end

    local PromptOverlay = ErrorPrompt:FindFirstChild("promptOverlay")
    if not PromptOverlay then return end

    local ErrorDialog = PromptOverlay:FindFirstChild("ErrorPrompt", true)
    if not ErrorDialog then return end

    local TitleLabel = ErrorDialog:FindFirstChild("TitleFrame", true) and ErrorDialog:FindFirstChild("TitleFrame", true):FindFirstChildOfClass("TextLabel")
    local BodyLabel = ErrorDialog:FindFirstChild("MessageArea", true) and ErrorDialog:FindFirstChild("MessageArea", true):FindFirstChildOfClass("TextLabel")

    if TitleLabel then
        TitleLabel.Text = Title
    end
    if BodyLabel then
        BodyLabel.Text = Body
    end
end

if not ScriptFile then
    ShowError("Infinite.win", "This game is not supported.\nJoin the Discord for updates on new games.")
    return
end

local Success, Error = pcall(function()
    loadstring(game:HttpGet(BaseURL .. ScriptFile))()
end)

if not Success then
    ShowError("Infinite.win", "Failed to load script.\nTry again or rejoin.\n\n" .. tostring(Error))
    return
end
