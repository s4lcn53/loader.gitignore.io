local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DinoHub // Lootify",
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
      FileName = "Hentai"
   },

   Discord = {
      Enabled = true,
      Invite = "discord.gg/TvQAybnMHj",
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

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("It should get 100A ( working )")
local Button = Tab:CreateButton({
   Name = "Inf money",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").Remotes.Backpack.DeleteEvent:FireServer(
    {
        {
            1,
            1e+17
        }
    },
    nil,
    true
)
end,
})

--Notify
Rayfield:Notify({
   Title = "Thank for using my script💕",
   Content = "Please join discord for updates",
   Duration = 7.5,
   Image = 86418345950386,
})
