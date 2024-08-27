local LoadingTime = tick()

repeat wait() until game:IsLoaded()
pcall(function()
	repeat wait()
		for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.PlayBackground.Play.Activated)) do
			v.Function()
		end
	until not game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Enabled
end)
_G.Setting_table = {
	Save_Member = true
}
_G.Check_Save_Setting = "CheckSaveSetting"

getgenv()['JsonEncode'] = function(msg)
	return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
	return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
	if not _G.Dis and not isfolder('Dummy Hub Meme Sea Main') then
		makefolder('Dummy Hub Meme Sea Main')
	end
	if not _G.Dis and not isfile('Dummy Hub Meme Sea Main/'..Name..'.json') then
		writefile('Dummy Hub Meme Sea Main/'..Name..'.json',JsonEncode(_G.Setting_table))
	end
end
getgenv()['Get_Setting'] = function(Name)
	if not _G.Dis and isfolder('Dummy Hub Meme Sea Main') and isfile('Dummy Hub Meme Sea Main/'..Name..'.json') then
		_G.Setting_table = JsonDecode(readfile('Dummy Hub Meme Sea Main/'..Name..'.json'))
		return _G.Setting_table
	elseif not _G.Dis then
		Check_Setting(Name)
	end
end
getgenv()['Update_Setting'] = function(Name)
	if not _G.Dis and isfolder('Dummy Hub Meme Sea Main') and isfile('Dummy Hub Meme Sea Main/'..Name..'.json') then
		writefile('Dummy Hub Meme Sea Main/'..Name..'.json',JsonEncode(_G.Setting_table))
	elseif not _G.Dis then
		Check_Setting(Name)
	end
end

Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)

if _G.Setting_table.Save_Member then
	getgenv()['MyName'] = game.Players.LocalPlayer.Name
elseif _G.Setting_table.Save_All_Member then
	getgenv()['MyName'] = "AllMember"
else
	getgenv()['MyName'] = "None"
	_G.Dis = true
end

Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])

_G.Setting_table.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])

if _G.Setting_table == nil then
	_G.Setting_table = {}
end

function Op(f ,callback)
	if _G.Setting_table[f] == nil then
		_G.Setting_table[f] = callback
	end
end

Op("DistanceFarm",8)
Op("SelectWeapon","Melee")
Op("BringMobF",true)
Op("ActiceAura",true)
Op("SelectQuest", "Cool Floppa")
Op("Point",1)
Op("DistanceNearest",500)
Op("SelectQuantity","x1")
Op("SelectMethod","Money")
Op("SelectAura","Spectrum")
Op("SelectBoss","Lord Sus")
Op("SelectIsland","Sus Island")
Op("GetQuestMonBoss",true)
Op("GetQuestBossFun",true)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/noggik/heje/main/hee.lua"))()

local Window = Library:CreateWindow({
	Credit = "Sayo"
})

local Page1 = Window:AddPage({
	Title = "General",
	Icon = "home",
	Page = {
		Left = {
			Name = "Farm",
			Icon = "arrow-big-up"
		},
		Right = {
			Name = "Setup",
			Icon = "file-cog"
		}
	}
})

