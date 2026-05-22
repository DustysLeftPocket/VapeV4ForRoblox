local run = function(func) func() end
local cloneref = cloneref or function(obj) return obj end

local playersService = cloneref(game:GetService('Players'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local inputService = cloneref(game:GetService('UserInputService'))

local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local sessioninfo = vape.Libraries.sessioninfo

local function notif(...)
	return vape:CreateNotification(..., 5)
end

run(function()
	-- Initialize game-specific objects
	local gameObjects = {}
	
	-- Clean up on uninject
	vape:Clean(function()
		table.clear(gameObjects)
	end)
end)

-- Remove any existing modules from these categories to avoid duplicates
for i, _ in pairs(vape.Modules) do
	if vape.Modules[i].Category == 'Farming' or vape.Modules[i].Category == 'Slimes' or vape.Modules[i].Category == 'Utility' or vape.Modules[i].Category == 'Miscellaneous' then
		vape:Remove(i)
	end
end

-- Create Farming category modules
run(function()
	local AutoCollect
	local AutoFeed

	-- Create Farming category if it doesn't exist
	if not vape.Categories.Farming then
		vape.Categories.Farming = vape.Categories.Main:CreateCategory({
			Name = 'Farming',
			Icon = getcustomasset('newvape/assets/combaticon.png'),
			Size = UDim2.fromOffset(13, 14)
		})
	end

	AutoCollect = vape.Categories.Farming:CreateModule({
		Name = 'Auto Collect',
		Function = function(callback)
			if callback then
				-- Implementation for auto-collecting items
				notif('Farming', 'Auto Collect enabled', 3)
			else
				notif('Farming', 'Auto Collect disabled', 3)
			end
		end,
		Tooltip = 'Automatically collects dropped items.'
	})

	AutoFeed = vape.Categories.Farming:CreateModule({
		Name = 'Auto Feed',
		Function = function(callback)
			if callback then
				-- Implementation for auto-feeding slimes
				notif('Farming', 'Auto Feed enabled', 3)
			else
				notif('Farming', 'Auto Feed disabled', 3)
			end
		end,
		Tooltip = 'Automatically feeds your slimes.'
	})
end)

-- Create Slimes category modules
run(function()
	local AutoMerge
	local AutoPlort

	-- Create Slimes category if it doesn't exist
	if not vape.Categories.Slimes then
		vape.Categories.Slimes = vape.Categories.Main:CreateCategory({
			Name = 'Slimes',
			Icon = getcustomasset('newvape/assets/blatanticon.png'),
			Size = UDim2.fromOffset(14, 14)
		})
	end

	AutoMerge = vape.Categories.Slimes:CreateModule({
		Name = 'Auto Merge',
		Function = function(callback)
			if callback then
				-- Implementation for auto-merging slimes
				notif('Slimes', 'Auto Merge enabled', 3)
			else
				notif('Slimes', 'Auto Merge disabled', 3)
			end
		end,
		Tooltip = 'Automatically merges slimes together.'
	})

	AutoPlort = vape.Categories.Slimes:CreateModule({
		Name = 'Auto Plort',
		Function = function(callback)
			if callback then
				-- Implementation for auto-producing plorts
				notif('Slimes', 'Auto Plort enabled', 3)
			else
				notif('Slimes', 'Auto Plort disabled', 3)
			end
		end,
		Tooltip = 'Automatically collects plorts from slimes.'
	})
end)

-- Create Utility category modules
run(function()
	local PlayerEsp
	local NoClip

	-- Create Utility category if it doesn't exist
	if not vape.Categories.Utility then
		vape.Categories.Utility = vape.Categories.Main:CreateCategory({
			Name = 'Utility',
			Icon = getcustomasset('newvape/assets/utilityicon.png'),
			Size = UDim2.fromOffset(15, 14)
		})
	end

	PlayerEsp = vape.Categories.Utility:CreateModule({
		Name = 'Player ESP',
		Function = function(callback)
			if callback then
				-- Implementation for player ESP
				notif('Utility', 'Player ESP enabled', 3)
			else
				notif('Utility', 'Player ESP disabled', 3)
			end
		end,
		Tooltip = 'Shows player locations.'
	})

	NoClip = vape.Categories.Utility:CreateModule({
		Name = 'No Clip',
		Function = function(callback)
			if callback then
				-- Implementation for noclip
				notif('Utility', 'No Clip enabled', 3)
			else
				notif('Utility', 'No Clip disabled', 3)
			end
		end,
		Tooltip = 'Walk through walls.'
	})
end)

-- Create Miscellaneous category modules
run(function()
	local Fullbright
	local BTools

	-- Create Miscellaneous category if it doesn't exist
	if not vape.Categories.Miscellaneous then
		vape.Categories.Miscellaneous = vape.Categories.Main:CreateCategory({
			Name = 'Miscellaneous',
			Icon = getcustomasset('newvape/assets/rendericon.png'),
			Size = UDim2.fromOffset(15, 14)
		})
	end

	Fullbright = vape.Categories.Miscellaneous:CreateModule({
		Name = 'Fullbright',
		Function = function(callback)
			if callback then
				-- Implementation for fullbright
				notif('Miscellaneous', 'Fullbright enabled', 3)
			else
				notif('Miscellaneous', 'Fullbright disabled', 3)
			end
		end,
		Tooltip = 'Brightens the game world.'
	})

	BTools = vape.Categories.Miscellaneous:CreateModule({
		Name = 'BTools',
		Function = function(callback)
			if callback then
				-- Implementation for building tools
				notif('Miscellaneous', 'BTools enabled', 3)
			else
				notif('Miscellaneous', 'BTools disabled', 3)
			end
		end,
		Tooltip = 'Spawn and manipulate objects.'
	})
end)

-- Clean up on game change
vape:Clean(playersService.LocalPlayer.CharacterAdded:Connect(function()
	-- Reset any game-specific states when character respawns
end))