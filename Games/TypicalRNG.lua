-- If you saw this you are such a dumb ass skidder cant even code by yourself nigga

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "DinoHub // Typical.RNG",
   Icon = 86418345950386,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by DinoLive3009",
   ShowText = "DinoLive3009",
   Theme = "Ocean",

   ToggleUIKeybind = Enum.KeyCode.RightControl,

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Skidder Yessir"
   },

   Discord = {
      Enabled = false,
      Invite = "TvQAybnMHj", -- your discord dumb ass skidder
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

--Notify
Rayfield:Notify({
   Title = "Thank for using my script💕",
   Content = "Please join discord for updates",
   Duration = 7.5,
   Image = nil,
})

-- Main
getgenv().Auto_Click = true;


--Function
function Auto_Click()
   while task.wait(0.00001) do
       if getgenv().Auto_Click == true then
       for _, model in pairs(workspace.Sanses:GetChildren()) do
           local clickHitbox = model:FindFirstChild("ClickHitbox")
           if clickHitbox then
               local clickDetector = clickHitbox:FindFirstChildWhichIsA("ClickDetector")
               if clickDetector then
                   fireclickdetector(clickDetector)
               end
           end
           task.wait(0.00001)
      end
   end
  end
end

-- Tab/ etc
local Tab = Window:CreateTab("☠️ Main") -- Title, Image
local Section = Tab:CreateSection("Just clicking sans no boost dmg")

-- Toggles
local Toggle = Tab:CreateToggle({
   Name = "Auto Click All sans",
   CurrentValue = false,
   Flag = "Click",
   Callback = function(Value)
      getgenv().Auto_Click = Value
      Auto_Click()
   end,
})

local Section = Tab:CreateSection("This will prevent you from being kicked when AFK")

local VirtualUser = game:GetService("VirtualUser")
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local antiAfkEnabled = false
local afkConnection

local Toggle2 = Tab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(Value)
        antiAfkEnabled = Value

        if antiAfkEnabled then
            -- Connect the event
            afkConnection = player.Idled:Connect(function()
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
            Rayfield:Notify({Title = "Anti-AFK Enabled ✅", Content = "Subs", Duration = 1.5,})
        else
            -- Disconnect the event
            if afkConnection then
                afkConnection:Disconnect()
                afkConnection = nil
            end
            Rayfield:Notify({Title = "Anti-AFK Disabled ❌", Content = "Subs", Duration = 1.5,})
        end
    end
})




local Section = Tab:CreateSection("Another...")

local Button2 = Tab:CreateButton({
   Name = "Remove Texture",
   Callback = function()
       for i,v in next,(workspace:GetDescendants()) do
       if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic
       end
    end
end,
})

local Button3 = Tab:CreateButton({
   Name = "Delete all effect",
   Callback = function()
       local a = game.Workspace:FindFirstChild("Attack")
       a:Destroy()
end,
})

local Label = Tab:CreateLabel("How to use : just enabled click all sans and then anti-afk ✅", nil, false)
local Label = Tab:CreateLabel("Work best with accessories", nil, false)


-- Tab 2
local MainTab = Window:CreateTab("🛠️ Misc")
local Section = MainTab:CreateSection("Mod")
local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

-- JUst a slider
local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

-- Inf jump
local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="DinoHub"; Text="Done !"; Duration=5;})

	--The actuainfinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

-- Destroy UI
local Button = MainTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
    Rayfield:Destroy()
end,
})

-- WebHooks
-- Add anythings you want

local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local Avatar = 'https://cdn.discordapp.com/embed/avatars/4.png';
local Content = 'Someone use Script !';
local Embed = {
    title = 'cool';
    color = '99999';
    footer = { text = game.JobId };
    author = {
        name = 'ROBLOX';
        url = 'https://www.roblox.com/';
    };
    fields = {
        {
            name = '.';
            value = '123';
        }
    };
    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
};
(syn and syn.request or http_request) {
    Url = 'https://discord.com/api/webhooks/1374518183502938172/jd9m9f1zC88vgkHos9k-E9g3ZchlLoSlSTrFPbvcKBcjGnC_dfttHwzGb9FuStxT8vkx'; -- your webhook
    Method = 'POST';
    Headers = {
        ['Content-Type'] = 'application/json';
    };
    Body = game:GetService'HttpService':JSONEncode( { content = Content; embeds = { Embed } } );
};
