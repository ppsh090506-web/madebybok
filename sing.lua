local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔨Made By Bok🔨",
   Theme = "Default",
   KeySystem = true,
   KeySettings = {
      Title = "🔒키 필요",
      Subtitle = "디스코드 들어오세요",
      Note = "discord:FQNTdvjHrF",
      FileName = "Key",
      GrabKeyFromSite = true,
      SaveKey = true,
      Key = {"https://pastebin.com/raw/EqY2Rimd"}
   }
})

local MainTab = Window:CreateTab("메인탭")
MainTab:CreateSection("표지판 조종하기")

local targetName = ""
MainTab:CreateInput({
   Name = "닉네임 (비우면 전체)",
   PlaceholderText = "플레이어 이름",
   RemoveTextAfterFocusLost = false,
   Callback = function(text) targetName = text end
})

local currentText = ""
local heartbeat

MainTab:CreateInput({
   Name = "표지판 메시지",
   PlaceholderText = "텍스트 입력",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)
      currentText = text
      if heartbeat then heartbeat:Disconnect() end
      heartbeat = RunService.Heartbeat:Connect(function()
         if currentText == "" then return end
         if targetName == "" then
            for _, p in ipairs(Players:GetPlayers()) do
               local sign = p.Character and p.Character:FindFirstChild("UpdateSign", true)
               if sign then pcall(function() sign:FireServer(currentText) end) end
            end
         else
            local p = Players:FindFirstChild(targetName)
            local sign = p and p.Character and p.Character:FindFirstChild("UpdateSign", true)
            if sign then pcall(function() sign:FireServer(currentText) end) end
         end
      end)
   end
})

local MainSection = MainTab:CreateSection("부가 기능")

MainTab:CreateButton({
   Name = "핑핵(Z키)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LKR-beta/nope/refs/heads/main/disabled"))()
   end
})