Page1:CreateToggle("Left", {
	Title = "Farm Level",
	Desc = "Level Max 2400",
	Value = _G.Setting_table.Farm_Lv,
	Callback = function(vu)
		Farm_Lv = vu
		_G.Setting_table.Farm_Lv = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("Left", {
	Title = "Get Awake Orb",
	Desc = "Auto Get Awake Orb",
	Value = _G.Setting_table.AwkOrb,
	Callback = function(vu)
		AwkOrb = vu
		_G.Setting_table.AwkOrb = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateDropdown("Right",{
	Title = "Weapon",
	Desc = "Select Weapon Farm",
	ListDesc = "Select Weapon To Farm",
	Value = _G.Setting_table.SelectWeapon,
	List = {"Melee", "Sword", "Power Fruit"},
	MultiDropdown = false,
	Callback = function(vu)
		SelectWeapon = vu
		_G.Setting_table.SelectWeapon = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateSlider("Right",{
	Title = 'Distance',
	Desc = "Setup Distance",
	Min = 1,
	Max = 20,
	Value = _G.Setting_table.DistanceFarm,
	Callback = function(vu)
		DistanceFarm = vu
		_G.Setting_table.DistanceFarm = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("Right", {
	Title = "Bring Mob",
	Desc = "",
	Value = _G.Setting_table.BringMobF,
	Callback = function(vu)
		BringMobF = vu
		_G.Setting_table.BringMobF = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("Right", {
	Title = "Trun On Aura",
	Desc = "Use The Aura",
	Value = _G.Setting_table.ActiceAura,
	Callback = function(vu)
		ActiceAura = vu
		_G.Setting_table.ActiceAura = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("Right", {
	Title = "Trun On Instinct",
	Desc = "Use The Instinct",
	Value = _G.Setting_table.ActiceInstinct,
	Callback = function(vu)
		ActiceInstinct = vu
		_G.Setting_table.ActiceInstinct = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("Right", {
	Title = "Trun On Race Skill",
	Desc = "Use The Race Skill",
	Value = _G.Setting_table.ActiceRace,
	Callback = function(vu)
		ActiceRace = vu
		_G.Setting_table.ActiceRace = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateLabel("Right", {
	Title = " - Setting Skill",
	Desc = "Select Skill To Use Farm"
})

Page1:CreateToggle("Right", {
	Title = "Skill Z",
	Desc = "Use The Skill Z",
	Value = _G.Setting_table.UseSkillZ,
	Callback = function(vu)
		UseSkillZ = vu
		_G.Setting_table.UseSkillZ = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("Right", {
	Title = "Skill X",
	Desc = "Use The Skill X",
	Value = _G.Setting_table.UseSkillX,
	Callback = function(vu)
		UseSkillX = vu
		_G.Setting_table.UseSkillX = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("Right", {
	Title = "Skill C",
	Desc = "Use The Skill C",
	Value = _G.Setting_table.UseSkillC,
	Callback = function(vu)
		UseSkillC = vu
		_G.Setting_table.UseSkillC = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("Right", {
	Title = "Skill V",
	Desc = "Use The Skill V",
	Value = _G.Setting_table.UseSkillV,
	Callback = function(vu)
		UseSkillV = vu
		_G.Setting_table.UseSkillV = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateButton("r",{
	Title = "Redeem All Code",
	Desc = "Redeem All Code Need lv 25",
	Secure = false,
	Callback = function()
		pcall(function()
			for i, v in pairs(require(game:GetService("ReplicatedStorage").ModuleScript.CodeList)) do
				if not game:GetService("Players").LocalPlayer.Code:FindFirstChild(i) then
					game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Code"):InvokeServer(i)
				end
			end
		end)
	end})

function Getnamequest()
	local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
	local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

	local closestQuest = nil
	local closestDifference = math.huge

	for i, v in pairs(a) do
		if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
			local difference = level - v.LevelNeed
			if difference <= closestDifference then
				closestQuest = i
				closestDifference = difference
			end
		end
	end
	return closestQuest
end

function Getmob()
	local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
	local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

	local mob = nil
	local closestDifference = math.huge

	for i, v in pairs(a) do
		if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
			local difference = level - v.LevelNeed
			if difference <= closestDifference then
				mob = v.Target
				closestDifference = difference
			end
		end
	end
	return mob
end

function DetectQuest()
	if game.workspace.Location.QuestLocaion:FindFirstChild(Getnamequest()) then
		for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
			if v.Name == Getnamequest() then
				return v.CFrame, v
			end
		end
	else
		for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
			if v.Name == Getnamequest() then
				return v.WorldPivot, v
			end
		end
	end
end

function Getquest()
	local QuestPos, Quest = DetectQuest()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = QuestPos
	local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(Quest.Name)
	if PromptQuest then
		if game.Players.LocalPlayer:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
			if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
				fireproximityprompt(PromptQuest.Block.QuestPrompt)
			end
		end
	end
end

function DetectMob()
	for i, v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
		if v.Name == Getmob() and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v
		end
	end
end

function FarmMon(v)
	if v:FindFirstChild("Humanoid") then
		if v.Humanoid.Health > 0 then
			game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.PrimaryPart.CFrame * CFrame.new(0, DistanceFarm, 0) * CFrame.Angles(math.rad(-90), 0, 0))
		end
	end
end

function TP(p)
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p)
end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) and not game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

function MagX(MagDis)
	if MagZ then
		return MagZ(MagDis)
	else
		return (MagDis.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200
	end
end
function BringMob(pos)
	for i, v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
		if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - pos.Position).Magnitude <= 300 then
			if v:FindFirstChildOfClass("Humanoid") then
				local humanoid = v.Humanoid
				if humanoid:FindFirstChild("Animator") then
					humanoid.Animator:Destroy()
				end

				if MagX(v.HumanoidRootPart) then
					v.HumanoidRootPart.CFrame = pos
					v.Humanoid:ChangeState(14)
					for _, part in ipairs(v:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
				end
			end
		end
	end
end

function Useskill(weapon, skill)
	if getgenv().posaim then
		local args = {
			[1] = workspace:WaitForChild("Character"):WaitForChild(game.Players.LocalPlayer.Name),
			[2] = weapon,
			[3] = skill,
			[4] = "Hold",
			[5] = {
				["Mouse_Position"] = getgenv().posaim,
				["Hit_Position"] = getgenv().posaim
			}
		}
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild(
		"Server_Skills"):FireServer(unpack(args))
		local args = {
			[1] = workspace:WaitForChild("Character"):WaitForChild(game.Players.LocalPlayer.Name),
			[2] = weapon,
			[3] = skill,
			[4] = "Release",
			[5] = {
				["Mouse_Position"] = getgenv().posaim,
				["Hit_Position"] = getgenv().posaim
			}
		}

		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild("Server_Skills"):FireServer(unpack(args))
	end
end

function Kill(v,uu)
	repeat task.wait()
		EquipWeapon(Weapon)
		FarmMon(v)
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1e4, 1e4))
		pcall(function()
			if BringMobF and not (KillPlayer) then
				BringMob(v.HumanoidRootPart.CFrame)
			end
		end)
		pcall(function()
			if UseSkillZ then
				Useskill(Weapon, "Z")
			end
			if UseSkillX then
				Useskill(Weapon, "X")
			end
			if UseSkillC then
				Useskill(Weapon, "C")
			end
			if UseSkillV then
				Useskill(Weapon, "V")
			end
			getgenv().posaim = v.HumanoidRootPart.CFrame
		end)
	until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or (uu and uu())
end

function Monster(a)
	for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
		if v.Name == a and v.Humanoid.Health > 0 then
			return v
		end
	end
	for i,v in pairs(game:GetService("ReplicatedStorage").MonsterSpawn:GetChildren()) do
		if v.Name == a and v.Humanoid.Health > 0 then
			return v
		end
	end
end

function Monsters(a)
	for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
		if table.find(a, v.Name) and v.Humanoid.Health > 0 then
			return v
		end
	end
	for i,v in pairs(game:GetService("ReplicatedStorage").MonsterSpawn:GetChildren()) do
		if table.find(a, v.Name) and v.Humanoid.Health > 0 then
			return v
		end
	end
end

function CQuest(s)
	for i, v in next,MS do
		if i == s then
			return v
		end
	end
end

function Quest(a)
	if game.workspace.Location.QuestLocaion:FindFirstChild(a) then
		for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
			if v.Name == a then
				return v.CFrame, v
			end
		end
	else
		for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
			if v.Name == a then
				return v.WorldPivot, v
			end
		end
	end
end

function WaitMon(a)
	for i, v in pairs(game:GetService("Workspace").Location["Enemy_Location"]:GetChildren()) do
		if v.Name == a then
			TP(v.CFrame)
		end
	end
end

task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if Farm_Lv or NoClip or MemeBeast or ATRaid or AutoFarmBoss or FarmMonster or AutoFarmAura or AutoFarmInstinct or AwkOrb then
				if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit then
					game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
				end
				if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					local BodyVelocity = Instance.new("BodyVelocity")
					BodyVelocity.Name = "BodyVelocity1"
					BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					BodyVelocity.MaxForce = Vector3.new(10000,10000,10000)
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				end
			else
				if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy()
				end
			end
		end)
	end)
end) --BodyClip

task.spawn(function()
	while task.wait(.5) do
		pcall(function()
			if SelectWeapon == "Melee" then
				SS = "Fight"
			elseif SelectWeapon == "Sword" then
				SS = "Weapon"
			elseif SelectWeapon == "Power Fruit" then
				SS = "Power"
			end
			for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip:find(SS) then
						Weapon = v.Name
					end
				end
			end
		end)
	end
end) -- Weapon

task.spawn(function()
	while wait(.5) do
		pcall(function()
			if ActiceAura then
				if #game.Players.LocalPlayer.Character.AuraColor_Folder:GetChildren() < 1 then
					game.Players.LocalPlayer.Ability.Aura.Value = true
					game.ReplicatedStorage:WaitForChild("OtherEvent").MainEvents.Ability:InvokeServer("Aura")
				end
			end
			if ActiceInstinct then
				if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight_Player") and game.Players.LocalPlayer.Ability.Instinct.Value then
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game.Players.LocalPlayer)
					game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
				end
			end
			if ActiceRace then
				game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Movement:FireServer("RaceSkill")
			end
		end)
	end
end) -- Abilities

task.spawn(function()
	while task.wait() do
		pcall(function()
			if Farm_Lv then
				if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
					Getquest()
				else
					local Mon = DetectMob()
					if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= Getnamequest() then
						for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
							v.Function()
						end
					end
					if Mon then
						Kill(Mon, function() return not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible or not Farm_Lv end)
					else
						WaitMon(Getmob())
					end
				end
			end
		end)
	end
end) -- Farm Level

task.spawn(function()
	while task.wait() do
		pcall(function()
			if AwkOrb then
				local mon = Monster("Sogga")
				if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
					TP(Quest("Dancing Banana Quest"))
					for i,v in pairs(game:GetService("Workspace").NPCs["Quests_Npc"]["Dancing Banana Quest"].Block:GetChildren()) do
						if v.Name == "QuestPrompt" then
							fireproximityprompt(v,30)
						end
					end
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Dancing Banana Quest" then
						for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
							v.Function()
						end
					end
					if mon then
						Kill(mon, function() return not AwkOrb or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
					else
						WaitMon("Sogga")
					end
				end
			end
		end)
	end
end) -- AwkOrb

Page1:CreateLabel("l",{
	Title = " - Farm Monster",
	Desc = "Farm Monster Select"
})

local MS = {
	["Floppa"] = 1,
	["Golden Floppa"] = 2,
	["Big Floppa"] = 3,
	["Doge"] = 4,
	["Cheems"] = 5,
	["Walter Dog"] = 6,
	["Staring Fish"] = 7,
	["Hamster"] = 8,
	["Snow Tree"] = 9,
	["The Rock"] = 10,
	["Banana Cat"] = 11,
	["Sus Face"] = 12,
	["Egg Dog"] = 13,
	["Popcat"] = 14,
	["Gorilla King"] = 15,
	["Smiling Cat"] = 16,
	["Killerfish"] = 17,
	["Bingus"] = 18,
	["Obamid"] = 19,
	["Floppy"] = 20,
	["Creepy Head"] = 21,
	["Scary Skull"] = 22,
	["Giant Pumpkin"] = 23,
	["Pink Absorber"] = 24,
	["Troll Face"] = 25,
	["Uncanny Cat"] = 26,
	["Quandale Dingle"] = 27,
	["Moai"] = 28,
	["Evil Noob"] = 29,
	["Red Sus"] = 30,
	["Sus Duck"] = 31,
	["Lord Sus"] = 32,
	["Sigma Man"] = 33,
	["Dancing Cat"] = 34,
	["Toothless Dragon"] = 35,
	["Manly Nugget"] = 36,
	["Huh Cat"] = 37,
	["Mystical Tree"] = 38,
	["Old Man"] = 39,
	["Nyan Cat"] = 40,
	["Baller"] = 41,
	["Slicer"] = 42,
	["Rick Roller"] = 43,
	["Gigachad"] = 44,
	["MrBeast"] = 45,
	["Handsome Man"] = 46
}

local MonsterList = {}
for i, v in next,MS do
	table.insert(MonsterList,i)
end

Page1:CreateDropdown("l",{
	Title = "Monster",
	Desc = "Select Monster",
	ListDesc = "Select Monster To Farm",
	Value = _G.Setting_table.SelectMonster,
	List = MonsterList,
	MultiDropdown = false,
	Callback = function(vu)
		SelectMonster = vu
		_G.Setting_table.SelectMonster = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("l", {
	Title = "Farm Monster",
	Desc = "Farm Monster Select",
	Value = _G.Setting_table.FarmMonster,
	Callback = function(vu)
		FarmMonster = vu
		_G.Setting_table.FarmMonster = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page1:CreateToggle("l", {
	Title = "Get Quest",
	Desc = "Get Quest Monster Select",
	Value = _G.Setting_table.GetQuestMonster,
	Callback = function(vu)
		GetQuestMonster = vu
		_G.Setting_table.GetQuestMonster = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if FarmMonster then
				local function GetMon(a)
					for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
						if v.Name == a and v.Humanoid.Health > 0 then
							return v
						end
					end
					for i,v in pairs(game:GetService("ReplicatedStorage").MonsterSpawn:GetChildren()) do
						if v.Name == a and v.Humanoid.Health > 0 then
							return v
						end
					end
				end
				local function GetQuest()
					for i, v in next,MS do
						if i == SelectMonster then
							return v
						end
					end
				end
				local function CheckQuest()
					if game.workspace.Location.QuestLocaion:FindFirstChild("Floppa Quest "..GetQuest()) then
						for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
							if v.Name == "Floppa Quest "..GetQuest() then
								return v.CFrame, v
							end
						end
					else
						for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
							if v.Name == "Floppa Quest "..GetQuest() then
								return v.WorldPivot, v
							end
						end
					end
				end
				if GetMon(SelectMonster) then
					if GetQuestMonster then
						if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
							TP(CheckQuest())
							for i,v in pairs(game:GetService("Workspace").NPCs["Quests_Npc"]["Floppa Quest "..GetQuest()].Block:GetChildren()) do
								if v.Name == "QuestPrompt" then
									fireproximityprompt(v,30)
								end
							end
						else
							if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..GetQuest() then
								for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
									v.Function()
								end
							end
							Kill(GetMon(SelectMonster), function() return not FarmMonster or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
						end
					else
						Kill(GetMon(SelectMonster), function() return not FarmMonster end)
					end
				else
					WaitMon(SelectMonster)
				end
			end
		end)
	end
end)

Page1:CreateLabel("l",{
	Title = " - Farm Quest",
	Desc = "Do a quest"
})

Page1:CreateDropdown("l",{
	Title = "Quest",
	Desc = "Select Quest",
	ListDesc = "Select Quest To Farm",
	Value = _G.Setting_table.SelectQuest,
	List = {"Cool Floppa", "Pop Cat"},
	MultiDropdown = false,
	Callback = function(vu)
		SelectQuest = vu
		_G.Setting_table.SelectQuest = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("l", {
	Title = "Auto Quest",
	Desc = "Farm Quest Select",
	Value = _G.Setting_table.ATQuest,
	Callback = function(vu)
		ATQuest = vu
		_G.Setting_table.ATQuest = vu
		Update_Setting(getgenv()['MyName'])
	end})


function DetectQuestMisc(name)
	if game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest") then
		return game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest").WorldPivot.Position, "Cool Floppa Quest"
	end
	if game:GetService("Workspace").NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest") then
		return game:GetService("Workspace").NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest").WorldPivot.Position, "Cool Floppa Quest"
	end
end

function Getquestmisc(name)
	local QuestPos, Quest = DetectQuestMisc(name)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(QuestPos)
	local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(name)
	if PromptQuest then
		if game.Players.LocalPlayer:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
			if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
				fireproximityprompt(PromptQuest.Block.QuestPrompt)
			end
			wait(0.5)
		end
	end
end

task.spawn(function()
	while task.wait() do
		pcall(function()
			if ATQuest then
				if SelectQuest == "Cool Floppa" then
					if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
						Getquestmisc("Cool Floppa Quest")
					else
						if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Cool Floppa Quest" and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
							for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
								v.Function()
							end
						end
						repeat task.wait()
							TP(CFrame.new(game:GetService("Workspace").Island.FloppaIsland:FindFirstChild("Lava Floppa").WorldPivot.Position))
							fireproximityprompt(game:GetService("Workspace").Island.FloppaIsland["Lava Floppa"].ClickPart.ProximityPrompt,30)
						until not ATQuest or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible
					end

				elseif SelectQuest == "Pop Cat" then
					local textValue = game:GetService("Workspace").Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text:gsub(",", "")
					local numericValue = tonumber(textValue)
					repeat task.wait()
						TP(game:GetService("Workspace").Island.FloppaIsland.Popcat_Clickable.Part.CFrame)
						fireclickdetector(game:GetService("Workspace").Island.FloppaIsland.Popcat_Clickable.Part.ClickDetector)
					until not ATQuest or (numericValue and numericValue) > 10000
					if numericValue and numericValue > 10000 then
						if game:GetService("Workspace").NPCs.Misc_Npc:FindFirstChild("Ohio Popcat") then
							if game:GetService("Workspace").NPCs.Misc_Npc["Ohio Popcat"]:IsA("Model") then
								TP(game:GetService("Workspace").NPCs.Misc_Npc["Ohio Popcat"].WorldPivot)
							elseif game:GetService("Workspace").NPCs.Misc_Npc:IsA("Part") then
								TP(game:GetService("Workspace").NPCs.Misc_Npc["Ohio Popcat"].CFrame)
							end
						elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Ohio Popcat") then
							if game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Model") then
								TP(game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"].WorldPivot)
							elseif game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Part") then
								TP(game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"].CFrame)
							end
						end
						game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Ohio Popcat")
					end
				end
			end
		end)
	end
end) -- Quest

local Page2 = Window:AddPage({
	Title = "Status",
	Icon = "signal",
	Page = {
		Left = {
			Name = "Server",
			Icon = "clipboard-signature"
		},
		Right = {
			Name = "Stats",
			Icon = "signal"
		}
	}
})

Page2:CreateToggle("R", {
	Title = "Melee",
	Desc = "Enable Up Melee Status",
	Value = _G.Setting_table.UPMelee,
	Callback = function(vu)
		UPMelee = vu
		_G.Setting_table.UPMelee = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page2:CreateToggle("R", {
	Title = "Health",
	Desc = "Enable Up Health Status",
	Value = _G.Setting_table.UPHealth,
	Callback = function(vu)
		UPHealth = vu
		_G.Setting_table.UPHealth = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page2:CreateToggle("R", {
	Title = "Weapon",
	Desc = "Enable Up Weapon Status",
	Value = _G.Setting_table.UPWeapon,
	Callback = function(vu)
		UPWeapon = vu
		_G.Setting_table.UPWeapon = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page2:CreateToggle("R", {
	Title = "Power",
	Desc = "Enable Up Power Status",
	Value = _G.Setting_table.UPPower,
	Callback = function(vu)
		UPPower = vu
		_G.Setting_table.UPPower = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page2:CreateSlider("Right",{
	Title = 'Porint',
	Desc = "Setup Point",
	Min = 1,
	Max = 1000,
	Value = _G.Setting_table.Point,
	Callback = function(vu)
		Point = vu
		_G.Setting_table.Point = vu
		Update_Setting(getgenv()['MyName'])
	end})


task.spawn(function()
	while task.wait() do
		pcall(function()
			if UPMelee then
				local args = {
					[1] = {
						["Target"] = "MeleeLevel",
						["Action"] = "UpgradeStats",
						["Amount"] = Point
					}
				}
				game:GetService("ReplicatedStorage").OtherEvent.MainEvents.StatsFunction:InvokeServer(unpack(args))
			end
			if UPHealth then
				local args = {
					[1] = {
						["Target"] = "DefenseLevel",
						["Action"] = "UpgradeStats",
						["Amount"] = Point
					}
				}

				game:GetService("ReplicatedStorage").OtherEvent.MainEvents.StatsFunction:InvokeServer(unpack(args))
			end
			if UPWeapon then
				local args = {
					[1] = {
						["Target"] = "SwordLevel",
						["Action"] = "UpgradeStats",
						["Amount"] = Point
					}
				}

				game:GetService("ReplicatedStorage").OtherEvent.MainEvents.StatsFunction:InvokeServer(unpack(args))
			end
			if UPPower then
				local args = {
					[1] = {
						["Target"] = "MemePowerLevel",
						["Action"] = "UpgradeStats",
						["Amount"] = Point
					}
				}

				game:GetService("ReplicatedStorage").OtherEvent.MainEvents.StatsFunction:InvokeServer(unpack(args))
			end
		end)
	end
end)

Page2:CreateLabel("l",{
	Title = " - Time",
	Desc = "Server Time"
})
local ServerTime = Page2:CreateLabel("l",{
	Title = "Server Time",
	Desc = "Time : 00:00:00"
})

Page2:CreateLabel("l",{
	Title = " - Weapon",
	Desc = "Weapon Quest"
})
local pc = Page2:CreateLabel("l",{
	Title = "Pop Cat Weapon",
	Desc = " [-] 🔴 Dont Have"
})
local lf = Page2:CreateLabel("l",{
	Title = "Lava Floppa Weapon",
	Desc = " [-] 🔴 Dont Have"
})
Page2:CreateLabel("l",{
	Title = " - Boss",
	Desc = "Boss Spawner"
})
local mb = Page2:CreateLabel("l",{
	Title = "Meme Beast",
	Desc = " [-] 🔴 Dont Spawn"
})
local ls = Page2:CreateLabel("l",{
	Title = "Lord Sus",
	Desc = " [-] 🔴 Dont Spawn"
})
local en = Page2:CreateLabel("l",{
	Title = "Evil Noob",
	Desc = " [-] 🔴 Dont Spawn"
})
local gp = Page2:CreateLabel("l",{
	Title = "Giant Pumpkin",
	Desc = " [-] 🔴 Dont Spawn"
})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if game:GetService("Players").LocalPlayer.Items.Weapon.Floppa.Value ~= 0 then
				lf:SetDesc(" [-] 🟢 Have")
			end
			if game:GetService("Players").LocalPlayer.Items.Weapon.Popcat.Value ~= 0 then
				pc:SetDesc(" [-] 🟢 Have")
			end
			if game:GetService("Workspace").Monster:FindFirstChild("Meme Beast") or game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Meme Beast") then
				mb:SetDesc(" [-] 🟢 Spawn")
			else
				mb:SetDesc(" [-] 🔴 Dont Spawn")
			end
			if game:GetService("Workspace").Monster:FindFirstChild("Lord Sus") or game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Lord Sus") then
				ls:SetDesc(" [-] 🟢 Spawn")
			else
				ls:SetDesc(" [-] 🔴 Dont Spawn")
			end
			if game:GetService("Workspace").Monster:FindFirstChild("Evil Noob") or game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Evil Noob") then
				en:SetDesc(" [-] 🟢 Spawn")
			else
				en:SetDesc(" [-] 🔴 Dont Spawn")
			end
			if game:GetService("Workspace").Monster:FindFirstChild("Giant Pumpkin") or game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Giant Pumpkin") then
				gp:SetDesc(" [-] 🟢 Spawn")
			else
				gp:SetDesc(" [-] 🔴 Dont Spawn")
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			ServerTime:SetDesc(" [-] ⌛ Time : "..workspace.Leaderboard.Time.Model.ScoreBlock.SurfaceGui.Time.Text)
		end)
	end
end)

local Page3 = Window:AddPage({
	Title = "Boss",
	Icon = "globe",
	Page = {
		Left = {
			Name = "Farm",
			Icon = "arrow-big-up"
		},
		Right = {
			Name = "Raid",
			Icon = "swords"
		}
	}
})

Page3:CreateToggle("l", {
	Title = "Meme Beast",
	Desc = "Auto Kill Meme Beast",
	Value = _G.Setting_table.MemeBeast,
	Callback = function(vu)
		MemeBeast = vu
		_G.Setting_table.MemeBeast = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if MemeBeast then
				local function GetSeaBeast()
					for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
						if v.Name == "Meme Beast" and v.Humanoid.Health > 0 then
							return v
						end
					end
					for i,v in pairs(game:GetService("ReplicatedStorage").MonsterSpawn:GetChildren()) do
						if v.Name == "Meme Beast" and v.Humanoid.Health > 0 then
							return v
						end
					end
				end
				Kill(GetSeaBeast(), function() return not MemeBeast end)
			end
		end)
	end
end)

Page3:CreateToggle("r",{
	Title = "Auto Raid",
	Desc = "Auto Kill All Monster Raid",
	Value = _G.Setting_table.ATRaid,
	Callback = function(vu)
		ATRaid = vu
		_G.Setting_table.ATRaid = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page3:CreateLabel("r",{
	Title = " - Travel",
	Desc = "Travel Location"
})

function GetPosition()
	local ss = {}
	for i, v in next, workspace:WaitForChild("Location"):WaitForChild("SpawnLocations"):GetChildren() do
		if not table.find(ss, v.Name) then
			table.insert(ss, v.Name)
		end
	end
	return ss
end

Page3:CreateDropdown("r",{
	Title = "Select Island",
	Desc = "Select Island To Go",
	ListDesc = "Select Island To Go",
	Value = _G.Setting_table.SelectIsland,
	List = GetPosition(),
	MultiDropdown = false,
	Callback = function(vu)
		SelectIsland = vu
		_G.Setting_table.SelectIsland = vu
		Update_Setting(getgenv()['MyName'])

		if InstanceTeleport then
			TP(workspace:WaitForChild("Location").SpawnLocations[vu].CFrame)
		end
	end})
Page3:CreateToggle("r",{
	Title = "Instance Teleport",
	Desc = "Instance Teleport Island",
	Value = _G.Setting_table.InstanceTeleport,
	Callback = function(vu)
		InstanceTeleport = vu
		_G.Setting_table.InstanceTeleport = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page3:CreateButton("r",{
	Title = "Teleport",
	Desc = "",
	Secure = true,
	Callback = function()
		TP(workspace:WaitForChild("Location").SpawnLocations[SelectIsland].CFrame)
	end})

function Getnameraid()
	local distance = math.huge
	local name
	for i, v in next, game:GetService("Workspace").Raids:GetChildren() do
		if (v.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude < distance then
			distance = (v.WorldPivot.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude
			name = v
		end
	end
	return name
end

function Getmobraid()
	local wave = game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Wave.Text:gsub(" ", "")
	if Getnameraid() then
		for i, v in next, game:GetService("Workspace").Raids[tostring(Getnameraid())].Enemy_Location[tostring(wave)]:GetChildren() do
			return v.Name
		end
	end
end

task.spawn(function()
	while task.wait() do
		pcall(function()
			if ATRaid then
				if not game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Visible or not Getnameraid() then
					TP(CFrame.new(game:GetService("Workspace").Region.RaidArea.Position + Vector3.new(0, -18, 0)) * CFrame.Angles(0, math.rad(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Orientation.Y), 0))
				else
					if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Visible then
						pcall(function()
							repeat task.wait()
								for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Activated)) do
									v.Function()
								end
							until not game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Visible
						end)
					end
					if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.TimeLeft.Visible then
						for i, v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								Kill(v, function() return not ATRaid or not game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Visible end)
								TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
							end
						end
					end
				end
			end
		end)
	end
end)

local Page4 = Window:AddPage({
	Title = "Shop",
	Icon = "shopping-cart",
	Page = {
		Left = {
			Name = "Weapon",
			Icon = "swords"
		},
		Right = {
			Name = "Ability",
			Icon = "flower"
		}
	}
})

Page4:CreateButton("r",{
	Title = "Instinct",
	Desc = "$2.5m",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Ability_Teacher","Nugget Man")
	end})
Page4:CreateButton("r",{
	Title = "Aura",
	Desc = "Meme Cube and $10m",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Ability_Teacher","Aura Master")
	end})
Page4:CreateButton("r",{
	Title = "Flash Step",
	Desc = "$100k",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Ability_Teacher","Giga Chad")
	end})

Page4:CreateButton("l",{
	Title = "Pumpkin",
	Desc = "Nugget Man and $3.5m",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Gravestone")
	end})
Page4:CreateButton("l",{
	Title = "Katana",
	Desc = "$5k",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Doge")
	end})
Page4:CreateButton("l",{
	Title = "Bonk",
	Desc = "5x Money Bags and $1m",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Meme Man")
	end})
Page4:CreateButton("l",{
	Title = "Flame Katana",
	Desc = "Cheems Cola and $50k",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Meme Man")
	end})
Page4:CreateButton("l",{
	Title = "Hanger Weapon",
	Desc = "$25k",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Hanger")
	end})
Page4:CreateButton("l",{
	Title = "Banana",
	Desc = "Cat Food and $350k",
	Secure = false,
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Weapon_Seller","Smiling Cat")
	end})

Page1:CreateLabel("l",{
	Title = " - Farm Nearest",
	Desc = "Farm Monster Nearest"
})

Page1:CreateSlider("l",{
	Title = 'Distance',
	Desc = "Setup Distance Nearest",
	Min = 1,
	Max = 1000,
	Value = _G.Setting_table.DistanceNearest,
	Callback = function(vu)
		DistanceNearest = vu
		_G.Setting_table.DistanceNearest = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page1:CreateToggle("l", {
	Title = "Farm Nearest",
	Desc = "Farm Monster Nearest",
	Value = _G.Setting_table.NearestFarm,
	Callback = function(vu)
		NearestFarm = vu
		_G.Setting_table.NearestFarm = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if NearestFarm then
				for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
					if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= DistanceNearest - 1 then
						Kill(v,function() return not NearestFarm end)
					end
				end
			end
		end)
	end
end)


local Page5 = Window:AddPage({
	Title = "Misc",
	Icon = "compass",
	Page = {
		Left = {
			Name = "Fruit",
			Icon = "apple"
		},
		Right = {
			Name = "Aura",
			Icon = "shield"
		}
	}
})

Page5:CreateLabel("l",{
	Title = " - Power Fruit",
	Desc = "Power Fruit Function"
})

Page5:CreateToggle("l", {
	Title = "Store Fruit",
	Desc = "Store All Fruit",
	Value = _G.Setting_table.StoreFruit,
	Callback = function(vu)
		StoreFruit = vu
		_G.Setting_table.StoreFruit = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateToggle("l", {
	Title = "Random Fruit",
	Desc = "Random Fruit",
	Value = _G.Setting_table.RandomFruit,
	Callback = function(vu)
		RandomFruit = vu
		_G.Setting_table.RandomFruit = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateToggle("l", {
	Title = "Bring Fruit",
	Desc = "Bring Fruit",
	Value = _G.Setting_table.BringFruit,
	Callback = function(vu)
		BringFruit = vu
		_G.Setting_table.BringFruit = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateDropdown("l",{
	Title = "Method Random",
	Desc = "Select Method To Random",
	ListDesc = "Select Method To Random",
	Value = _G.Setting_table.SelectMethod,
	List = {"Gem", "Money"},
	MultiDropdown = false,
	Callback = function(vu)
		SelectMethod = vu
		_G.Setting_table.SelectMethod = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateDropdown("l",{
	Title = "Quantity Random",
	Desc = "Select Quantity To Random",
	ListDesc = "Select Quantity To Random",
	Value = _G.Setting_table.SelectQuantity,
	List = {"x1", "x3", "x10"},
	MultiDropdown = false,
	Callback = function(vu)
		SelectQuantity = vu
		_G.Setting_table.SelectQuantity = vu
		Update_Setting(getgenv()['MyName'])
	end})


task.spawn(function()
	while task.wait() do
		pcall(function()
			if StoreFruit then
				for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
					if v:FindFirstChild("Script") then
						EquipWeapon(v.Name)
						local args = {
							[1] = "Eatable_Power",
							[2] = {
								["Action"] = "Store",
								["Tool"] = workspace.Character[game.Players.LocalPlayer.Name][tostring(v.Name)]
							}
						}

						game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if BringFruit then
				for i, v in next, game:GetService("Workspace").Dropped_Items:GetChildren() do
					if v and v.ToolTip == "Power" then
						firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Handle, 0)
					end
				end
			end
		end)
	end
end)

local ahihi
local gemneed
local belineed
spawn(function()
	while wait() do
		if SelectQuantity == "x1" then
			ahihi = "Once"
			gemneed = 25
			belineed = 25000
		elseif SelectQuantity == "x3" then
			ahihi = "Triple"
			gemneed = 25 * 3
			belineed = 25000 * 3
		else
			ahihi = "Decuple"
			gemneed = 25 * 10
			belineed = 25000 * 10
		end
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if RandomFruit then
				if SelectMethod == "Gem" then
					local args = {
						[1] = "Random_Power",
						[2] = {
							["Type"] = ahihi,
							["NPCName"] = "Doge Gacha",
							["GachaType"] = "Gem"
						}
					}

					game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
				elseif SelectMethod == "Money" then
					local args = {
						[1] = "Random_Power",
						[2] = {
							["Type"] = ahihi,
							["NPCName"] = "Floppa Gacha",
							["GachaType"] = "Money"
						}
					}

					game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
						:WaitForChild("Modules"):FireServer(unpack(args))
				else
					if game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value < gemneed then
						local args = {
							[1] = "Random_Power",
							[2] = {
								["Type"] = ahihi,
								["NPCName"] = "Doge Gacha",
								["GachaType"] = "Gem"
							}
						}

						game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
					elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value < belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
						local args = {
							[1] = "Random_Power",
							[2] = {
								["Type"] = ahihi,
								["NPCName"] = "Floppa Gacha",
								["GachaType"] = "Gem"
							}
						}

						game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
					elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
						local args = {
							[1] = "Random_Power",
							[2] = {
								["Type"] = ahihi,
								["NPCName"] = "Floppa Gacha",
								["GachaType"] = "Money"
							}
						}

						game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
					end
				end
			end
		end)
	end
end)

Page5:CreateLabel("r",{
	Title = " - Aura",
	Desc = "Aura Function"
})

Page5:CreateToggle("r", {
	Title = "Random Aura",
	Desc = "Random Aura",
	Value = _G.Setting_table.RandomAura,
	Callback = function(vu)
		RandomAura = vu
		_G.Setting_table.RandomAura = vu
		Update_Setting(getgenv()['MyName'])
	end})

function Getaura()
	local aura = {}
	for i, v in next, game:GetService("Players").LocalPlayer.Items.AuraColor:GetChildren() do
		if not table.find(aura, v.Name) then
			table.insert(aura, v.Name)
		end
	end
	return aura
end

Page5:CreateDropdown("r",{
	Title = "Select Aura",
	Desc = "Will Stop If Got This Aura",
	ListDesc = "Select The Aura To Stop",
	Value = _G.Setting_table.SelectAura,
	List = Getaura(),
	MultiDropdown = false,
	Callback = function(vu)
		SelectAura = vu
		_G.Setting_table.SelectAura = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if game:GetService("Players").LocalPlayer.PlayerData.AuraColor.Value ~= SelectAura and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= 10 and RandomAura then
				game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer("Reroll_Color","Halfed Sorcerer")
			end
		end)
	end
end)

Page3:CreateLabel("l",{
	Title = " - Boss",
	Desc = "Boss Function"
})

Page3:CreateDropdown("l",{
	Title = "Select Boss",
	Desc = "Select Boss Farm",
	ListDesc = "Select Boss To Farm",
	Value = _G.Setting_table.SelectBoss,
	List = {"Lord Sus", "Evil Noob", "Giant Pumpkin"},
	MultiDropdown = false,
	Callback = function(vu)
		SelectBoss = vu
		_G.Setting_table.SelectBoss = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page3:CreateToggle("l", {
	Title = "Farm Boss",
	Desc = "Farm Boss Select",
	Value = _G.Setting_table.AutoFarmBoss,
	Callback = function(vu)
		AutoFarmBoss = vu
		_G.Setting_table.AutoFarmBoss = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page3:CreateToggle("l", {
	Title = "Get Quest Boss",
	Desc = "Get Quest Boss Farm",
	Value = _G.Setting_table.GetQuestBossFun,
	Callback = function(vu)
		GetQuestBossFun = vu
		_G.Setting_table.GetQuestBossFun = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page3:CreateToggle("l", {
	Title = "Get Quest Mon",
	Desc = "Get Quest Mon Farm",
	Value = _G.Setting_table.GetQuestMonBoss,
	Callback = function(vu)
		GetQuestMonBoss = vu
		_G.Setting_table.GetQuestMonBoss = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page3:CreateToggle("l", {
	Title = "Spawn Boss",
	Desc = "Spawn Boss Select",
	Value = _G.Setting_table.AutoSpawnBoss,
	Callback = function(vu)
		AutoSpawnBoss = vu
		_G.Setting_table.AutoSpawnBoss = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page3:CreateToggle("l", {
	Title = "Find Item Summon",
	Desc = "Find Item Summon Boss Select",
	Value = _G.Setting_table.AutoItemBoss,
	Callback = function(vu)
		AutoItemBoss = vu
		_G.Setting_table.AutoItemBoss = vu
		Update_Setting(getgenv()['MyName'])
	end})

function GetMaterial(MName)
	local ItemStorage = game:GetService("Players").LocalPlayer:WaitForChild("Items").ItemStorage
	return ItemStorage:FindFirstChild(MName) and ItemStorage[MName].Value or 0
end

task.spawn(function()
	while task.wait() do
		pcall(function()
			local function GetMon(a)
				for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
					if v.Name == a and v.Humanoid.Health > 0 then
						return v
					end
				end
				for i,v in pairs(game:GetService("ReplicatedStorage").MonsterSpawn:GetChildren()) do
					if v.Name == a and v.Humanoid.Health > 0 then
						return v
					end
				end
			end
			local function CheckQuestBoss()
				for i, v in next,MS do
					if i == SelectBoss then
						return v
					end
				end
			end
			local function GetQuestBoss()
				local function CheckQuest()
					if game.workspace.Location.QuestLocaion:FindFirstChild("Floppa Quest "..CheckQuestBoss()) then
						for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
							if v.Name == "Floppa Quest "..CheckQuestBoss() then
								return v.CFrame, v
							end
						end
					else
						for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
							if v.Name == "Floppa Quest "..CheckQuestBoss() then
								return v.WorldPivot, v
							end
						end
					end
				end
				TP(CheckQuest())
				for i,v in pairs(game:GetService("Workspace").NPCs["Quests_Npc"]["Floppa Quest "..CheckQuestBoss()].Block:GetChildren()) do
					if v.Name == "QuestPrompt" then
						fireproximityprompt(v,30)
					end
				end
			end

			local function GetQuestMon(a)
				function CheckQuestMon()
					for i, v in next,MS do
						if i == a then
							return v
						end
					end
				end
				local function CheckQuestaa()
					if game.workspace.Location.QuestLocaion:FindFirstChild("Floppa Quest "..CheckQuestMon()) then
						for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
							if v.Name == "Floppa Quest "..CheckQuestMon() then
								return v.CFrame, v
							end
						end
					else
						for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
							if v.Name == "Floppa Quest "..CheckQuestMon() then
								return v.WorldPivot, v
							end
						end
					end
				end
				TP(CheckQuestaa())
				for i,v in pairs(game:GetService("Workspace").NPCs["Quests_Npc"]["Floppa Quest "..CheckQuestMon()].Block:GetChildren()) do
					if v.Name == "QuestPrompt" then
						fireproximityprompt(v,30)
					end
				end
			end
			if SelectBoss == "Lord Sus" then
				if GetMon("Lord Sus") and AutoFarmBoss then
					if GetQuestBossFun then
						if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
							GetQuestBoss()
						else
							if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestBoss() then
								for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
									v.Function()
								end
							end
							Kill(GetMon("Lord Sus"),function() return not AutoFarmBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
						end
					else
						Kill(GetMon("Lord Sus"),function() return not AutoFarmBoss end)
					end
				else
					if GetMaterial("Sussy Orb") > 0 and AutoSpawnBoss then
						TP(CFrame.new(6644, -95, 4811))
						fireproximityprompt(game:GetService("Workspace"):WaitForChild("Island").ForgottenIsland.Summon3.Summon.SummonPrompt)
					elseif AutoItemBoss then
						if GetMon("Sus Duck") then
							if GetQuestMonBoss then
								if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
									GetQuestMon("Sus Duck")
								else
									if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestMon() then
										for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
											v.Function()
										end
									end
									Kill(GetMon("Sus Duck"),function() return not AutoItemBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
								end
							else
								Kill(GetMon("Sus Duck"),function() return not AutoItemBoss end)
							end
						else
							WaitMon("Sus Duck")
						end
					end
				end
			elseif SelectBoss == "Evil Noob" then
				if GetMon("Evil Noob") and AutoFarmBoss then
					if GetQuestBossFun then
						if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
							GetQuestBoss()
						else
							if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestBoss() then
								for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
									v.Function()
								end
							end
							Kill(GetMon("Evil Noob"),function() return not AutoFarmBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
						end
					else
						Kill(GetMon("Evil Noob"),function() return not AutoFarmBoss end)
					end
				else
					if GetMaterial("Noob Head") > 0 and AutoSpawnBoss then
						TP(CFrame.new(-2356, -81, 3180))
						fireproximityprompt(game:GetService("Workspace"):WaitForChild("Island").MoaiIsland.Summon2.Summon.SummonPrompt)
					elseif AutoItemBoss then
						if GetMon("Moai") then
							if GetQuestMonBoss then
								if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
									GetQuestMon("Moai")
								else
									if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestMon() then
										for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
											v.Function()
										end
									end
									Kill(GetMon("Moai"),function() return not AutoItemBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
								end
							else
								Kill(GetMon("Moai"),function() return not AutoItemBoss end)
							end
						else
							WaitMon("Moai")
						end
					end
				end
			elseif SelectBoss == "Giant Pumpkin" then
				if GetMon("Giant Pumpkin") and AutoFarmBoss then
					if GetQuestBossFun then
						if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
							GetQuestBoss()
						else
							if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestBoss() then
								for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
									v.Function()
								end
							end
							Kill(GetMon("Giant Pumpkin"),function() return not AutoFarmBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
						end
					else
						Kill(GetMon("Giant Pumpkin"),function() return not AutoFarmBoss end)
					end
				else
					if GetMaterial("Flame Orb") > 0 and AutoSpawnBoss then
						TP(CFrame.new(-1180, -93, 1462))
						fireproximityprompt(game:GetService("Workspace"):WaitForChild("Island").PumpkinIsland.Summon1.Summon.SummonPrompt)
					elseif AutoItemBoss then
						if GetMon("Scary Skull") then
							if GetQuestMonBoss then
								if not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible then
									GetQuestMon("Scary Skull")
								else
									if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= "Floppa Quest "..CheckQuestMon() then
										for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
											v.Function()
										end
									end
									Kill(GetMon("Scary Skull"),function() return not AutoItemBoss or not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible end)
								end
							else
								Kill(GetMon("Scary Skull"),function() return not AutoItemBoss end)
							end
						else
							WaitMon("Scary Skull")
						end
					end
				end
			end
		end)
	end
end)

Page5:CreateLabel("r",{
	Title = " - Level Aura",
	Desc = "Farm Aura Function"
})

Page5:CreateToggle("r", {
	Title = "Farm Aura",
	Desc = "Farm Aura Level",
	Value = _G.Setting_table.AutoFarmAura,
	Callback = function(vu)
		AutoFarmAura = vu
		_G.Setting_table.AutoFarmAura = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateToggle("r", {
	Title = "Farm Flash Step",
	Desc = "Farm Flash Step Level",
	Value = _G.Setting_table.AutoFarmFlash,
	Callback = function(vu)
		AutoFarmFlash = vu
		_G.Setting_table.AutoFarmFlash = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateToggle("r", {
	Title = "Farm Instinct",
	Desc = "Farm Instinct Level",
	Value = _G.Setting_table.AutoFarmInstinct,
	Callback = function(vu)
		AutoFarmInstinct = vu
		_G.Setting_table.AutoFarmInstinct = vu
		Update_Setting(getgenv()['MyName'])
	end})
Page5:CreateToggle("r", {
	Title = "Enabled Rejoin",
	Desc = "Rejoin when intuition runs out",
	Value = _G.Setting_table.RejoinInstinct,
	Callback = function(vu)
		RejoinInstinct = vu
		_G.Setting_table.RejoinInstinct = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if AutoFarmAura then
				for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
					if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
						if #game.Players.LocalPlayer.Character.AuraColor_Folder:GetChildren() < 1 then
							game.Players.LocalPlayer.Ability.Aura.Value = true
							game.ReplicatedStorage:WaitForChild("OtherEvent").MainEvents.Ability:InvokeServer("Aura")
						end
						Kill(v,function() return not AutoFarmAura end)
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if AutoFarmInstinct then
				if not game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Enabled then
					if ActiceInstinct then
						for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
							if v.Name == "Handsome Man" and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									if v.Humanoid.Health < v.Humanoid.MaxHealth then
										if game.Players.LocalPlayer.Character:FindFirstChild("Highlight_Player") then
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-3))
										else
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
											if not _G.SAfsafsa then
												Library:Notify({
													Title = "[Farm Instinct]",
													Desc = "Check Instinct",
													Time = 3
												})
											end
											wait(3)
											if RejoinInstinct then
												if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight_Player") then
													_G.SAfsafsa = true
													Library:Notify({
														Title = "[Farm Instinct]",
														Desc = "Rejoining",
														Time = 3
													})
													return game:GetService("TeleportService"):Teleport(game.PlaceId)
												end
											end
										end
									else
										FarmMon(v)
										pcall(function()
											if BringMobF then
												BringMob(v.HumanoidRootPart.CFrame)
											end
										end)
										EquipWeapon(Weapon)
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1e4, 1e4))
									end
								until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or not AutoFarmInstinct or not ActiceInstinct
							else
								WaitMon("Handsome Man")
							end
						end
					else
						Library:Notify({
							Title = "[Farm Instinct]",
							Desc = "Pls Trun On Auto Instinct Function",
							Time = 5
						})
						wait(4)
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if AutoFarmFlash then
				local args = {
					[1] = "FlashStep",
					[2] = {
						["Mouse"] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					}
				}

				game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Ability:InvokeServer(unpack(args))
			end
		end)
	end
end)

local Page6 = Window:AddPage({
	Title = "Combat",
	Icon = "swords",
	Page = {
		Left = {
			Name = "Players",
			Icon = "user"
		},
		Right = {
			Name = "Bounty",
			Icon = "award"
		}
	}
})

Page6:CreateLabel("l",{
	Title = " - Combat",
	Desc = "Combat Function"
})

Page6:CreateLabel("r",{
	Title = " - Bounty",
	Desc = "Bounty Function"
})

Page6:CreateLabel("r",{
	Title = "Comming Soon",
	Desc = ""
})

local plrl = {}
for i, v in next, workspace:WaitForChild("Character"):GetChildren() do
	if not table.find(plrl, v.Name) and not v.Name ~= game.Players.LocalPlayer.Name then
		table.insert(plrl, v.Name)
	end
end

local DropdownPlr = Page6:CreateDropdown("l",{
	Title = "Select Player",
	Desc = "Select The Player",
	ListDesc = "Select The Player",
	Value = _G.Setting_table.SelectPlayer,
	List = plrl,
	MultiDropdown = false,
	Callback = function(vu)
		SelectPlayer = vu
		_G.Setting_table.SelectPlayer = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page6:CreateButton("l",{
	Title = "Refresh Player",
	Desc = "",
	Secure = false,
	Callback = function()
		DropdownPlr:Clear()

		for i, v in next, workspace:WaitForChild("Character"):GetChildren() do
			if not table.find(plrl, v.Name) and not v.Name ~= game.Players.LocalPlayer.Name then
				table.insert(plrl, v.Name)
			end
		end

		for i,v in ipairs(plrl) do
			DropdownPlr:AddList(v,i)
		end
	end})

Page6:CreateButton("l",{
	Title = "Teleport To Player",
	Desc = "No Auto",
	Secure = false,
	Callback = function()
		TP(workspace:WaitForChild("Character")[SelectPlayer].HumanoidRootPart.CFrame)
	end})

Page6:CreateToggle("l", {
	Title = "Teleport To Player",
	Desc = "Auto Teleport To Player",
	Value = _G.Setting_table.AutoTeleport,
	Callback = function(vu)
		AutoTeleport = vu
		_G.Setting_table.AutoTeleport = vu
		Update_Setting(getgenv()['MyName'])
	end})

Page6:CreateToggle("l", {
	Title = "Kill Player",
	Desc = "Auto Kill Player Select",
	Value = _G.Setting_table.KillPlayer,
	Callback = function(vu)
		KillPlayer = vu
		_G.Setting_table.KillPlayer = vu
		Update_Setting(getgenv()['MyName'])
	end})

task.spawn(function()
	while task.wait() do
		pcall(function()
			if AutoTeleport then
				TP(workspace:WaitForChild("Character")[SelectPlayer].HumanoidRootPart.CFrame)
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if KillPlayer then
				for i,v in next,workspace:WaitForChild("Character"):GetChildren() do
					if v.Name == SelectPlayer and v.Humanoid.Health > 0 then
						Kill(v,function() return not KillPlayer end)
					end
				end
			end
		end)
	end
end)
Library:Notify({
	Title = "Dummy Hub",
	Desc = "Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs",
	Time = 8
})
