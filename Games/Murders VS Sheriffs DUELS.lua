if game.PlaceId == 12355337193 then
print("Work")
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local espEnabled = false
local flyEnabled = false
local noclipEnabled = false
local flyConn = nil
local velocity = nil
local UIS = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local espList = {}
local walkSpeed = 16
local flySpeed = 70

local function applyCharacterSettings()
    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
        localPlayer.Character.Humanoid.WalkSpeed = walkSpeed
    end
    if flyEnabled then MainTab.Flags["Fly_Toggle"].Callback(true) end
    if noclipEnabled then MainTab.Flags["Noclip_Toggle"].Callback(true) end
end
localPlayer.CharacterAdded:Connect(function() task.wait(1) applyCharacterSettings() end)

local Window = Rayfield:CreateWindow({
    Name = "DinoHub // Murders VS Sheriffs DUELS",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by DinoLive3009",
    ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "DinoHub" },
    Discord = { Enabled = false },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Flag = "ESP_Toggle",
    Callback = function(Value)
        espEnabled = Value
        for _, v in pairs(espList) do if v.drawing then v.drawing.Visible = espEnabled end end
    end,
})

MainTab:CreateToggle({
    Name = "Fly Toggle (WASD + Space/Ctrl)",
    CurrentValue = false,
    Flag = "Fly_Toggle",
    Callback = function(Value)
        flyEnabled = Value
        local char = localPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        if flyConn then flyConn:Disconnect() end
        if velocity then velocity:Destroy() end
        if flyEnabled then
            velocity = Instance.new("BodyVelocity")
            velocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
            velocity.Velocity = Vector3.zero
            velocity.Parent = hrp
            flyConn = RunService.RenderStepped:Connect(function()
                local camCF = camera.CFrame
                local move = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then move += camCF.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then move -= camCF.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then move -= camCF.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then move += camCF.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0, 1, 0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move -= Vector3.new(0, 1, 0) end
                velocity.Velocity = move.Magnitude > 0 and move.Unit * flySpeed or Vector3.zero
            end)
        end
    end
})

MainTab:CreateSlider({
    Name = "Fly Speed", Range = {10, 150}, Increment = 5, Suffix = "Speed", CurrentValue = 70, Flag = "FlySpeed",
    Callback = function(Value) flySpeed = Value end,
})

MainTab:CreateSlider({
    Name = "Walk Speed", Range = {16, 200}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "Speed_Slider",
    Callback = function(Value)
        walkSpeed = Value
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
            localPlayer.Character.Humanoid.WalkSpeed = walkSpeed
        end
    end,
})

MainTab:CreateToggle({
    Name = "Noclip Toggle",
    CurrentValue = false,
    Flag = "Noclip_Toggle",
    Callback = function(Value)
        noclipEnabled = Value
        if noclipEnabled then
            noclipConn = RunService.Stepped:Connect(function()
                if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    for _, part in ipairs(localPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
        elseif noclipConn then
            noclipConn:Disconnect()
        end
    end,
})



function createESP(player)
    if player == localPlayer or espList[player] then return end
    local text = Drawing.new("Text")
    text.Size = 20
    text.Center = true
    text.Outline = true
    text.Color = Color3.fromRGB(255, 0, 255)
    text.Font = 2
    text.Visible = false
    espList[player] = { drawing = text, connection = nil }
    espList[player].connection = RunService.RenderStepped:Connect(function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 then
            local pos, visible = camera:WorldToViewportPoint(hrp.Position)
            if visible then
                text.Position = Vector2.new(pos.X, pos.Y - 20)
                text.Text = player.Name
                text.Visible = espEnabled
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end)
end

function removeESP(player)
    if espList[player] then
        espList[player].drawing:Remove()
        if espList[player].connection then espList[player].connection:Disconnect() end
        espList[player] = nil
    end
end

for _, player in pairs(Players:GetPlayers()) do createESP(player) end
Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)



local AdminTab = Window:CreateTab("Discord", 4483362458)
AdminTab:CreateButton({ Name = "Report Bugs", Callback = function()
    setclipboard("https://discord.gg/TvQAybnMHj")
    Rayfield:Notify({Title = "Copied", Content = "Link copied to clipboard."})
end })

local Aimbot = {
    Radius = 120,
    TargetPart = "Head"
}

local TracerLines = {}

function updateViewTracers()
    for _, line in pairs(TracerLines) do line:Remove() end
    table.clear(TracerLines)
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local line = Drawing.new("Line")
            line.Color = Color3.fromRGB(255, 0, 255)
            line.Thickness = 1
            line.Transparency = 1
            line.Visible = true
            TracerLines[player] = line
        end
    end
end
updateViewTracers()
Players.PlayerAdded:Connect(updateViewTracers)
Players.PlayerRemoving:Connect(updateViewTracers)

local aimbotEnabled = false

RunService.RenderStepped:Connect(function()
    local mouseDown = UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    local target = nil
    if mouseDown and aimbotEnabled then
        local closest, dist = nil, Aimbot.Radius
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character then
                local part = player.Character:FindFirstChild(Aimbot.TargetPart)
                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                if part and hum and hum.Health > 0 then
                    local pos, visible = camera:WorldToViewportPoint(part.Position)
                    if visible then
                        local mag = (Vector2.new(pos.X, pos.Y) - UIS:GetMouseLocation()).Magnitude
                        if mag < dist then
                            dist = mag
                            closest = part
                        end
                    end
                end
            end
        end
        if closest then
            camera.CFrame = CFrame.new(camera.CFrame.Position, closest.Position)
        end
    end

    for player, line in pairs(TracerLines) do
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local screenPos, visible = camera:WorldToViewportPoint(hrp.Position)
            line.From = Vector2.new(screenPos.X, screenPos.Y)
            line.To = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
            line.Visible = visible and TracerLines[player].Visible
        else
            line.Visible = false
        end
    end
end)

MainTab:CreateToggle({
    Name = "Aimbot (right mouse)",
    CurrentValue = false,
    Flag = "Aimbot_Toggle",
    Callback = function(Value)
        aimbotEnabled = Value
    end
})

MainTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "AntiAFK_Toggle",
    Callback = function(Value)
        if Value then
            if _G.AntiAFKConnection then _G.AntiAFKConnection:Disconnect() end
            local vu = game:GetService("VirtualUser")
            _G.AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                print("Yo cokking")
            end)
        else
            if _G.AntiAFKConnection then
                _G.AntiAFKConnection:Disconnect()
                _G.AntiAFKConnection = nil
                warn("I got your IP nigga")
            end
        end
    end
})
end
