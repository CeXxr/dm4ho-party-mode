local targetPlaceId = 17727262513

if game.PlaceId ~= targetPlaceId then
    game:GetService("TeleportService"):Teleport(targetPlaceId, game.Players.LocalPlayer)
end

local localPlayer = game.Players.LocalPlayer
local Character = localPlayer.Character
local rootPart = Character:WaitForChild("HumanoidRootPart")
local startFolder = game.Workspace.JoinGame

local function TweenTo(cf, dur)
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local direction = (cf.p - rootPart.Position).unit
    local targetCFrame = CFrame.new(cf.p)
    local distance = (targetCFrame.p - rootPart.CFrame.p).Magnitude
    local tweenInfo = TweenInfo.new(dur, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(rootPart, tweenInfo, {
        CFrame = targetCFrame
    })
    tween:Play()
    tween.Completed:wait()
    return tween
end

rootPart.CFrame = startFolder.JoinArea.CFrame
task.wait(2)
TweenTo(game.Workspace.LevelFolder[0 .. 1].SavePoint.SpawnLocation.CFrame + Vector3.new(0, 3, 0), 5)
wait(2)
for i = localPlayer.leaderstats.Stage.Value + 1, 9 do
    local check = game.Workspace.LevelFolder[0 .. i].SavePoint.SpawnLocation

    TweenTo(check.CFrame + Vector3.new(0, 3, 0), 5)
    wait(1)
end

TweenTo(game.Workspace.LevelFolder[10].SavePoint.SpawnLocation.CFrame + Vector3.new(0, 3, 0), 6)

local queuetp = queueonteleport or queue_on_teleport

queuetp([[
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/CeXxr/dm4ho-party-mode/main/party-mode"),true))()
]])
