if game.PlaceId == 131972793577387 then
print("Work game")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DinoHub // Merge a brainrot",
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

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Inf Money!",
   Callback = function()local args = {
	"Cash",
	4000000000000000000000000000000000000
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddValueEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed
   end,
})
   

local Button = Tab:CreateButton({
   Name = "Free Rebrith + Inf Gems",
   Callback = function()local args = {
	0,
	0,
	10000000000000000000000000000000000
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RebirthConfirmEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed
   end,
})



  
end
