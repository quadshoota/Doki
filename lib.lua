local LocalPlayer = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
ReplicatedStorage:WaitForChild("GameEvents", 9e9)
local GameEvents = ReplicatedStorage.GameEvents

loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])();

local Modules = {}
local ModuleCache = {}
local function LoadModule(Base, Path)
    local CacheKey = tostring(Base) .. Path
    if (ModuleCache[CacheKey]) then
        return ModuleCache[CacheKey]
    end

    local Components = Path:split(".")

    for _, Component in Components do
        Base = Base:FindFirstChild(Component)

        if (not Base) then
            return false
        end
    end
    
    Base = require(Base)
    ModuleCache[CacheKey] = Base
    return Base
end

local ModuleLoader = {
    WaitForAllModules = function(self)
        repeat task.wait(0.25) until ReplicatedStorage:FindFirstChild("Data") and ReplicatedStorage:FindFirstChild("Modules")
       
        Modules.SeedData = (function()
            return LoadModule(ReplicatedStorage, "Data.SeedData") or {}
        end)()

        Modules.ItemTypeEnums = (function()
            return LoadModule(ReplicatedStorage, "Data.EnumRegistry.ItemTypeEnums") or {}
        end)()
        
        Modules.EasterData = (function()
            return LoadModule(ReplicatedStorage, "Data.EasterData") or {}
        end)()
        
        Modules.Comma_Module = (function()
            return LoadModule(ReplicatedStorage, "Comma_Module") or {}
        end)()
        
        Modules.CollectController = (function()
            return LoadModule(ReplicatedStorage, "Modules.CollectController") or {}
        end)()
        
        Modules.CollectionService = game:GetService("CollectionService")
        
        Modules.getFarm = (function()
            return LoadModule(ReplicatedStorage, "Modules.GetFarm") or {}
        end)()
        
        Modules.Mutations = (function()
            return LoadModule(ReplicatedStorage, "Modules.MutationHandler") or {}
        end)()
        
        Modules.DataService = (function()
            return LoadModule(ReplicatedStorage, "Modules.DataService") or {}
        end)()
        
        Modules.GearData = (function()
            return LoadModule(ReplicatedStorage, "Data.GearData") or {}
        end)()

        Modules.PetUtilities = (function()
            return LoadModule(ReplicatedStorage, "Modules.PetServices.PetUtilities") or {}
        end)()

        Modules.ActivePetsService = (function()
            return LoadModule(ReplicatedStorage, "Modules.PetServices.ActivePetsService") or {}
        end)()
        
        Modules.EggData = (function()
            return LoadModule(ReplicatedStorage, "Data.PetEggData") or {}
        end)()
        
        Modules.PetEggs = (function()
            return LoadModule(ReplicatedStorage, "Data.PetRegistry.PetEggs") or {}
        end)()
        
        Modules.Notification = (function()
            return LoadModule(ReplicatedStorage, "Modules.Notification") or {}
        end)()
        
        Modules.MarketController = (function()
            return LoadModule(ReplicatedStorage, "Modules.MarketController") or {}
        end)()
        
        Modules.Remotes = (function()
            return LoadModule(ReplicatedStorage, "Modules.Remotes") or {}
        end)()
        
        Modules.SeedpackController = (function()
            return LoadModule(ReplicatedStorage, "Modules.SeedPackController") or {}
        end)()
        
        Modules.PetRarities = (function()
            return LoadModule(ReplicatedStorage, "Data.PetRegistry.PetRarities") or {}
        end)()
        
        Modules.CountDictionary = (function()
            return LoadModule(ReplicatedStorage, "Modules.CountDictionary") or {}
        end)()
        
        Modules.InventoryService = (function()
            return LoadModule(ReplicatedStorage, "Modules.InventoryService") or {}
        end)()
        
        Modules.SeedPackData = (function()
            return LoadModule(ReplicatedStorage, "Data.SeedPackData") or {}
        end)()
        
        Modules.NightQuestRewardData = (function()
            return LoadModule(ReplicatedStorage, "Data.NightQuestRewardData") or {}
        end)()
        
        Modules.CalculatePlantValue = (function()
            return LoadModule(ReplicatedStorage, "Modules.CalculatePlantValue") or {}
        end)()
        
        Modules.Item_Module = (function()
            return LoadModule(ReplicatedStorage, "Item_Module") or {}
        end)()
        
        Modules.StringUtils = (function()
            return LoadModule(ReplicatedStorage, "Modules.StringUtils") or {}
        end)()
        
        Modules.TableUtils = (function()
            return LoadModule(ReplicatedStorage, "Modules.TableUtils") or {}
        end)()
        
        Modules.PetList = (function()
            return LoadModule(ReplicatedStorage, "Data.PetRegistry.PetList") or {}
        end)()
        
        Modules.CosmeticItemData = (function()
            return LoadModule(ReplicatedStorage, "Data.CosmeticItemShopData") or {}
        end)()
        
        Modules.CosmeticCrateData = (function()
            return LoadModule(ReplicatedStorage, "Data.CosmeticCrateShopData") or {}
        end)()

        Modules.NightEventShopData = (function()
            return LoadModule(ReplicatedStorage, "Data.NightEventShopData") or {}
        end)()

        Modules.HoneyShopData = (function()
            return LoadModule(ReplicatedStorage, "Data.HoneyEventShopData") or {}
        end)()
        
        Modules.EventShopData = (function()
            return LoadModule(ReplicatedStorage, "Data.EventShopData") or {}
        end)()

        Modules.CraftingData = (function()
            return LoadModule(ReplicatedStorage, "Data.CraftingData") or {}
        end)()

        Modules.GetPlayerFromPlant = (function()
            return LoadModule(ReplicatedStorage, "Modules.GetPlayerFromPlant") or {}
        end)()

        Modules.PlantTraitsData = (function()
            return LoadModule(ReplicatedStorage, "Modules.PlantTraitsData") or {}
        end)()

        Modules.GnomeMerchantShopData = (function()
            return LoadModule(ReplicatedStorage, "Data.TravelingMerchant.TravelingMerchantData.GnomeMerchantShopData") or {}
        end)()

        Modules.SkyMerchantShopData = (function()
            return LoadModule(ReplicatedStorage, "Data.TravelingMerchant.TravelingMerchantData.SkyMerchantShopData") or {}
        end)()

        return true
    end,
}

local loadingComplete = false
task.spawn(function()
    loadingComplete = ModuleLoader:WaitForAllModules()
end)

repeat task.wait(0.25) until loadingComplete

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/quadshoota/Doki/refs/heads/main/lib.lua"))()
local Storage =
{
    Icons = {},
    ConfigsPath = nil,
}


local Dependencies =
{
    VerifyAssets = function(self)
        local assets = loadstring(game:HttpGet("https://raw.githubusercontent.com/quadshoota/Doki/refs/heads/main/Available.lua"))()

        for i,v in pairs(assets) do
            if (not isfile("Doki/Icons/" .. v .. ".png")) then
                local success, errorMessage = pcall(function()
                    writefile("Doki/Icons/" .. v .. ".png", game:HttpGet("https://github.com/quadshoota/Doki/tree/main/Icons" .. v .. ".png"))
                end)

                if (not success) then
                    warn("Failed to download asset: " .. v .. " - " .. errorMessage)
                else
                    Storage.Icons[v] = "rbxasset://Doki/Icons/" .. v
                    warn("Downloaded asset: " .. v)
                end
            end

            if (isfile("Doki/Icons/" .. v .. ".png")) then
                Storage.Icons[v] = "rbxasset://Doki/Icons/" .. v
            end
        end
    end,

    Cleanname = function(self, name)
        return name:gsub("[^%a]", ""):lower()
    end,

    CreateDirectories = function(self)
        local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        gamename = self:Cleanname(gamename)
        
        local dokipath = "Doki"
        if (not isfolder(dokipath)) then
            makefolder(dokipath)
        end

        local iconspath = dokipath .. "/Icons"
        if (not isfolder(iconspath)) then
            makefolder(iconspath)
        end

        local path = "Doki/" .. gamename .. "/"
        if (not isfolder(path)) then
            makefolder(path)
        end

        local configspath = path .. "Configs"
        if (not isfolder(configspath)) then
            makefolder(configspath)
        end

        Storage.ConfigsPath = configspath
        self:VerifyAssets()
    end,

    CustomAsset = function(self, assetName) 
        if (not (Storage.Icons[assetName])) then
            warn("Asset not found: " .. assetName)
            return "rbxassetid://0"
        end

        local path = "Doki/Icons/" .. assetName .. ".png"
        if (not isfile(path)) then
            warn("Asset file not found: " .. path)
            return "rbxassetid://0"
        end

        local toasset = getcustomasset(path)
        if (not toasset) then
            warn("Failed to get custom asset: " .. path)
            return "rbxassetid://0"
        end

        return toasset
    end,
}

local virtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)


Dependencies:CreateDirectories()
Library:Window({
    Name = "DOKI HUB",
    Key = "LunacyWindowsDetectionBoss7261",
    Logo = Dependencies:CustomAsset("Doki"),
})

Library:MobileButton()
local libutils = 
{
    Refs =
    {
        Link = "https://raw.githubusercontent.com/quadshoota/Doki/refs/heads/main/data.lua",
    },

    GetUpdateString = function(self)
        local success, data = pcall(function()
            return loadstring(game:HttpGet(self.Refs.Link))()
        end)
        
        if (not success or not data) then
            return "Failed to fetch update info"
        end
        
        if (not data.Updated) then
            return "No update date available"
        end
        
        local dateStr = data.Updated
        local year, month, day, hour, minute = dateStr:match("(%d+)-(%d+)-(%d+) (%d+):(%d+)")
        
        if (not year) then
            return "Invalid date format"
        end
        
        local currentTime = os.time()
        
        local updateTime = os.time({
            year = tonumber(year),
            month = tonumber(month),
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(minute),
            sec = 0
        })
        
        local timeDiff = currentTime - updateTime
        local daysDiff = math.floor(timeDiff / (24 * 3600))
        local hoursDiff = math.floor(timeDiff / 3600)
        local minutesDiff = math.floor(timeDiff / 60)
        
        if (daysDiff >= 7) then
            local weeksDiff = math.floor(daysDiff / 7)
            return weeksDiff == 1 and "1 week ago" or weeksDiff .. " weeks ago"
        elseif (daysDiff >= 1) then
            return daysDiff == 1 and "1 day ago" or daysDiff .. " days ago"
        elseif (hoursDiff >= 1) then
            return hoursDiff == 1 and "1 hour ago" or hoursDiff .. " hours ago"
        elseif (minutesDiff >= 1) then
            return minutesDiff == 1 and "1 minute ago" or minutesDiff .. " minutes ago"
        else
            return "Just now"
        end
    end,
    
    GetUpdateData = function(self)
        local success, data = pcall(function()
            return loadstring(game:HttpGet(self.Refs.Link))()
        end)
        
        if (success and data) then
            return data
        end
        
        return nil
    end,

    formatVersion = function(self, version)
        local formattedVersion = "v" .. version:sub(2):gsub(".", "%0.")
        return formattedVersion:sub(1, #formattedVersion - 1)
    end,
}

local Tabs =
{
    Farm = Library:Tab({
        Title = "Farm",
        Icon = Dependencies:CustomAsset("browsers"),
        Vertical = false,
    }),

    Shop = Library:Tab({
        Title = "Shop",
        Icon = Dependencies:CustomAsset("refresh"),
        Vertical = false,
    }),

    Pets = Library:Tab({
        Title = "Pets",
        Icon = Dependencies:CustomAsset("archive"),
        Vertical = false,
    }),

    Plot = Library:Tab({
        Title = "Plot",
        Icon = Dependencies:CustomAsset("version"),
        Vertical = false,
    }),

    Statistics = Library:Tab({
        Title = "Statistics",
        Icon = Dependencies:CustomAsset("user"),
        Vertical = false,
    }),

    --[[
        Trading = Library:Tab({
        Title = "Trading",
        Icon = Dependencies:CustomAsset("user"),
        Vertical = false,
    }),
    ]]


    Configs = Library:Tab({
        Title = "Configs",
        Icon = Dependencies:CustomAsset("codeblock"),
        Vertical = false,
    }),
}

local Sections = 
{
    Farm = Tabs.Farm:Section({
        Title = "Farm",
        Side = "Left",
        ShowTitle = false,
    }),

    Sell = Tabs.Farm:Section({
        Title = "Sell",
        Side = "Right",
        ShowTitle = false,
    }),

    User = Tabs.Farm:Section({
        Title = "User",
        Side = "Right",
        ShowTitle = false,
    }),

    Purchase = Tabs.Shop:Section({
        Title = "Purchase",
        Side = "Left",
        ShowTitle = false,
    }),

    PurchaseTwo = Tabs.Shop:Section({
        Title = "Purchase Two",
        Side = "Right",
        ShowTitle = false,
    }),

    -- PETS
    Hatching = Tabs.Pets:Section({
        Title = "Hatching",
        Side = "Left",
        ShowTitle = false,
    }),

    Movement = Tabs.Pets:Section({
        Title = "Movement",
        Side = "Right",
        ShowTitle = false,
    }),

    Feeding = Tabs.Pets:Section({
        Title = "Feeding",
        Side = "Left",
        ShowTitle = false,
    }),

    Objects = Tabs.Plot:Section({
        Title = "Objects",
        Side = "Left",
        ShowTitle = false,
    }),

    FruitStats = Tabs.Statistics:Section({
        Title = "Fruit Stats",
        Side = "Right",
        ShowTitle = false,
    }),

    PetStats = Tabs.Statistics:Section({
        Title = "Pet Stats",
        Side = "Left",
        ShowTitle = false,
    }),


    Configs = Tabs.Configs:Section({
        Title = "Configs",
        Side = "Left",
        ShowTitle = false,
    }),

    -- Trading
    --[[
        Trading = Tabs.Trading:Section({
        Title = "Trading",
        Side = "Left",
        ShowTitle = false,
    }),

    Settings = Tabs.Trading:Section({
        Title = "Settings",
        Side = "Right",
        ShowTitle = false,
    }),
    ]]
}

local Subsections = 
{
    Collect = Sections.Farm:Subsection({
        Name = "Collect",
        Side = "Left",
    }),

    Farm = Sections.Farm:Subsection({
        Name = "Garden",
        Side = "Right",
    }),

    Sell = Sections.Sell:Subsection({
        Name = "Sell",
        Side = "Left",
    }),

    Favourite = Sections.Sell:Subsection({
        Name = "Favourite",
        Side = "Right",
    }),

    Seeds = Sections.Purchase:Subsection({
        Name = "Seeds",
        Side = "Left",
    }),

    Gears = Sections.Purchase:Subsection({
        Name = "Gears",
        Side = "Right",
    }),

    Eggs = Sections.PurchaseTwo:Subsection({
        Name = "Eggs",
        Side = "Left",
    }),

    Cosmetics = Sections.PurchaseTwo:Subsection({
        Name = "Cosmetics",
        Side = "Left",
    }),

    -- PETS
    Freeze = Sections.Movement:Subsection({
        Name = "Freeze",
        Side = "Left",
    }),

    Hatch = Sections.Hatching:Subsection({
        Name = "Hatch",
        Side = "Left",
    }),

    SellPets = Sections.Hatching:Subsection({
        Name = "Sell",
        Side = "Right",
    }),

    Feed = Sections.Feeding:Subsection({
        Name = "Feed",
        Side = "Right",
    }),

    -- Plot
    Movable = Sections.Objects:Subsection({
        Name = "Movable",
        Side = "Left",
    }),

    Destructible = Sections.Objects:Subsection({
        Name = "Destructible",
        Side = "Right",
    }),

    FruitStats = Sections.FruitStats:Subsection({
        Name = "Fruit Stats",
        Side = "Left",
    }),

    PetStats = Sections.PetStats:Subsection({
        Name = "Pet Stats",
        Side = "Right",
    }),
}

if (not LPH_OBFUSCATED) then
    LRM_ScriptVersion = "v002"
end

local updateData = libutils:GetUpdateData()
local updateString = libutils:GetUpdateString()
Sections.User:Paragraph({
    Title = "Information",
    Description = {
    {
        Icon = Dependencies:CustomAsset("user"),
        Text = "User » " .. LocalPlayer.Name,
    },
    {
        Icon = Dependencies:CustomAsset("version"),
        Text = "Version » " .. libutils:formatVersion(LRM_ScriptVersion),
    },
    {
        Icon = Dependencies:CustomAsset("date"),
        Text = "Updated » " .. updateString,
    },
    {
        Icon = Dependencies:CustomAsset("checkmark"),
        Text = "Premium » Trial",
    },
    },
    Position = "Center",
})

local Configs = 
{
    General =
    {
        AllFruits = {},
        AllMutations = {},
        AllSeeds = {},
        AllGears = {},
        AllWeathers = {},
    },

    Main =
    {
        FreezePets = false,
        PetsList = {},
        SelectedPets = {},
    },

    Farm =
    {
        AutoCollect = false,

        AutoCollectModes = {"Maximum", "Limited"},
        SelectedCollectMode = "Maximum",
        AutoTranquilMode = {"Channeler", "Zen Racoon"},
        SelectedTranquilMode = {"Channeler"},
        AutoGiveTranquil = false,

        CollectMutationsModes = {"Disabled", "Only", "Ignore"},
        SelectedCollectMutationsMode = "Disabled",
        SelectedMutations = {},

        CollectFruitsModes = {"Disabled", "Only", "Ignore"},
        SelectedCollectFruitsMode = "Disabled",
        SelectedFruits = {},

        CollectWeathersModes = {"Disabled", "Only", "Ignore"},
        SelectedCollectWeathersMode = "Disabled",
        SelectedWeathers = {},

        CollectAdditionalFilters = {"Weight", "Price"},
        SelectedCollectAdditionalFilters = {},
        CollectWeight = 0,
        CollectPrice = 0,

        AutoPlant = false,
        AutoPlantModes = {"Placeable Spot", "Character"},
        SelectedPlantMode = "Placeable Spot",
        AutoPlantSeeds = {},
        AutoPlantSelectedSeeds = {},
    },

    Sell = 
    {
        AutoSell = false,
        AutoSellModes = {"Inventory", "Timer"},
        SelectedSellMode = {},
        AutoSellTimer = 60,
    },

    Favourite =
    {
        AutoFavourite = false,
        AutoFavoriteOptions = {"Weight", "Price", "Mutations"},
        SelectedFavouriteOptions = {},
        SelectedWeight = 0,
        SelectedPrice = 0,
        SelectedMutations = {},
    },

    Shop =
    {
        AutoPurchaseSeeds = false,
        SeedPurchaseSelection = {},
        SelectedPurchaseSeeds = {},
        SeedPurchaseAmount = 1,

        AutoPurchaseGears = false,
        GearPurchaseSelection = {},
        SelectedPurchaseGears = {},
        GearPurchaseAmount = 1,

        AutoPurchaseEggs = false,
        EggPurchaseSelection = {},
        SelectedPurchaseEggs = {},
        EggPurchaseAmount = 1,

        AutoPurchaseCosmetics = false,
        CosmeticPurchaseSelection = {},
        SelectedPurchaseCosmetics = {},
        CosmeticPurchaseAmount = 1,
    },

    Pets =
    {
        AutoHatchEggs = false,
        AutoPlaceEggs = false,
        AutoPlaceEggsOptions = {},
        SelectedAutoPlaceEggs = {},

        SellPets = false,
        SellPetsOptions = {"Rarity", "Weight", "Age"},
        SelectedSellPetsOptions = {"Rarity"},
        SellPetsRarities = {},
        SelectedSellPetsRarities = {},
        SellPetsWeight = 0,
        SellPetsAge = 0,

        AutoFeed = false,
        FeedPetList = {},
        SelectedFeedPet = {},
        AllowMutationsList = {},
        SelectedAllowMutations = {},
        FeedAtHunger = 30,
        FeedTillHunger = 100,
    },

    Trading =
    {
        AutoTrade = false,
        TradePlayerlist = {},
        SelectedTradePlayer = {},

        AutoTradeItems = {"Fruits", "Pets"},
        SelectedAutoTradeItems = {},


        --
        AutoAcceptTrades = false,
    },

    Plot =
    {
        AutoDestroy = false,
        Removables = {},
        SelectedRemovables = {},

        MoveFruits = false,
        MovableFruits = {},
        SelectedMovableFruits = {},
        MoveFruitsMode = {"Character", "Moon Cat", "Praying Mantis", "Echo Frog", "Frog", "Toucan"},
        SelectedMoveFruitsMode = {},
    },
}

local AllMutations = Modules.Mutations:GetMutations()
for _, mutation in pairs(AllMutations) do
    table.insert(Configs.General.AllMutations, mutation.Name)
    --table.insert(Configs.Trading.MutationsList, mutation.Name)
    table.insert(Configs.Pets.AllowMutationsList, mutation.Name)
end

for gearName in pairs(Modules.GearData) do
    table.insert(Configs.General.AllGears, gearName)
    table.insert(Configs.Shop.GearPurchaseSelection, gearName)
end

for cratename, crateinfo in pairs(Modules.CosmeticCrateData) do
    table.insert(Configs.Shop.CosmeticPurchaseSelection, cratename)
end

for itemName, itemInfo in pairs(Modules.CosmeticItemData) do
    table.insert(Configs.Shop.CosmeticPurchaseSelection, itemName)
end

for eggname, egginfo in pairs(Modules.PetEggs) do
    if (eggname == "Fake Egg" or eggname == "Premium Night Egg" or eggname == "Exotic Bug Egg") then continue end
    table.insert(Configs.Shop.EggPurchaseSelection, eggname)
    table.insert(Configs.Pets.AutoPlaceEggsOptions, eggname)
end

for seedName, seedInfo in pairs(Modules.SeedData) do
    table.insert(Configs.General.AllSeeds, seedName)
    table.insert(Configs.General.AllFruits, seedName)
    table.insert(Configs.Shop.SeedPurchaseSelection, seedName)
    --table.insert(Configs.Trading.FruitsList, seedName)
    local seedDisplayName = seedName .. " Seed"
    table.insert(Configs.Farm.AutoPlantSeeds, seedDisplayName)
end

for i,v in ipairs(LocalPlayer.PlayerScripts.WeatherClient:GetChildren()) do
    table.insert(Configs.General.AllWeathers, v.Name)
end

for petRarity, petInfo in pairs(Modules.PetRarities) do
    table.insert(Configs.Pets.SellPetsRarities, petRarity)
end


local Utils =
{
    _cachedReturnGarden = nil,
    ReturnGarden = LPH_NO_VIRTUALIZE(function(self)
        if (self._cachedReturnGarden ~= nil) then
            return self._cachedReturnGarden
        end

        local lp = LocalPlayer
        if (not lp) then return end

        local result = Modules.getFarm(lp)
        self._cachedReturnGarden = result
        return result
    end),

    GetResult = LPH_NO_VIRTUALIZE(function(self, instance, search)
        if (not instance or not search) then return nil end
        local uuid = instance:GetAttribute("c")
        if (not uuid) then return nil end
        
        local item = Modules.DataService:GetData().InventoryData[uuid]
        if (not item) then return nil end

        local current = item
        for key in string.gmatch(search, "[^%.]+") do
            if (type(current) ~= "table") then return nil end
            current = current[key]
            if (current == nil) then return nil end
        end
        return current
    end),

    ItemTypes = function(self, type)
        if (type == "b" or type == "s" or type == "q" or type == "i" or type == "h" or type == "f" or type == "d") then
            return "Gear"
        elseif (type == "c" or type == "l") then
            return "Pet"
        end
    end,

    GetSeedPrice = function(self, seedName) 
        for seedName, seedInfo in pairs(Modules.SeedData) do
            local price = seedInfo.Price or seedInfo.FallbackPrice or 0
            local sheckles = game:GetService("Players").LocalPlayer.leaderstats and game:GetService("Players").LocalPlayer.leaderstats:FindFirstChild("Sheckles") and game:GetService("Players").LocalPlayer.leaderstats.Sheckles.Value or 0

            if (sheckles < price) then
                return false
            else
                return true
            end
        end
    end,

    GetGearPrice = function(self, gearName)
        for gearName, gearInfo in pairs(Modules.GearData) do
            local price = gearInfo.Price or gearInfo.FallbackPrice or 0
            local sheckles = game:GetService("Players").LocalPlayer.leaderstats and game:GetService("Players").LocalPlayer.leaderstats:FindFirstChild("Sheckles") and game:GetService("Players").LocalPlayer.leaderstats.Sheckles.Value or 0

            if (sheckles < price) then
                return false
            else
                return true
            end
        end
    end,

    GetPetResult = LPH_NO_VIRTUALIZE(function(self, instance, search)
        if (not instance or not search) then return nil end

        local uuid
        if (instance:IsA("Tool")) then
            uuid = instance:GetAttribute("PET_UUID")
        else
            uuid = instance.Name
        end
        if (not uuid) then return nil end

        local pet = Modules.DataService:GetData().PetsData.PetInventory.Data[tostring(uuid)]
        if (not pet) then return nil end

        local current = pet
        for key in string.gmatch(search, "[^%.]+") do
            if (type(current) ~= "table") then return nil end
            current = current[key]
            if (current == nil) then return nil end
        end

        return current
    end),

    ReturnAsterisk = (function(self)
        return [[<font color="rgb(255,0,0)">*</font>]]
    end),

    AbbreviateNumber = (function(self, num)
        local suffixes = {"", "k", "M", "B", "T", "Q", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}
        local i = 1
        
        while (num >= 1000 and i < #suffixes) do
            num = num / 1000
            i += 1
        end
    
        return string.format("%.2f%s", num, suffixes[i])
    end),

    ReturnHoneyEvent = (function(self)
        return workspace:FindFirstChild("HoneyEvent") or workspace.Interaction.UpdateItems.NewCrafting
    end),

    FormatNumber = (function(self, num)
        return tostring(num):reverse():gsub("(%d%d%d)", "%1,"):gsub(",$", ""):reverse()
    end),

    Contains = LPH_NO_VIRTUALIZE(function(self, tbl, item)
        return table.find(tbl, item) ~= nil
    end),

    Deduplicate = LPH_NO_VIRTUALIZE(function(self, list)
        local seen = {}
        local result = {}
        
        for _, v in ipairs(list) do
            if (not seen[v]) then
                seen[v] = true
                table.insert(result, v)
            end
        end
    
        return result
    end),

    TblMatch = LPH_NO_VIRTUALIZE(function(self, tbl1, tbl2)
        if (#tbl1 ~= #tbl2) then
            return false
        end

        for i = 1, #tbl1 do
            if (tbl1[i] ~= tbl2[i]) then
                return false
            end
        end

        return true
    end),

    GetMutation = LPH_NO_VIRTUALIZE(function(self, instance)
        if (not instance) then return end
        local foundmutations = {}
        local mutations = Configs.General.AllMutations
        for i,v in ipairs(mutations) do
            if (instance:GetAttribute(v) == true) then
                table.insert(foundmutations, v)
            end
            
            if (instance.Variant) then
                if (instance.Variant.Value == v) then
                    table.insert(foundmutations, v)
                end
            end
        end
        return foundmutations
    end),

    FavoriteItem = LPH_NO_VIRTUALIZE(function(self, instance)
        if (not instance) then return end
        if (self:GetResult(instance, "ItemData.IsFavorite") == true) then return end
        GameEvents:WaitForChild("Favorite_Item"):FireServer(instance)
    end),

    GetSeedStock = LPH_NO_VIRTUALIZE(function(self, output)
        local DataService = Modules.DataService
        local data = DataService:GetData()
        if (not data or not data.SeedStock or not data.SeedStock.Stocks) then return {} end
        local stockInfo = {}
        local seedCount = 0
        for seedName, stockData in pairs(data.SeedStock.Stocks) do
            if (output == true) then
                warn("[.GG/LNR] Seed Name: " .. seedName .. " | Stock: " .. stockData.Stock)
            end
            if (stockData and stockData.Stock) then
                stockInfo[seedName] = stockData.Stock
                if (stockData.Stock > 0) then
                    seedCount = seedCount + 1
                end
            end
        end

        return stockInfo
    end),

    GetCosmeticStock = LPH_NO_VIRTUALIZE(function(self, output)
        local DataService = Modules.DataService
        local data = DataService:GetData()
        if (not data or not data.CosmeticStock or not data.CosmeticStock.ItemStocks) then return {} end
        local stockInfo = {}
        local cosmeticCount = 0
        for itemName, stockData in pairs(data.CosmeticStock.ItemStocks) do
            if (output == true) then
                warn("[Lunor] Cosmetic Name: " .. itemName .. " | Stock: " .. stockData.Stock)
            end
            if (stockData and stockData.Stock) then
                stockInfo[itemName] = stockData.Stock
                if (stockData.Stock > 0) then
                    cosmeticCount = cosmeticCount + 1
                end
            end
        end
        if (data.CosmeticStock.CrateStocks) then
            for crateName, stockData in pairs(data.CosmeticStock.CrateStocks) do
                if (output == true) then
                    warn("[Lunor] Crate Name: " .. crateName .. " | Stock: " .. stockData.Stock)
                end
                if (stockData and stockData.Stock) then
                    stockInfo[crateName] = stockData.Stock
                    if (stockData.Stock > 0) then
                        cosmeticCount = cosmeticCount + 1
                    end
                end
            end
        end
        return stockInfo
    end),

    GetGearStock = LPH_NO_VIRTUALIZE(function(self)
        local DataService = Modules.DataService
        local data = DataService:GetData()
        if (not data or not data.GearStock or not data.GearStock.Stocks) then return {} end
        local stockInfo = {}
        local gearCount = 0
        for gearName, stockData in pairs(data.GearStock.Stocks) do
            if (stockData and stockData.Stock) then
                stockInfo[gearName] = stockData.Stock
                if (stockData.Stock > 0) then
                    gearCount = gearCount + 1
                end
            end
        end

        return stockInfo
    end),

    GetEggStock = LPH_NO_VIRTUALIZE(function(self)
        local data = Modules.DataService:GetData()
        if (not data or not data.PetEggStock or not data.PetEggStock.Stocks) then
            return false
        end

        local stock = {}
        local validIndex = 0

        for index, egg in pairs(data.PetEggStock.Stocks) do
            validIndex += 1
            table.insert(stock, {
                Name = egg.EggName,
                Index = validIndex,
                IsPurchased = (egg.Stock == 0)
            })
        end

        local tempcache = {
            AllPurchased = false,
            PurchasedAmount = 0,
        }

        for _, v in ipairs(stock) do
            if (v.IsPurchased) then
                tempcache.PurchasedAmount += 1
            end
        end

        if (tempcache.PurchasedAmount == #stock) then
            tempcache.AllPurchased = true
        end

        return tempcache.AllPurchased and false or stock
    end),
    
    ReturnCurrentEvent = LPH_NO_VIRTUALIZE(function(self)
        local activeweathers = {}
        local weathers = Configs.General.AllWeathers

        for i, v in ipairs(weathers) do
            local str = v .. "Event"
            if (game.workspace:GetAttribute(str) == true) then
                table.insert(activeweathers, v)
            end
        end
        
        if (#activeweathers > 0) then
            return activeweathers
        else
            return {}
        end
    end),

    ReturnInventorySpace = LPH_NO_VIRTUALIZE(function(self)
        local IsMaxInventory = Modules.InventoryService:IsMaxInventory()
        return IsMaxInventory
    end),

    ReturnMaxPets = LPH_NO_VIRTUALIZE(function(self)
    	local data = Modules.DataService:GetData()
    	if (not (data)) then return end
    	local petsdata = data.PetsData
    	if (not (petsdata)) then return end
    	local maxpets = petsdata.MutableStats.MaxEquippedPets
    	return maxpets
    end),

	ReturnMaxEggs = LPH_NO_VIRTUALIZE(function(self)
		local data = Modules.DataService:GetData() 
		if (not (data)) then return end
		local petsdata = data.PetsData
		if (not (petsdata)) then return end 
		local maxeggs = petsdata.MutableStats.MaxEggsInFarm      
		return maxeggs
	end),

    tbl_upvr_3 = Modules.Item_Module.Return_All_Data(),
    
    tbl_upvr_2 = {{"Normal", 1000, 1}, {"Gold", 10, 20}, {"Rainbow", 1, 50}},
    
    MutationsList = (function()
        local list = {}
        for key, data in pairs(Modules.Mutations.GetMutations()) do
            if (data.Name and data.ValueMulti) then
                table.insert(list, {
                    Name = data.Name,
                    ValueMulti = data.ValueMulti
                })
            end
        end
        return list
    end)(),
    
    StripFlavourText = LPH_NO_VIRTUALIZE(function(self, arg2)
        if (not arg2 or arg2 == "") then
            warn("StringUtils:StipFlavourText | No item name passed!")
            return ""
        end
        return arg2:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
    end),
    
    GetMutations = LPH_NO_VIRTUALIZE(function(self)
        return self.MutationsList
    end),    
    
    CalculateMultiplierValue = LPH_NO_VIRTUALIZE(function(self, arg2)
        local multi = 1

        for _, mutation in ipairs(self:GetMutations()) do
            if (arg2:GetAttribute(mutation.Name)) then
                multi = multi + (mutation.ValueMulti - 1)
            end
        end
        
        return multi
    end),
    
    ReturnMultiplier = LPH_NO_VIRTUALIZE(function(self, arg1)
        if (not arg1) then
            return 1
        end
        
        for _, v_3 in pairs(self.tbl_upvr_2) do
            if (v_3[1] == arg1) then
                return v_3[3]
            end
        end
        return 1
    end),
    
    ReturnData = LPH_NO_VIRTUALIZE(function(self, arg1)
        if (not arg1) then
            return nil
        end
        
        local itemName = self:StripFlavourText(arg1)
        
        for _, v_8 in pairs(self.tbl_upvr_3) do
            if (v_8[1] == itemName) then
                return v_8
            end
        end
        return nil
    end),

    CalculatePlantValue = LPH_NO_VIRTUALIZE(function(self, arg1, backpack)
        if (backpack) then
            if (not arg1.Item_String or not arg1.Variant or not arg1.Weight) then
                return 0
            end
        end

        if (not arg1.Variant or not arg1.Weight) then
            return 0
        end

        local itemData
        if (backpack) then
            itemData = self:ReturnData(arg1.Item_String.Value)
            if (not itemData) then
                return 0
            end
        else
            itemData = self:ReturnData(arg1.Name)
            if (not itemData) then
                return 0
            end
        end

        local clamped = math.clamp(arg1.Weight.Value / itemData[2], 0.95, 100000000)
        local mutationMulti = self:CalculateMultiplierValue(arg1)
        local variantMulti = self:ReturnMultiplier(arg1.Variant.Value)
        local weightFactor = clamped * clamped
        return math.round((itemData[3] * mutationMulti * variantMulti) * weightFactor) or 0
    end),

    GetPetValue = LPH_NO_VIRTUALIZE(function(self, tool)
        local petUUID = tool:GetAttribute("PET_UUID")
        if (not petUUID) then return 0 end

        local petData = Modules.DataService:GetData().PetsData.PetInventory.Data[petUUID]
        if (not petData or not petData.PetData) then return 0 end

        local petEgg = petData.PetData.HatchedFrom
        local handle = tool:FindFirstChild("Handle")
        if (not handle) then return 0 end

        local children = handle:GetChildren()
        if (#children == 0) then return 0 end
        local petName = children[1].Name

        local rarityData = Modules.PetEggs[petEgg] and Modules.PetEggs[petEgg].RarityData
        if (not rarityData or not rarityData.Items[petName]) then return 0 end

        local petWeightRange = rarityData.Items[petName].GeneratedPetData.WeightRange

        local v19 = (petData.PetData.BaseWeight - petWeightRange[1]) / (petWeightRange[2] - petWeightRange[1])
        local v20 = math.lerp(0.8, 1.2, v19)
        local v21 = Modules.PetUtilities.GetLevelProgress(petData.PetData.Levelevel)
        local v22 = v20 * math.lerp(0.15, 6, v21)

        local v23 = Modules.PetList[petData.PetType].SellPrice * v22
        return math.floor(v23)
    end),

    ActiveUUIDs = {},
    GetActivePets = function(self)
        local petList = {}

        for _, petMover in ipairs(workspace.PetsPhysical:GetChildren()) do
            if (petMover:GetAttribute("OWNER") == LocalPlayer.Name) then
                for _, child in ipairs(petMover:GetChildren()) do
                    if (child:IsA("Model")) then
                        local petType = self:GetPetResult(child, "PetType")
                        local petName = self:GetPetResult(child, "PetData.Name")
                        local petLevel = self:GetPetResult(child, "PetData.Level")

                        local rawId = child.Name
                        local cleanedId = rawId:sub(2, -2)

                        local label = string.format("%s - %s - %s (%s)", petType or "?", petName or "?", tostring(petLevel or "?"), cleanedId)
                        table.insert(petList, label)
                        self.ActiveUUIDs[label] = child:GetAttribute("PET_UUID")
                        break
                    end
                end
            end
        end
        
        if (#petList == 0) then
            return {"No active pets found"}
        end

        return petList
    end,

    GetFruitStats = function(self)
        local totalvalue = 0
        local totalweight = 0
        local heighestvalue = 0
        local heighestweight = 0
        local fruitCount = 0
        local garden = self:ReturnGarden()
        if (not garden) then return end

        for i,v in ipairs(garden.Important.Plants_Physical:GetChildren()) do
            if (v:IsA("Model")) then 
                local value = self:CalculatePlantValue(v, false)
                local weight = v:FindFirstChild("Weight") and v:FindFirstChild("Weight").Value or 0

                totalvalue += value
                totalweight += weight
                fruitCount += 1

                if (value > heighestvalue) then
                    heighestvalue = value
                end

                if (weight > heighestweight) then
                    heighestweight = weight
                end
            end
        end

        return {
            {
                Icon = Dependencies:CustomAsset("Money"),
                Text = "Total Value\n » " .. self:FormatNumber(totalvalue) .. "¢",
            },
            {
                Icon = Dependencies:CustomAsset("Tree"),
                Text = "Total Fruits\n » " .. self:FormatNumber(fruitCount),
            },
            {
                Icon = Dependencies:CustomAsset("crown"),
                Text = "Highest Value\n » " .. self:FormatNumber(heighestvalue) .. "¢",
            },
            {
                Icon = Dependencies:CustomAsset("coin"),
                Text = "Total Weight\n » " .. string.format("%.2f", totalweight) .. "kg",
            },
            {
                Icon = Dependencies:CustomAsset("weight"),
                Text = "Highest Weight\n » " .. string.format("%.2f", heighestweight) .. "kg",
            },
        }
    end,

    GetPetStats = function(self)
        local pets = self:GetActivePets()
        local totalvalue = 0
        local petCount = #pets
        local highestValue = 0
        local totalLevels = 0

        for i,v in ipairs(pets) do
            local pet = Modules.PetList[v]
            if (pet) then
                local value = Utils:GetPetValue(pet)
                totalvalue += value
                
                if (value > highestValue) then
                    highestValue = value
                end
                
                -- Try to get pet level if available
                local level = pet.Level or 1
                totalLevels += level
            end
        end

        local averageLevel = petCount > 0 and (totalLevels / petCount) or 0

        return {
            {
                Icon = Dependencies:CustomAsset("Dog"),
                Text = "Active Pets\n » " .. self:FormatNumber(petCount),
            },
        }
    end,

    UpdateStatsDisplay = function(self)
        if (FruitStatsDisplay and FruitStatsDisplay.SetDescription) then
            FruitStatsDisplay:SetDescription(self:GetFruitStats())
        end
        
        if (PetStatsDisplay and PetStatsDisplay.SetDescription) then
            PetStatsDisplay:SetDescription(self:GetPetStats())
        end
    end
}


local FruitStatsDisplay = Subsections.FruitStats:Paragraph({
    Title = "    Fruit Statistics",
    Description = Utils:GetFruitStats(),
    Position = "Center",
})

local PetStatsDisplay = Subsections.PetStats:Paragraph({
    Title = "     Pet Statistics", 
    Description = Utils:GetPetStats(),
    Position = "Center",
})



local Exploits =
{
    AntiAim = 
    {
        Settings =
        {
            Desync = false,
            CFrame = CFrame.new(0, 0, 0),
            Fake = CFrame.new(0, 0, 0),
        },

        getHRP = function(self)
            return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end,

        updateCharacter = function(self)
            local hrp = self:getHRP()
            if (hrp) then
                if (self.Settings.Desync) then
                    hrp.CFrame = self.Settings.CFrame
                else
                    hrp.CFrame = CFrame.new(hrp.Position)
                end
            end
        end,

        desyncLoop = function(self)
            local hrp = self:getHRP()
            if (self.Settings.Desync and hrp and hrp.Parent) then
                self.Settings.CFrame = hrp.CFrame
                local fake = self.Settings.Fake
                hrp.CFrame = fake
                RunService.RenderStepped:Wait()
                hrp.CFrame = self.Settings.CFrame
            end
        end
    },
}

local Features =
{
    Connections =
    {
        AutoCollectConnection = nil,
        AutoSellConnection = nil,
        AutoFavoriteConnection = nil,
        AutoPlantConnection = nil,
        AutoGiveTranquilConnection = nil,
        AutoPurchaseSeedsConnection = nil,
        AutoPurchaseEggsConnection = nil,
        AutoPurchaseGearsConnection = nil,
        AutoPurchaseCosmeticsConnection = nil,
        FreezePetsConnection = nil,
        AutoFeedConnection = nil,
        AutoHatchEggsConnection = nil,
        AutoPlaceEggsConnection = nil,
        AutoSellPetsConnection = nil,
        AutoDestroyConnection = nil,
        MoveFruitsConnection = nil,
    },

    Farm = 
    {
        Cache =
        {
            LastSoldTimestamp = nil,
            RunningAutoSell = false,
            RunningAutoSellTimestamp = nil,
            RunningAutoCollect = false,
            BackpackAmountPostSell = 0,
            SellCFrame = CFrame.new(86.5887604, 2.99999976, 0.426791877, -0.0019882957, -1.06926372e-07, -0.999998033, 6.20058909e-12, 1, -1.06926599e-07, 0.999998033, -2.18802268e-10, -0.0019882957),
            itemsToCollect = {},     
            AutoGiveTranquilTimestamp = nil,
            collectPromptsConnection = nil,
            needsFullScan = true,
        },

        SetupCollectConnections = function(self)
            if (self.Cache.collectPromptsConnection) then
                self.Cache.collectPromptsConnection:Disconnect()
                self.Cache.collectPromptsConnection = nil
            end

            local garden = Utils:ReturnGarden()
            if (not garden) then return end

            self.Cache.collectPromptsConnection = Modules.CollectionService:GetInstanceAddedSignal("CollectPrompt"):Connect(function(prompt)
                if (prompt:IsA("ProximityPrompt") and prompt:IsDescendantOf(garden)) then
                    self.Cache.needsFullScan = true
                end
            end)
        end,

        ScanCollectibleItems = function(self)
            local garden = Utils:ReturnGarden()
            if (not garden) then return end

            self.Cache.itemsToCollect = {}
            
            local skipMutations = Configs.Farm.SelectedCollectMutationsMode == "Ignore" and #Configs.Farm.SelectedMutations > 0
            local onlyCollectMutations = Configs.Farm.SelectedCollectMutationsMode == "Only" and #Configs.Farm.SelectedMutations > 0
            local skipFruits = Configs.Farm.SelectedCollectFruitsMode == "Ignore" and #Configs.Farm.SelectedFruits > 0
            local onlyFruits = Configs.Farm.SelectedCollectFruitsMode == "Only" and #Configs.Farm.SelectedFruits > 0
            local checkWeight = Utils:Contains(Configs.Farm.SelectedCollectAdditionalFilters, "Weight") and Configs.Farm.CollectWeight > 0
            local checkPrice = Utils:Contains(Configs.Farm.SelectedCollectAdditionalFilters, "Price") and Configs.Farm.CollectPrice > 0

            local allPrompts = Modules.CollectionService:GetTagged("CollectPrompt")
            for _, prompt in ipairs(allPrompts) do
                if (prompt:IsA("ProximityPrompt") and prompt:IsDescendantOf(garden) and
                    (prompt.Parent:IsA("BasePart") or prompt.Parent:IsA("Model"))) then
                    
                    local fruitObject = prompt.Parent.Parent
                    if (not fruitObject) then continue end
                    
                    local shouldSkip = false
                    
                    if (fruitObject:GetAttribute("Favorited") == true) then
                        shouldSkip = true
                    end
                
                    local fruitAttributes = fruitObject:GetAttributes()
                
                    if (not shouldSkip and skipMutations) then
                        for attrName, attrValue in pairs(fruitAttributes) do
                            if (attrValue == true and Utils:Contains(Configs.Farm.SelectedMutations, attrName)) then
                                shouldSkip = true
                                break
                            end
                        end
                        if (not shouldSkip) then
                            local variant = fruitObject:WaitForChild("Variant", 1)
                            if (variant and Utils:Contains(Configs.Farm.SelectedMutations, variant.Value)) then
                                shouldSkip = true
                            end
                        end
                    end
                
                    if (not shouldSkip and checkWeight) then
                        local weightObj = fruitObject:WaitForChild("Weight", 1)
                        local fruitWeight = weightObj and weightObj.Value or 0
                        if (fruitWeight < Configs.Farm.CollectWeight) then
                            shouldSkip = true
                        end
                    end
                
                    if (not shouldSkip and checkPrice) then
                        local fruitValue = Utils:CalculatePlantValue(fruitObject, false)
                        if (fruitValue < Configs.Farm.CollectPrice) then
                            shouldSkip = true
                        end
                    end
                
                    if (not shouldSkip and onlyCollectMutations) then
                        local hasMutation = false
                        for attrName, attrValue in pairs(fruitAttributes) do
                            if (attrValue == true and Utils:Contains(Configs.Farm.SelectedMutations, attrName)) then
                                hasMutation = true
                                break
                            end
                        end
                        if (not hasMutation) then
                            local variant = fruitObject:WaitForChild("Variant", 1)
                            if (variant and Utils:Contains(Configs.Farm.SelectedMutations, variant.Value)) then
                                hasMutation = true
                            end
                        end
                        if (not hasMutation) then
                            shouldSkip = true
                        end
                    end
                
                    if (not shouldSkip and skipFruits) then
                        if (Utils:Contains(Configs.Farm.SelectedFruits, fruitObject.Name)) then
                            shouldSkip = true
                        end
                    end
                
                    if (not shouldSkip and onlyFruits) then
                        if (not Utils:Contains(Configs.Farm.SelectedFruits, fruitObject.Name)) then
                            shouldSkip = true
                        end
                    end
                
                    if (not shouldSkip) then
                        table.insert(self.Cache.itemsToCollect, fruitObject)
                    end
                end
            end
            
            self.Cache.needsFullScan = false
        end,

        AutoCollect = LPH_NO_VIRTUALIZE(function(self)
            if (not Configs.Farm.AutoCollect) then return end
        
            local garden = Utils:ReturnGarden()
            if (not garden) then return end
        
            local currentevent = Utils:ReturnCurrentEvent()
            if (Configs.Farm.SelectedCollectWeathersMode == "Ignore" and #Configs.Farm.SelectedWeathers > 0) then
                for _, weather in ipairs(Configs.Farm.SelectedWeathers) do
                    if (Utils:Contains(currentevent, weather)) then return end
                end
            end
        
            if (self.Cache.RunningAutoCollect) then return end
            self.Cache.RunningAutoCollect = true
        
            if (not self.Cache.itemsToCollect) then
                self.Cache.itemsToCollect = {}
            end
        
            if (Utils:ReturnInventorySpace()) then
                self.Cache.RunningAutoCollect = false
                return
            end

            -- Setup connections if not already done
            if (not self.Cache.collectPromptsConnection) then
                self:SetupCollectConnections()
                self.Cache.needsFullScan = true
            end

            -- Do full scan if needed or if we're out of items
            if (self.Cache.needsFullScan or #self.Cache.itemsToCollect == 0) then
                self:ScanCollectibleItems()
            end
        
            local batchSize = 5
        
            if (#self.Cache.itemsToCollect > 0) then
                if (Configs.Farm.SelectedCollectMode == "Limited") then
                    local batch = {}
                    for i = 1, math.min(batchSize, #self.Cache.itemsToCollect) do
                        table.insert(batch, self.Cache.itemsToCollect[i])
                    end
                    Modules.Remotes.Crops.Collect.send(batch)
                    task.wait()
                    for i = math.min(batchSize, #self.Cache.itemsToCollect), 1, -1 do
                        table.remove(self.Cache.itemsToCollect, i)
                    end
                else
                    while (#self.Cache.itemsToCollect > 0) do
                        local batch = {}
                        for i = 1, math.min(batchSize, #self.Cache.itemsToCollect) do
                            table.insert(batch, self.Cache.itemsToCollect[i])
                        end
                        Modules.Remotes.Crops.Collect.send(batch)
                        task.wait()
                        for i = math.min(batchSize, #self.Cache.itemsToCollect), 1, -1 do
                            table.remove(self.Cache.itemsToCollect, i)
                        end
                        if (Utils:ReturnInventorySpace()) then break end
                    end
                end
            end
        
            self.Cache.RunningAutoCollect = false
        end),

        AutoSell = LPH_NO_VIRTUALIZE(function(self, force)
            if (not (Configs.Sell.AutoSell or force)) then return end
        
            local garden = Utils:ReturnGarden()
            if (not garden) then return end
            if (self.Cache.RunningAutoSell) then return end

            self.Cache.RunningAutoSellTimestamp = os.time()

            if (not Utils:ReturnInventorySpace() and not force and not Utils:Contains(Configs.Sell.SelectedSellMode, "Timer")) then return end

            local backpack = LocalPlayer.Backpack
            for i,v in ipairs(backpack:GetChildren()) do
                if (v:IsA("Tool")) then
                    local weightInstance = v:FindFirstChild("Weight")
                    local rawWeight = weightInstance and weightInstance.Value or 0
                    local weightInKg = rawWeight / 1000
                    local roundedWeight = math.floor(weightInKg * 100 + 0.5) / 100
                    local formattedWeight = string.format("%.2fkg", roundedWeight)
                    if (Utils:Contains(Configs.Favourite.SelectedFavouriteOptions, "Weight") and tonumber(weightInKg) >= Configs.Favourite.SelectedWeight and Configs.Favourite.SelectedWeight ~= 0) then
                        Utils:FavoriteItem(v)
                    end
                end
            end

            if (force) then
                local hassellable = false
                for i,v in ipairs(backpack:GetChildren()) do
                    if (Utils:GetResult(v, "ItemType") == "Holdable" and Utils:GetResult(v, "ItemData.IsFavorite") ~= true) then
                        hassellable = true
                        break
                    end
                end
                if (not (hassellable)) then
                    return
                end
            end

            if (Utils:Contains(Configs.Sell.SelectedSellMode, "Inventory") and Utils:ReturnInventorySpace() or force) then
                self.Cache.RunningAutoSell = true
                local lastcframe = LocalPlayer.Character.HumanoidRootPart.CFrame
                self.Cache.BackpackAmountPostSell = #LocalPlayer.Backpack:GetChildren()
                Exploits.AntiAim.Settings.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                Exploits.AntiAim.Settings.Fake = self.Cache.SellCFrame
                Exploits.AntiAim.Settings.Desync = true
                repeat task.wait(0.65) GameEvents:WaitForChild("Sell_Inventory"):FireServer() until (#backpack:GetChildren() ~= self.Cache.BackpackAmountPostSell)
                Exploits.AntiAim.Settings.Desync = false
                task.wait(0.25)
                self.Cache.RunningAutoSell = false
            end

            if (Utils:Contains(Configs.Sell.SelectedSellMode, "Timer") and self.Cache.LastSoldTimestamp == nil or Utils:Contains(Configs.Sell.SelectedSellMode, "Timer") and os.time() - self.Cache.LastSoldTimestamp >= Configs.Sell.AutoSellTimer) then
                self.Cache.RunningAutoSell = true
                self.Cache.LastSoldTimestamp = os.time()
                local lastcframe = LocalPlayer.Character.HumanoidRootPart.CFrame
                self.Cache.BackpackAmountPostSell = #LocalPlayer.Backpack:GetChildren()
                Exploits.AntiAim.Settings.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                Exploits.AntiAim.Settings.Fake = self.Cache.SellCFrame
                Exploits.AntiAim.Settings.Desync = true
                repeat task.wait(0.25) GameEvents:WaitForChild("Sell_Inventory"):FireServer() until (#backpack:GetChildren() ~= self.Cache.BackpackAmountPostSell)
                Exploits.AntiAim.Settings.Desync = false
                task.wait(0.65)
                self.Cache.RunningAutoSell = false
            end
        end),

        AutoFavorite = LPH_NO_VIRTUALIZE(function(self)
            if (not Configs.Favourite.AutoFavourite) then
                return
            end
            
            local backpack = LocalPlayer and LocalPlayer.Backpack
            if (not backpack) then
                return
            end
            
            for i, v in ipairs(backpack:GetChildren()) do
                if (not (v:IsA("Tool"))) then continue end
                if (Utils:GetResult(v, "ItemType") ~= "Holdable") then continue end
                if (Utils:GetResult(v, "ItemData.IsFavorite") == true) then continue end
                
                if (Utils:Contains(Configs.Favourite.SelectedFavouriteOptions, "Mutations")) then
                    local mutations = Utils:GetMutation(v)
                    if (mutations and #mutations > 0) then
                        for _, mutation in ipairs(mutations) do
                            if (Utils:Contains(Configs.Favourite.SelectedMutations, mutation)) then
                                Utils:FavoriteItem(v)
                                break
                            end
                        end
                    end
                end
                
                task.wait()

                if (Utils:Contains(Configs.Favourite.SelectedFavouriteOptions, "Price") and Configs.Favourite.SelectedPrice ~= nil and Configs.Favourite.SelectedPrice ~= 0) then
                    local value = Utils:CalculatePlantValue(v, true)
                    if (value and value >= tonumber(Configs.Favourite.SelectedPrice)) then
                        Utils:FavoriteItem(v)
                    end
                end

                task.wait()

                if (Utils:Contains(Configs.Favourite.SelectedFavouriteOptions, "Weight") and Configs.Favourite.SelectedWeight ~= nil and Configs.Favourite.SelectedWeight ~= 0) then
                    local weight = v.Weight
                    if (weight and weight.Value >= tonumber(Configs.Favourite.SelectedWeight)) then
                        Utils:FavoriteItem(v)
                    end
                end
            end
        end),

        AutoPlant = LPH_NO_VIRTUALIZE(function(self)
            if (not Configs.Farm.AutoPlant) then
                return
            end

            local garden = Utils:ReturnGarden()
            if (not garden) then
                return
            end
        
            local plantposition = garden.Important.Plant_Locations:FindFirstChild("Can_Plant")
            if (not plantposition) then
                return
            end

            local backpack = LocalPlayer.Backpack
            local character = LocalPlayer.Character
            local currentSeed = character:FindFirstChildOfClass("Tool")
            
            local function shouldPlantSeed(seedName)
                if (not Configs.Farm.AutoPlantSeeds or type(Configs.Farm.AutoPlantSeeds) ~= "table") then
                    return true
                end
            
                if (table.find(Configs.Farm.AutoPlantSeeds, "All")) then
                    return true
                end
            
                local cleanSeedName = seedName:gsub("%s*%[X?%d+%]%s*", ""):gsub("%s+$", "")
                return Utils:Contains(Configs.Farm.AutoPlantSeeds, cleanSeedName)
            end

            local function getBaseSeedName(seedName)
                local baseName = seedName:gsub("%s*%[X?%d+%]%s*", ""):gsub("%s+Seed$", ""):gsub("%s+$", "")
                return baseName
            end

            if (currentSeed and Utils:GetResult(currentSeed, "ItemType") == "Seed") then
                if (shouldPlantSeed(currentSeed.Name)) then
                    local baseSeedName = getBaseSeedName(currentSeed.Name)
                    
                    if (Configs.Farm.SelectedPlantMode == "Placeable Spot") then
                        GameEvents:WaitForChild("Plant_RE"):FireServer(plantposition.Position, baseSeedName)
                    elseif (Configs.Farm.SelectedPlantMode == "Character") then
                        GameEvents:WaitForChild("Plant_RE"):FireServer(
                            (function()
                                local lowestPart = nil
                                local lowestY = math.huge
                            
                                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                                    if (part:IsA("BasePart")) then
                                        local bottomY = part.Position.Y - (part.Size.Y / 2)
                                        if (bottomY < lowestY) then
                                            lowestY = bottomY
                                            lowestPart = part
                                        end
                                    end
                                end
                            
                                if (lowestPart) then
                                    return Vector3.new(lowestPart.Position.X, lowestY, lowestPart.Position.Z)
                                end
                            end)(),
                            baseSeedName
                        )
                    end
                    task.wait()
                else
                    currentSeed.Parent = backpack
                    task.wait()
                end
                return
            end
            
            for _, item in pairs(backpack:GetChildren()) do
                if (item:IsA("Tool") and Utils:GetResult(item, "ItemType") == "Seed") then
                    if (shouldPlantSeed(item.Name)) then
                        item.Parent = character
                        task.wait()
                        break
                    end
                end
            end
        end),

        AutoGiveTranquil = function(self)
            if (not Configs.Farm.AutoGiveTranquil) then
                return
            end

            if (self.Cache.AutoGiveTranquilTimestamp and os.time() - self.Cache.AutoGiveTranquilTimestamp < 3) then
                return
            end

            self.Cache.AutoGiveTranquilTimestamp = os.time()

            local backpack = LocalPlayer.Backpack
            if (not backpack) then
                return
            end

            -- Find tranquil items in backpack
            local tranquilItems = {}
            local hasfound = false
            for _, item in ipairs(backpack:GetChildren()) do
                if (item:IsA("Tool") and Utils:GetResult(item, "ItemType") == "Holdable") then
                    local mutations = Utils:GetMutation(item)
                    for _, mutationName in ipairs(mutations) do
                        if (mutationName == "Tranquil") then
                            table.insert(tranquilItems, item)
                            hasfound = true
                            break
                        end
                    end
                end
            end

            if (#tranquilItems == 0) then
                return
            end

            local submitted = false

            if (Utils:Contains(Configs.Farm.SelectedTranquilMode, "Zen Racoon")) then
                local Event = ReplicatedStorage.GameEvents.ZenAuraRemoteEvent
                Event:FireServer("SubmitAllPlants")
                submitted = true
            end

            -- Channeler mode - submits held plant (need to equip first)
            if (Utils:Contains(Configs.Farm.SelectedTranquilMode, "Channeler")) then
                local Event = ReplicatedStorage.GameEvents.ZenQuestRemoteEvent
                Event:FireServer("SubmitAllPlants")
                submitted = true
            end
        end,
    },
    
    Shop =
    {
        Cache =
        {
            LastCheckedCosmeticStock = nil,
            LastCheckedGearStock = nil,
            LastCheckedSeedStock = nil,
            LastCheckedEggStock = nil,
        },

        AutoPurchaseCosmetics = LPH_NO_VIRTUALIZE(function(self)
            if (self.Cache.LastCheckedCosmeticStock == nil or os.time() - self.Cache.LastCheckedCosmeticStock >= 15) then
                local InStock = Utils:GetCosmeticStock()
            
                for _, rawCosmeticName in ipairs(Configs.Shop.SelectedPurchaseCosmetics) do
                    local cosmeticName = rawCosmeticName:gsub("%s*%[X%d+%]", "")
                    local stockAmount = InStock[cosmeticName]
                
                    if (stockAmount and stockAmount > 0) then
                        local purchaseAmount = Configs.Shop.CosmeticPurchaseAmount == 0 and stockAmount or math.min(Configs.Shop.CosmeticPurchaseAmount, stockAmount)
                    
                        if (purchaseAmount > 0) then
                            for i = 1, purchaseAmount do
                                GameEvents:WaitForChild("BuyCosmeticItem"):FireServer(cosmeticName)
                            end
                        end
                    end
                end
            
                self.Cache.LastCheckedCosmeticStock = os.time()
            end
        end),

        AutoPurchaseSeeds = LPH_NO_VIRTUALIZE(function(self)
            if (self.Cache.LastCheckedSeedStock == nil or os.time() - self.Cache.LastCheckedSeedStock >= 15) then
                local InStock = Utils:GetSeedStock()
            
                for _, rawSeedName in ipairs(Configs.Shop.SelectedPurchaseSeeds) do
                    local seedName = rawSeedName:gsub("%s*Seed", ""):gsub("%s*%[X%d+%]", "")
                    local stockAmount = InStock[seedName]
                
                    if (stockAmount and stockAmount > 0) then
                        local purchaseAmount = Configs.Shop.SeedPurchaseAmount == 0 and stockAmount or math.min(Configs.Shop.SeedPurchaseAmount, stockAmount)
                    
                        if (purchaseAmount > 0) then
                            for i = 1, purchaseAmount do
                                GameEvents:WaitForChild("BuySeedStock"):FireServer(seedName)
                            end
                        end
                    end
                end
            
                self.Cache.LastCheckedSeedStock = os.time()
            end
        end),

        AutoPurchaseGears = LPH_NO_VIRTUALIZE(function(self)
            if (self.Cache.LastCheckedGearStock == nil or os.time() - self.Cache.LastCheckedGearStock >= 15) then
                local InStock = Utils:GetGearStock()
            
                for _, gearName in ipairs(Configs.Shop.SelectedPurchaseGears) do
                    local stockAmount = InStock[gearName]
                
                    if (stockAmount and stockAmount > 0) then
                        local purchaseAmount = Configs.Shop.GearPurchaseAmount == 0 and stockAmount or math.min(Configs.Shop.GearPurchaseAmount, stockAmount)
                    
                        if (purchaseAmount > 0) then
                            for i = 1, purchaseAmount do
                                GameEvents:WaitForChild("BuyGearStock"):FireServer(gearName)
                            end
                        end
                    end
                end
            
                self.Cache.LastCheckedGearStock = os.time()
            end
        end),

        AutoPurchaseEggs = LPH_NO_VIRTUALIZE(function(self)
            if (self.Cache.LastCheckedEggStock == nil or os.time() - self.Cache.LastCheckedEggStock >= 15) then
                local stock = Utils:GetEggStock()
                if (not stock) then return end

                self.Cache.LastCheckedEggStock = os.time()

                if (#Configs.Shop.SelectedPurchaseEggs <= 0) then
                    return
                end

                for i,v in ipairs(stock) do
                    if (Utils:Contains(Configs.Shop.SelectedPurchaseEggs, v.Name) and not v.IsPurchased) then
                        local args = { i }
                        GameEvents:WaitForChild("BuyPetEgg"):FireServer(unpack(args))
                    end
                end

                self.Cache.LastCheckedEggStock = os.time()
            end
        end),
    },

    Main =
    {
        Cache =
        {
            LastRanFreezePets = 0,
            FreezePetsCooldown = 6,
            FeedPetsCurrentlyRunning = false,
            FeedPetsTimestamp = 0,
            FeedPetsDelay = 0.5,
            FedItems = {},
            LastClearedCache = 0,
        },

        FeedPets = function(self)
            if (self.Cache.FeedPetsCurrentlyRunning) then
                return
            end
        
            local currentTime = os.time()
            self.Cache.FeedPetsCurrentlyRunning = true
        
            if (self.FeedPetsTimestamp and currentTime - self.FeedPetsTimestamp < self.FeedPetsDelay) then
                self.Cache.FeedPetsCurrentlyRunning = false
                return
            end
        
            self.Cache.FeedPetsTimestamp = currentTime
        
            -- Removed FedItems cache to allow re-feeding same items
        
            local character = LocalPlayer.Character
            if (not character) then
                self.Cache.FeedPetsCurrentlyRunning = false
                return
            end
        
            local Backpack = LocalPlayer.Backpack
            if (not Backpack) then
                self.Cache.FeedPetsCurrentlyRunning = false
                return
            end
        
                        if (#Configs.Pets.SelectedFeedPet <= 0) then
                self.Cache.FeedPetsCurrentlyRunning = false
                return
            end

            local pets = {}
            local uuid = nil
            local petModel = nil

            for _, petMover in ipairs(workspace.PetsPhysical:GetChildren()) do
                if petMover:GetAttribute("OWNER") == LocalPlayer.Name and petMover:FindFirstChildOfClass("Model") then
                    petModel = petMover:FindFirstChildOfClass("Model")
                    uuid = petMover:GetAttribute("UUID")
                    local petData = Modules.DataService:GetData().PetsData.PetInventory.Data[uuid]
                    
                    if petData and petData.PetType then
                        local petType = petData.PetType
                        local petName = petData.PetData and petData.PetData.Name or "?"
                        local petLevel = petData.PetData and petData.PetData.Level or "?"
                        
                        local rawId = petModel.Name
                        local cleanedId = rawId:sub(2, -2)
                        
                        local petLabel = string.format("%s - %s - %s (%s)", 
                            petType, 
                            petName, 
                            tostring(petLevel), 
                            cleanedId
                        )
                        
                        if (table.find(Configs.Pets.SelectedFeedPet, petLabel)) then
                            table.insert(pets, {
                                Mover = petMover,
                                Name = petLabel,
                                UUID = uuid
                            })
                        end
                    end
                end
            end
        
            if (#pets == 0) then
                self.Cache.FeedPetsCurrentlyRunning = false
                -- warn("No pets found to feed.")
                -- return
            end
        
            local feedSuccess = false
        
            for _, pet in ipairs(pets) do
                local petData = Modules.DataService:GetData().PetsData.PetInventory.Data[pet.UUID]
                
                if not petData then
                    warn("Pet data not found for UUID: ", pet.UUID)
                    continue
                end
                
                local petHunger = petData.PetData.Hunger
                local petName = petData.PetType
                local petDefaultHunger = Modules.PetList[petName].DefaultHunger
                
                if (not petHunger or not petDefaultHunger) then
                    warn("Pet hunger or default hunger not found for pet: ", petName)
                    continue
                end
                
                local hungerPercentage = (petHunger / petDefaultHunger) * 100
                
                if (hungerPercentage > Configs.Pets.FeedAtHunger) then
                    continue
                end
                
                    local ItemToFeed = nil
                    local HeighestWeight = 0
                
                    local CurrentHeldItem = character:FindFirstChildOfClass("Tool")
                    if CurrentHeldItem and Utils:GetResult(CurrentHeldItem, "ItemType") == "Holdable" then
                        local weightInstance = CurrentHeldItem.Weight
                        if (weightInstance) then
                            local mutations = Utils:GetMutation(CurrentHeldItem)
                            if (#mutations < 0 or Utils:Contains(Configs.Pets.SelectedAllowMutations, mutations)) then 
                                CurrentHeldItem.Parent = Backpack
                            else
                                HeighestWeight = weightInstance.Value
                                ItemToFeed = CurrentHeldItem
                            end
                        else
                            HeighestWeight = weightInstance.Value
                            ItemToFeed = CurrentHeldItem
                        end
                        task.wait()
                    end
                
                    if (not ItemToFeed) then
                        for _, item in ipairs(Backpack:GetChildren()) do
                            if item:IsA("Tool") and not ItemToFeed then
                                if Utils:GetResult(item, "ItemType") == "Holdable" and not Utils:GetResult(item, "ItemData.IsFavorite") then
                                    local mutations = Utils:GetMutation(item)
                                    if (mutations and Utils:Contains(Configs.Pets.SelectedAllowMutations, unpack(mutations)) or #mutations == 0) then
                                        ItemToFeed = item
                                    end
                                end
                                task.wait()
                            end
                        end
                    
                        if (ItemToFeed) then
                            ItemToFeed.Parent = character
                            task.wait(0.1)
                        end
                    end
                
                    if (ItemToFeed) then
                        local args = {
                            "Feed",
                            pet.UUID
                        }
                    
                        GameEvents:WaitForChild("ActivePetService"):FireServer(unpack(args))
                        feedSuccess = true
                        task.wait(0.2)
                    end
                end
        
            -- Removed FedItems cache clearing logic since we no longer use it
        
            self.Cache.FeedPetsCurrentlyRunning = false
            return feedSuccess
        end,

        FreezePets = function(self)
            if (Configs.Main.FreezePets) then
                if (os.time() - self.Cache.LastRanFreezePets < self.Cache.FreezePetsCooldown) then
                    return
                end

                self.Cache.LastRanFreezePets = os.time()
                for _, petMover in ipairs(workspace.PetsPhysical:GetChildren()) do
                    if (petMover:GetAttribute("OWNER") == LocalPlayer.Name) then
                        for _, child in ipairs(petMover:GetChildren()) do
                            if (child:IsA("Model")) then
                                local petUUID = child.Name
                                
                                local petType = Utils:GetPetResult(child, "PetType")
                                local petName = Utils:GetPetResult(child, "PetData.Name")
                                local petLevel = Utils:GetPetResult(child, "PetData.Level")
                                
                                local rawId = petUUID
                                local cleanedId = rawId:sub(2, -2)
                                
                                local petLabel = string.format("%s - %s - %s (%s)", 
                                    petType or "?", 
                                    petName or "?", 
                                    tostring(petLevel or "?"), 
                                    cleanedId
                                )
                                
                                if (table.find(Configs.Main.SelectedPets, petLabel)) then
                                    local response = GameEvents:WaitForChild("GetPetCooldown"):InvokeServer(petUUID)
                                    if (not response[1]) then
                                        task.spawn(function()
                                            for j = 1, 50 do
                                                GameEvents:WaitForChild("ActivePetService"):FireServer("SetPetState", petUUID, "Idle")
                                                task.wait(0.1)
                                            end
                                        end)
                                    else
                                        task.spawn(function()
                                            while (Configs.Main.FreezePets and table.find(Configs.Main.SelectedPets, petLabel)) do
                                                for j = 1, 50 do
                                                    GameEvents:WaitForChild("ActivePetService"):FireServer("SetPetState", petUUID, "Idle")
                                                    task.wait(0.1)
                                                end

                                                local cd = math.huge
                                                repeat
                                                    task.wait(1)
                                                    local cooldownResponse = GameEvents:WaitForChild("GetPetCooldown"):InvokeServer(petUUID)
                                                    if (cooldownResponse and cooldownResponse[1] and cooldownResponse[1].Time) then
                                                        cd = tonumber(cooldownResponse[1].Time)
                                                    end
                                                until cd and cd <= 1
                                                
                                                task.wait(2)
                                                
                                                repeat
                                                    task.wait(1)
                                                    local cooldownResponse = GameEvents:WaitForChild("GetPetCooldown"):InvokeServer(petUUID)
                                                    if (cooldownResponse and cooldownResponse[1] and cooldownResponse[1].Time) then
                                                        cd = tonumber(cooldownResponse[1].Time)
                                                    end
                                                until cd and cd ~= 0
                                            end
                                        end)
                                    end
                                end
                                break
                            end
                        end
                    end
                end
                task.wait(1)
            end
        end,
    },

    Pets =
    {
        Cache =
        {
            AutoHatchEggsTimestamp = nil,
            AutoPlaceEggsTimestamp = nil,
            AutoPlaceEggsRunning = false,
            AutoSellPetsRunning = false,
            AutoSellPetsTimestamp = nil,
            RecentlyPlacedPositions = {},
        },

        AutoHatch = function(self)
            local garden = Utils:ReturnGarden()
            if not (garden) then return end

            if (self.Cache.AutoHatchEggsTimestamp and os.time() - self.Cache.AutoHatchEggsTimestamp < 2) then
                return
            end

            local objects = garden.Important.Objects_Physical
            for i,v in ipairs(objects:GetChildren()) do
                if (v.Name == "PetEgg") then
                    local time = v:GetAttribute("TimeToHatch")
                    if not (time == 0) then continue end
                    

                    local args =
                    {
                        "HatchPet",
                        v
                    }

                    ReplicatedStorage.GameEvents.PetEggService:FireServer(unpack(args))
                end
            end

            self.Cache.AutoHatchEggsTimestamp = os.time()
        end,

        AutoPlaceEggs = LPH_NO_VIRTUALIZE(function(self)
            local garden = Utils:ReturnGarden()
            if not (garden) then return end

            if (self.Cache.AutoPlaceEggsRunning) then
                return
            end

            if (self.Cache.AutoPlaceEggsTimestamp and os.time() - self.Cache.AutoPlaceEggsTimestamp < 0.25) then
                return
            end
            
            self.Cache.AutoPlaceEggsTimestamp = os.time()
            
            -- Clean up old recently placed positions (older than 3 seconds)
            local currentTime = os.time()
            for i = #self.Cache.RecentlyPlacedPositions, 1, -1 do
                if currentTime - self.Cache.RecentlyPlacedPositions[i].timestamp > 3 then
                    table.remove(self.Cache.RecentlyPlacedPositions, i)
                end
            end
            
            local maxeggs = Utils:ReturnMaxEggs()
            local objects = garden.Important.Objects_Physical
            local plantedeggs = 0
            local plantedcframes = {}
            local peteggsinventory = 0

            local backpack = LocalPlayer.Backpack
            for i,v in ipairs(backpack:GetChildren()) do
                if v:IsA("Tool") and Utils:GetResult(v, "ItemType") == "PetEgg" then
                    peteggsinventory = peteggsinventory + 1
                end
            end

            if (peteggsinventory == 0) then
                self.Cache.AutoPlaceEggsRunning = false
                self.Cache.AutoPlaceEggsTimestamp = os.time()
                return
            end

            for i,v in ipairs(objects:GetChildren()) do
                if (v.Name == "PetEgg") then
                    plantedeggs = plantedeggs + 1
                    table.insert(plantedcframes, v.PetEgg.CFrame)
                end
            end

            -- Add recently placed positions to planted frames for collision checking
            for i,v in ipairs(self.Cache.RecentlyPlacedPositions) do
                table.insert(plantedcframes, CFrame.new(v.position))
            end

            if (plantedeggs and plantedeggs >= maxeggs) then
                self.Cache.AutoPlaceEggsRunning = false
                self.Cache.AutoPlaceEggsTimestamp = os.time()
                return
            end


            local canplant = garden.Important.Plant_Locations:FindFirstChild("Can_Plant")
            local positions = {}
            local spacing = 5

            for x = -1, 1 do
                for z = -1, 1 do
                    if not (x == 0 and z == 0) then
                        table.insert(positions, Vector3.new(
                            canplant.Position.X + (x * spacing),
                            canplant.Position.Y,
                            canplant.Position.Z + (z * spacing)
                        ))
                    end
                end
            end

            local character = LocalPlayer.Character
            local helditem = character:FindFirstChildOfClass("Tool")


            local positiontoplace = nil
            for i,v in ipairs(positions) do
                local tooclose = false
                for j, plantedcframe in ipairs(plantedcframes) do
                    if ((v - plantedcframe.Position).Magnitude <= 5) then
                        tooclose = true
                        break
                    end
                end
                if not (tooclose) then
                    positiontoplace = v
                    break
                end
            end

            local containsegg
            local backpack = LocalPlayer.Backpack
            for i,v in ipairs(backpack:GetChildren()) do
                if v:IsA("Tool") and Utils:GetResult(v, "ItemType") == "PetEgg" then
                    local itemname = Utils:GetResult(v, "ItemData.EggName")
                    if (Utils:Contains(Configs.Pets.SelectedAutoPlaceEggs, itemname)) then
                        containsegg = true
                        break
                    end
                end
            end

            if not (containsegg) then
                self.Cache.AutoPlaceEggsRunning = false
                self.Cache.AutoPlaceEggsTimestamp = os.time()
                return
            end


            if helditem and not Utils:Contains(Configs.Pets.SelectedAutoPlaceEggs, Utils:GetResult(helditem, "ItemData.EggName")) then
                helditem.Parent = backpack
            elseif helditem and Utils:Contains(Configs.Pets.SelectedAutoPlaceEggs, Utils:GetResult(helditem, "ItemData.EggName")) then
                if positiontoplace then
                    local Event = ReplicatedStorage.GameEvents.PetEggService
                    Event:FireServer(table.unpack({
                        "CreateEgg",
                        positiontoplace,
                    }))
                    
                    -- Cache the placed position to prevent immediate re-placement
                    table.insert(self.Cache.RecentlyPlacedPositions, {
                        position = positiontoplace,
                        timestamp = os.time()
                    })
                    
                    helditem.Parent = backpack
                    self.Cache.AutoPlaceEggsRunning = false
                    self.Cache.AutoPlaceEggsTimestamp = os.time()
                    return
                else
                    -- If no valid position found, don't unequip - try again next heartbeat
                    self.Cache.AutoPlaceEggsRunning = false
                    self.Cache.AutoPlaceEggsTimestamp = os.time() - 0.2  -- Allow retry sooner
                    return
                end
            end

            if not (helditem) then
                for i,v in ipairs(backpack:GetChildren()) do
                    if v:IsA("Tool") and Utils:GetResult(v, "ItemType") == "PetEgg" then
                        local itemname = Utils:GetResult(v, "ItemData.EggName")
                        if (Utils:Contains(Configs.Pets.SelectedAutoPlaceEggs, itemname)) then
                            if positiontoplace then
                                v.Parent = character
                                local Event = ReplicatedStorage.GameEvents.PetEggService
                                Event:FireServer(table.unpack({
                                    "CreateEgg",
                                    positiontoplace,
                                }))
                                
                                -- Cache the placed position to prevent immediate re-placement
                                table.insert(self.Cache.RecentlyPlacedPositions, {
                                    position = positiontoplace,
                                    timestamp = os.time()
                                })
                                
                                self.Cache.AutoPlaceEggsRunning = false
                                self.Cache.AutoPlaceEggsTimestamp = os.time()
                                return
                            else
                                -- If no valid position found, don't equip - try again next heartbeat
                                self.Cache.AutoPlaceEggsRunning = false
                                self.Cache.AutoPlaceEggsTimestamp = os.time() - 0.2  -- Allow retry sooner
                                return
                            end
                        end
                    end
                end
            end

            self.Cache.AutoPlaceEggsRunning = false
        end),

        AutoSellPets = LPH_NO_VIRTUALIZE(function(self)
            if (not Configs.Pets.SellPets) then
                return
            end

            local backpack = LocalPlayer.Backpack
            local character = LocalPlayer.Character

            if (self.Cache.AutoSellPetsRunning) then
                return
            end

            if (self.Cache.AutoSellPetsTimestamp and os.time() - self.Cache.AutoSellPetsTimestamp < 0.5) then
                return
            end

            self.Cache.AutoSellPetsRunning = true
            
            -- Check if we have any sellable pets in backpack before unequipping
            local hasSellablePets = false
            for i,v in ipairs(backpack:GetChildren()) do
                if not (v:IsA("Tool") and v:GetAttribute("ItemType") == "Pet") then continue end
                if Utils:GetPetResult(v, "PetData.IsFavorite") == true then continue end
                
                local Rarity
                for Petname, petInfo in pairs(Modules.PetList) do
                    if (string.find(Utils:GetPetResult(v, "PetType"), Petname)) then
                        Rarity = petInfo.Rarity
                        break
                    end
                end
                
                local shouldSell = true
                
                if (Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Rarity") and not Utils:Contains(Configs.Pets.SelectedSellPetsRarities, Rarity)) then
                    shouldSell = false
                end
                
                if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Weight")) then
                    local petname = v.Name
                    local petweight = tonumber(string.match(petname, "%[([%d%.]+) KG%]")) or 0
                    local configweight = tonumber(Configs.Pets.SellPetsWeight)
                    if not (configweight == 0 or (petweight > 0 and configweight > 0 and petweight < configweight)) then
                        shouldSell = false
                    end
                end
                
                if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Age")) then
                    local petname = v.Name
                    local petage = tonumber(string.match(petname, "%[Age (%d+)%]")) or 0
                    local configage = tonumber(Configs.Pets.SellPetsAge)
                    if not (configage == 0 or (petage > 0 and configage > 0 and petage > configage)) then
                        shouldSell = false
                    end
                end
                
                if shouldSell then
                    hasSellablePets = true
                    break
                end
            end
            
            local helditem = character:FindFirstChildOfClass("Tool")
            
            -- Only unequip items if we have sellable pets to work with
            if (hasSellablePets and helditem and (helditem:GetAttribute("ItemType") ~= "Pet" or Utils:GetPetResult(helditem, "PetData.IsFavorite") == true)) then
                helditem.Parent = backpack
            elseif (helditem and helditem:GetAttribute("ItemType") == "Pet" and Utils:GetPetResult(helditem, "PetData.IsFavorite") ~= true) then
                local Rarity
                for Petname, petInfo in pairs(Modules.PetList) do
                    if (string.find(Utils:GetPetResult(helditem, "PetType"), Petname)) then
                        Rarity = petInfo.Rarity
                        break
                    end
                end

                local shouldSell = true
                
                -- Check if rarity is selected for selling
                print("Rarity:", Rarity)
                if (Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Rarity") and not Utils:Contains(Configs.Pets.SelectedSellPetsRarities, Rarity)) then
                    shouldSell = false
                end
                
                if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Weight")) then
                    local petname = Utils:GetPetResult(helditem, "PetType")
                    local petweight = tonumber(string.match(petname, "%[([%d%.]+) KG%]")) or 0
                    local configweight = tonumber(Configs.Pets.SellPetsWeight)
                    if not (configweight == 0 or (petweight > 0 and configweight > 0 and petweight < configweight)) then
                        shouldSell = false
                    end
                end
                
                if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Age")) then
                    local petname = Utils:GetPetResult(helditem, "PetType")
                    local petage = tonumber(string.match(petname, "%[Age (%d+)%]")) or 0
                    local configage = tonumber(Configs.Pets.SellPetsAge)
                    if not (configage == 0 or (petage > 0 and configage > 0 and petage > configage)) then
                        shouldSell = false
                    end
                end

                if (shouldSell and Utils:GetPetResult(helditem, "PetData.IsFavorite") ~= true) then
                    local args = {helditem}
                    ReplicatedStorage.GameEvents.SellPet_RE:FireServer(unpack(args))
                    task.wait()
                end
            end

            if not (helditem) then
                for i,v in ipairs(backpack:GetChildren()) do
                    if not (v:IsA("Tool") and v:GetAttribute("ItemType") == "Pet") then continue end
                    
                    local Rarity
                    for Petname, petInfo in pairs(Modules.PetList) do
                        if (string.find(Utils:GetPetResult(v, "PetType"), Petname)) then
                            Rarity = petInfo.Rarity
                            break
                        end
                    end
                    
                    local shouldSell = true
                    
                    -- Check if rarity is selected for selling
                    print("Rarity:", Rarity)
                    if (Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Rarity") and not Utils:Contains(Configs.Pets.SelectedSellPetsRarities, Rarity)) then
                        shouldSell = false
                        print("Should not sell due to rarity:", Rarity)
                    end
                    
                    if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Weight")) then
                        local petname = v.Name
                        local petweight = tonumber(string.match(petname, "%[([%d%.]+) KG%]")) or 0
                        local configweight = tonumber(Configs.Pets.SellPetsWeight)
                        if not (configweight == 0 or (petweight > 0 and configweight > 0 and petweight < configweight)) then
                            shouldSell = false
                        end
                    end
                    
                    if (shouldSell and Utils:Contains(Configs.Pets.SelectedSellPetsOptions, "Age")) then
                        local petname = v.Name
                        local petage = tonumber(string.match(petname, "%[Age (%d+)%]")) or 0
                        local configage = tonumber(Configs.Pets.SellPetsAge)
                        if not (configage == 0 or (petage > 0 and configage > 0 and petage > configage)) then
                            shouldSell = false
                        end
                    end
                    
                    if (shouldSell and Utils:GetPetResult(v, "PetData.IsFavorite") ~= true) then
                        v.Parent = LocalPlayer.Character
                        local args = {v}
                        ReplicatedStorage.GameEvents.SellPet_RE:FireServer(unpack(args))
                        task.wait()
                        self.Cache.AutoSellPetsTimestamp = os.time()
                        self.Cache.AutoSellPetsRunning = false
                        break
                    end
                end
            end
            
            self.Cache.AutoSellPetsTimestamp = os.time()
            self.Cache.AutoSellPetsRunning = false
        end),
    },

    Plot =
    {
        Cache = {
            LastCheckedDestructibles = 0,
            DestructiblesCheckInterval = 0.5,
            LastCheckedMovables = 0,
            MovablesCheckInterval = 0.5,

            -- Batching system for MoveFruits
            MoveFruitsBatchSize = 15,
            MoveFruitsCurrentIndex = 1,
        },

        AutoDestroy = LPH_NO_VIRTUALIZE(function(self)
            if (not Configs.Plot.AutoDestroy) then return end

            if (self.Cache.LastCheckedDestructibles and os.time() - self.Cache.LastCheckedDestructibles < self.Cache.DestructiblesCheckInterval) then
                return
            end

            self.Cache.LastCheckedDestructibles = os.time()
            local garden = Utils:ReturnGarden()
            if (not garden) then return end
            if (#Configs.Plot.SelectedRemovables <= 0) then return end

            local helditem = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if (helditem and not string.find(helditem.Name, "Shovel")) then
                helditem.Parent = LocalPlayer.Backpack
            end

            local shovel
            for i,v in ipairs(LocalPlayer.Backpack:GetChildren()) do
                if (string.find(v.Name, "Shovel")) then 
                    shovel = v
                    break
                end
            end

            if not (shovel) then
                return
            end

            shovel.Parent = LocalPlayer.Character
            for i,v in ipairs(garden.Important.Plants_Physical:GetChildren()) do
                if (Utils:Contains(Configs.Plot.SelectedRemovables, v.Name)) then
                    local grow = v:FindFirstChild("Grow")
                    GameEvents:WaitForChild("Remove_Item"):FireServer(grow)
                    task.wait(0.1)
                end
            end
        end),

        MoveFruits = LPH_NO_VIRTUALIZE(function(self)
            if not Configs.Plot.MoveFruits then return end
            if #Configs.Plot.SelectedMovableFruits <= 0 then return end

            if (self.Cache.LastCheckedMovables and os.time() - self.Cache.LastCheckedMovables < self.Cache.MovablesCheckInterval) then
                return
            end

            self.Cache.LastCheckedMovables = os.time()
    
            local trowel
            local heldItem = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    
            if heldItem and heldItem.Name:find("Trowel") then
                trowel = heldItem
            else
                for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if item.Name:find("Trowel") then
                        trowel = item
                        break
                    end
                end
                if not trowel then return end
            end
    
            local garden = Utils:ReturnGarden()
            if not garden then return end
    
            local plants = garden.Important.Plants_Physical:GetChildren()
            local plantLocations = garden.Important.Plant_Locations
    
            local function isInXZBounds(part, point)
                local relative = part.CFrame:PointToObjectSpace(point)
                local halfSize = part.Size / 2
                return math.abs(relative.X) <= halfSize.X and math.abs(relative.Z) <= halfSize.Z
            end
    
            local function getToucanPosition(plantPart)
                for _, pet in pairs(workspace.PetsPhysical:GetChildren()) do
                    if (pet:GetAttribute("OWNER") == LocalPlayer.Name) then
                        for _, v in pairs(pet:GetChildren()) do
                            if (Utils:GetPetResult(v, "PetType") == "Toucan") then
                                local pivotPos = v:IsA("Model") and v:GetPivot().Position
                                local rectangles = {
                                    plantLocations.Can_Plant,
                                    plantLocations:GetChildren()[2]
                                }
                                
                                local inBounds = false
                                for _, rect in ipairs(rectangles) do
                                    if (isInXZBounds(rect, pivotPos)) then
                                        inBounds = true
                                        break
                                    end
                                end
                                
                                if inBounds then
                                    local distance = (plantPart.Position - pivotPos).Magnitude
                                    if (distance >= 25) then
                                        return CFrame.new(pivotPos.X, plantPart.Position.Y, pivotPos.Z)
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
    
            local function getEchoFrogCFrame()
                for _, pet in pairs(workspace.PetsPhysical:GetChildren()) do
                    if pet:GetAttribute("OWNER") == LocalPlayer.Name then
                        for _, v in pairs(pet:GetChildren()) do
                            if Utils:GetPetResult(v, "PetType") == "Echo Frog" or Utils:GetPetResult(v, "PetType") == "Frog" then
                                local result = GameEvents:WaitForChild("GetPetCooldown"):InvokeServer(v.Name)
                                local cooldownTime = result and result[1] and tonumber(result[1].Time) or math.huge
                                if cooldownTime <= 1 then
                                    local pivotPos = v:IsA("Model") and v:GetPivot().Position or v.Position
                                    local rectangles = {
                                        plantLocations.Can_Plant,
                                        plantLocations:GetChildren()[2]
                                    }
    
                                    for _, rect in ipairs(rectangles) do
                                        if isInXZBounds(rect, pivotPos) then
                                            return v:GetPivot()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
    
            local function getPointCFrame()
                for _, pet in pairs(workspace.PetsPhysical:GetChildren()) do
                    if (pet:GetAttribute("OWNER") == LocalPlayer.Name) then
                        for _, v in pairs(pet:GetChildren()) do
                            local petType = Utils:GetPetResult(v, "PetType")
                            if (petType == "Moon Cat" or petType == "Praying Mantis") then
                                local result = GameEvents:WaitForChild("GetPetCooldown"):InvokeServer(v.Name)
                                local cooldownTime = result and result[1] and tonumber(result[1].Time) or math.huge
                                if cooldownTime <= 1 then
                                    local pivotPos = v:IsA("Model") and v:GetPivot().Position or v.Position
                                    local rectangles = {
                                        plantLocations.Can_Plant,
                                        plantLocations:GetChildren()[2]
                                    }
                                    
                                    for _, rect in ipairs(rectangles) do
                                        if (isInXZBounds(rect, pivotPos)) then
                                            return v:GetPivot()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
    
            local function getTargetCFrame(toucan, plantPart)
                local targetCFrame
                if Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Character") then
                    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not hrp then return nil end
                    targetCFrame = hrp.CFrame * CFrame.new(0, 0, -5)
                elseif Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Moon Cat") or Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Praying Mantis") then
                    targetCFrame = getPointCFrame()
                    if not targetCFrame then return nil end
                elseif Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Echo Frog") or Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Frog") then
                    targetCFrame = getEchoFrogCFrame()
                    if not targetCFrame then return nil end
                elseif Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Toucan") and toucan == true then
                    targetCFrame = getToucanPosition(plantPart)
                    if not targetCFrame then return nil end
                else
                    return nil
                end
    
                return targetCFrame
            end
    
            -- Batching system: process only a subset of plants per execution
            local startIndex = self.Cache.MoveFruitsCurrentIndex
            local endIndex = math.min(startIndex + self.Cache.MoveFruitsBatchSize - 1, #plants)
            local plantsToProcess = {}
            
            -- Extract the batch of plants to process
            for i = startIndex, endIndex do
                table.insert(plantsToProcess, plants[i])
            end
            
            -- Update the current index for next execution
            self.Cache.MoveFruitsCurrentIndex = endIndex + 1
            if self.Cache.MoveFruitsCurrentIndex > #plants then
                self.Cache.MoveFruitsCurrentIndex = 1 -- Reset to beginning
            end

            for _, plant in ipairs(plantsToProcess) do
                if Utils:Contains(Configs.Plot.SelectedMovableFruits, plant.Name) then
                    local plantPart = plant:FindFirstChildOfClass("Part")
                    if plantPart then
    
                        local tropicalfruitlist =
                        {
                            "Traveler's Fruit",
                            "Pitcher Plant",
                            "Parasol Flower",
                            "Honeysuckle",
                            "Cocovine",
                            "Mango",
                            "Dragon Fruit",
                            "Pineapple",
                        }
    
                        local foundtropical = false
                        if (Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Toucan")) then
                            for i,v in ipairs(tropicalfruitlist) do
                                if (plant.Name == v) then
                                    foundtropical = true
                                    break
                                end
                            end
                        end
    
                        local targetCFrame = getTargetCFrame(plantPart, foundtropical)
                        if targetCFrame and (plantPart.Position - targetCFrame.Position).Magnitude >= 5 then
                            task.defer(function()
                                if heldItem ~= trowel then
                                    LocalPlayer.Character.Humanoid:EquipTool(trowel)
                                end
    
                                if (Utils:Contains(Configs.Plot.SelectedMoveFruitsMode, "Character")) then
                                    for _, part in ipairs(plant:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.CanCollide = false
                                        end
                                    end
                                end
    
                                GameEvents.TrowelRemote:InvokeServer("Pickup", trowel, plant)
                                GameEvents.TrowelRemote:InvokeServer("Place", trowel, plant, targetCFrame)
                            end)
                        end
                    end
                end
            end
    
            if trowel.Parent == LocalPlayer.Character then
                trowel.Parent = LocalPlayer.Backpack
            end
        end)
    }
}

Sections.Farm:Toggle({
    Name = "Auto Collect",
    Flag = "FarmAutoCollect",
    Default = Configs.Farm.AutoCollect,
    Callback = function(value)
        Configs.Farm.AutoCollect = value
        if (value) then
            -- Force a full scan when enabling
            Features.Farm.Cache.needsFullScan = true
            if (not Features.Connections.AutoCollectConnection) then
                Features.Connections.AutoCollectConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Farm:AutoCollect()
                end))
            end
        else
            if (Features.Connections.AutoCollectConnection) then
                Features.Connections.AutoCollectConnection:Disconnect()
                Features.Connections.AutoCollectConnection = nil
            end
            -- Clean up connections when disabling
            if (Features.Farm.Cache.collectPromptsConnection) then
                Features.Farm.Cache.collectPromptsConnection:Disconnect()
                Features.Farm.Cache.collectPromptsConnection = nil
            end
        end
    end,
})

Sections.Farm:Dropdown({
    Name = "Collect Mode",
    Flag = "FarmCollectMode",
    Options = Configs.Farm.AutoCollectModes,
    Default = Configs.Farm.SelectedCollectMode,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedCollectMode = value
    end,
})

Sections.Farm:Dropdown({
    Name = "Tranquil Mode",
    Flag = "FarmAutoTranquilMode",
    Options = Configs.Farm.AutoTranquilMode,
    Max = 99,
    Default = Configs.Farm.SelectedTranquilMode,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedTranquilMode = value
    end,
})

Sections.Farm:Toggle({
    Name = "Auto-Give Tranquil",
    Flag = "FarmAutoGiveTranquil",
    Default = Configs.Farm.AutoGiveTranquil,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.AutoGiveTranquil = value
        if (value) then
            if (not Features.Connections.AutoGiveTranquilConnection) then
                Features.Connections.AutoGiveTranquilConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Farm:AutoGiveTranquil()
                end))
            end
        else
            if (Features.Connections.AutoGiveTranquilConnection) then
                Features.Connections.AutoGiveTranquilConnection:Disconnect()
                Features.Connections.AutoGiveTranquilConnection = nil
            end
        end
    end,
})

Subsections.Collect:Separator({
    Depends = {
        ["FarmAutoCollect"] = true,
    },
})

Subsections.Collect:Dropdown({
    Name = "Filter Mutations",
    Flag = "FarmCollectMutationsMode",
    Options = Configs.Farm.CollectMutationsModes,
    Default = Configs.Farm.SelectedCollectMutationsMode,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedCollectMutationsMode = value
    end,
})

Subsections.Collect:Dropdown({
    Name = "Mutations",
    Flag = "FarmCollectMutations",
    Options = Configs.General.AllMutations,
    Max = 99,
    Default = Configs.Farm.SelectedMutations,
    Depends = {
        ["FarmAutoCollect"] = true,
        ["FarmCollectMutationsMode"] = {
            excludes = {"Disabled"}
        },
    },
    Callback = function(value)
        Configs.Farm.SelectedMutations = value
    end,
})

Subsections.Collect:Separator({
    Depends = {
        ["FarmAutoCollect"] = true,
    },
})

Subsections.Collect:Dropdown({
    Name = "Filter Fruits",
    Flag = "FarmCollectFruitsMode",
    Options = Configs.Farm.CollectFruitsModes,
    Default = Configs.Farm.SelectedCollectFruitsMode,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedCollectFruitsMode = value
    end,
})

Subsections.Collect:Dropdown({
    Name = "Fruits",
    Flag = "FarmCollectFruits",
    Options = Configs.General.AllSeeds,
    Max = 99,
    Default = Configs.Farm.SelectedFruits,
    Depends = {
        ["FarmAutoCollect"] = true,
        ["FarmCollectFruitsMode"] = {
            excludes = {"Disabled"}
        },
    },
    Callback = function(value)
        Configs.Farm.SelectedFruits = value
    end,
})

Subsections.Collect:Separator({
    Depends = {
        ["FarmAutoCollect"] = true,
    },
})

Subsections.Collect:Dropdown({
    Name = "Filter Weathers",
    Flag = "FarmCollectWeathersMode",
    Options = Configs.Farm.CollectWeathersModes,
    Default = Configs.Farm.SelectedCollectWeathersMode,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedCollectWeathersMode = value
    end,
})

Subsections.Collect:Dropdown({
    Name = "Weathers",
    Flag = "FarmCollectWeathers",
    Options = Configs.General.AllWeathers,
    Max = 99,
    Default = Configs.Farm.SelectedWeathers,
    Depends = {
        ["FarmAutoCollect"] = true,
        ["FarmCollectWeathersMode"] = {
            excludes = {"Disabled"}
        },
    },
    Callback = function(value)
        Configs.Farm.SelectedWeathers = value
    end,
})

Subsections.Collect:Separator({
    Depends = {
        ["FarmAutoCollect"] = true,
    },
})

Subsections.Collect:Dropdown({
    Name = "Additional Filters",
    Flag = "FarmCollectAdditionalFilters",
    Options = Configs.Farm.CollectAdditionalFilters,
    Default = Configs.Farm.SelectedCollectAdditionalFilters,
    Max = 99,
    Depends = {
        ["FarmAutoCollect"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedCollectAdditionalFilters = value
    end,
})

Subsections.Collect:Textbox({
    Name = "Weight",
    Flag = "FarmCollectWeightLimit",
    PlaceholderText = "Enter weight limit..",
    Depends = {
        ["FarmAutoCollect"] = true,
        ["FarmCollectAdditionalFilters"] = {
            contains = {"Weight"}
        },
    },
    Default = tostring(Configs.Farm.CollectWeight),
    Callback = function(value)
        local weightLimit = tonumber(value)
        if (weightLimit and weightLimit >= 0) then
            Configs.Farm.CollectWeight = weightLimit
        end
    end,
})

Subsections.Collect:Textbox({
    Name = "Price",
    Flag = "FarmCollectPrice",
    PlaceholderText = "Enter price..",
    Depends = {
        ["FarmAutoCollect"] = true,
        ["FarmCollectAdditionalFilters"] = {
            contains = {"Price"}
        },
    },
    Default = tostring(Configs.Farm.CollectPrice),
    Callback = function(value)
        local price = tonumber(value)
        if (price and price >= 0) then
            Configs.Farm.CollectPrice = price
        end
    end,
})

Subsections.Farm:Toggle({
    Name = "Auto Plant",
    Flag = "FarmAutoPlant",
    Default = Configs.Farm.AutoPlant,
    Callback = function(value)
        Configs.Farm.AutoPlant = value
        if (value) then
            if (not Features.Connections.AutoPlantConnection) then
                Features.Connections.AutoPlantConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Farm:AutoPlant()
                end))
            end
        else
            if (Features.Connections.AutoPlantConnection) then
                Features.Connections.AutoPlantConnection:Disconnect()
                Features.Connections.AutoPlantConnection = nil
            end
        end
    end,
})

Subsections.Farm:Dropdown({
    Name = "Plant Mode",
    Flag = "FarmAutoPlantMode",
    Options = Configs.Farm.AutoPlantModes,
    Default = Configs.Farm.SelectedPlantMode,
    Depends = {
        ["FarmAutoPlant"] = true,
    },
    Callback = function(value)
        Configs.Farm.SelectedPlantMode = value
    end,
})

local PlantOptions = {}
for _, seed in ipairs(Configs.General.AllSeeds) do
    table.insert(PlantOptions, seed .. " Seed")
end
table.insert(PlantOptions, "All")

Subsections.Farm:Dropdown({
    Name = "Seeds",
    Flag = "FarmAutoPlantSeeds",
    Options = PlantOptions,
    Max = 99,
    Default = Configs.Farm.AutoPlantSeeds,
    Depends = {
        ["FarmAutoPlant"] = true,
    },
    Callback = function(value)
        Configs.Farm.AutoPlantSeeds = value
    end,
})

Subsections.Sell:Toggle({
    Name = "Auto Sell",
    Flag = "SellAutoSell",
    Default = Configs.Sell.AutoSell,
    Callback = function(value)
        Configs.Sell.AutoSell = value
        if (value) then
            if (not Features.Connections.AutoSellConnection) then
                Features.Connections.AutoSellConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Farm:AutoSell()
                end))
            end
        else
            if (Features.Connections.AutoSellConnection) then
                Features.Connections.AutoSellConnection:Disconnect()
                Features.Connections.AutoSellConnection = nil
            end
        end
    end,
})

Subsections.Sell:Dropdown({
    Name = "Select Mode",
    Flag = "SellAutoSellMode",
    Options = Configs.Sell.AutoSellModes,
    Default = Configs.Sell.SelectedSellMode,
    Max = 15,
    Depends = {
        ["SellAutoSell"] = true,
    },
    Callback = function(value)
        Configs.Sell.SelectedSellMode = value
    end,
})

Subsections.Sell:Textbox({
    Name = "Configure Timer",
    Flag = "SellAutoSellTimer",
    PlaceholderText = "Time in seconds..",
    Depends = {
        ["SellAutoSell"] = true,
        ["SellAutoSellMode"] = {
            contains = {"Timer"}
        },
    },
    Default = tostring(Configs.Sell.AutoSellTimer),
    Callback = function(value)
        local timer = tonumber(value)
        if (timer and timer > 0) then
            Configs.Sell.AutoSellTimer = timer
        end
    end,
})

Subsections.Sell:Button({
    Name = "Force Sell",
    Depends = {
        ["SellAutoSell"] = true,
    },
    Callback = function()
        Features.Farm:AutoSell(true)
    end,
})

Subsections.Favourite:Toggle({
    Name = "Auto Favourite",
    Flag = "FavouriteAutoFavourite",
    Default = Configs.Favourite.AutoFavourite,
    Callback = function(value)
        Configs.Favourite.AutoFavourite = value
        if (value) then
            if (not Features.Connections.AutoFavoriteConnection) then
                Features.Connections.AutoFavoriteConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Farm:AutoFavorite()
                end))
            end
        else
            if (Features.Connections.AutoFavoriteConnection) then
                Features.Connections.AutoFavoriteConnection:Disconnect()
                Features.Connections.AutoFavoriteConnection = nil
            end
        end
    end,
})

Subsections.Favourite:Dropdown({
    Name = "Select Options",
    Flag = "FavouriteAutoFavouriteOption",
    Options = Configs.Favourite.AutoFavoriteOptions,
    Default = Configs.Favourite.SelectedFavouriteOptions,
    Max = 99,
    Depends = {
        ["FavouriteAutoFavourite"] = true,
    },
    Callback = function(value)
        Configs.Favourite.SelectedFavouriteOptions = value
    end,
})

Subsections.Favourite:Textbox({
    Name = "Weight",
    Flag = "FavouriteWeight",
    PlaceholderText = "Enter weight..",
    Default = tostring(Configs.Favourite.SelectedWeight),
    Depends = {
        ["FavouriteAutoFavourite"] = true,
        ["FavouriteAutoFavouriteOption"] = {
            contains = {"Weight"}
        },
    },
    Callback = function(value)
        local weight = tonumber(value)
        if (weight and weight >= 0) then
            Configs.Favourite.SelectedWeight = weight
        end
    end,
})

Subsections.Favourite:Textbox({
    Name = "Price",
    Flag = "FavouritePrice",
    PlaceholderText = "Enter price..",
    Default = tostring(Configs.Favourite.SelectedPrice),
    Depends = {
        ["FavouriteAutoFavourite"] = true,
        ["FavouriteAutoFavouriteOption"] = {
            contains = {"Price"}
        },
    },
    Callback = function(value)
        local price = tonumber(value)
        if (price and price >= 0) then
            Configs.Favourite.SelectedPrice = price
        end
    end,
})

Subsections.Favourite:Dropdown({
    Name = "Mutations",
    Flag = "FavouriteMutations",
    Options = Configs.General.AllMutations,
    Max = 99,
    Default = Configs.Favourite.SelectedMutations,
    Depends = {
        ["FavouriteAutoFavourite"] = true,
        ["FavouriteAutoFavouriteOption"] = {
            contains = {"Mutations"}
        },
    },
    Callback = function(value)
        Configs.Favourite.SelectedMutations = value
    end,
})

Subsections.Seeds:Toggle({
    Name = "Purchase Seeds",
    Flag = "ShopPurchaseSeeds",
    Default = Configs.Shop.AutoPurchaseSeeds,
    Callback = function(value)
        Configs.Shop.AutoPurchaseSeeds = value
        if (value) then
            if (not Features.Connections.AutoPurchaseSeedsConnection) then
                Features.Connections.AutoPurchaseSeedsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Shop:AutoPurchaseSeeds()
                end))
            end
        else
            if (Features.Connections.AutoPurchaseSeedsConnection) then
                Features.Connections.AutoPurchaseSeedsConnection:Disconnect()
                Features.Connections.AutoPurchaseSeedsConnection = nil
            end
        end
    end,
})

Subsections.Seeds:Dropdown({
    Name = "Seeds",
    Flag = "ShopPurchaseSeedsList",
    Options = Configs.Shop.SeedPurchaseSelection,
    Default = Configs.Shop.SelectedPurchaseSeeds,
    Max = 99,
    Depends = {
        ["ShopPurchaseSeeds"] = true,
    },
    Callback = function(value)
        Configs.Shop.SelectedPurchaseSeeds = value
    end,
})

Subsections.Seeds:Textbox({
    Name = "Amount to Purchase",
    Flag = "ShopPurchaseSeedsLimit",
    PlaceholderText = "Enter Amount..",
    Default = tostring(Configs.Shop.SeedPurchaseAmount),
    Depends = {
        ["ShopPurchaseSeeds"] = true,
    },
    Callback = function(value)
        local limit = tonumber(value)
        Configs.Shop.SeedPurchaseAmount = limit
    end,
})

Subsections.Gears:Toggle({
    Name = "Purchase Gear",
    Flag = "ShopPurchaseGears",
    Default = Configs.Shop.AutoPurchaseGears,
    Callback = function(value)
        Configs.Shop.AutoPurchaseGears = value
        if (value) then
            if (not Features.Connections.AutoPurchaseGearsConnection) then
                Features.Connections.AutoPurchaseGearsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Shop:AutoPurchaseGears()
                end))
            end
        else
            if (Features.Connections.AutoPurchaseGearsConnection) then
                Features.Connections.AutoPurchaseGearsConnection:Disconnect()
                Features.Connections.AutoPurchaseGearsConnection = nil
            end
        end
    end,
})

Subsections.Gears:Dropdown({
    Name = "Gears",
    Flag = "ShopPurchaseGearsList",
    Options = Configs.Shop.GearPurchaseSelection,
    Default = Configs.Shop.SelectedPurchaseGears,
    Max = 99,
    Depends = {
        ["ShopPurchaseGears"] = true,
    },
    Callback = function(value)
        Configs.Shop.SelectedPurchaseGears = value
    end,
})

Subsections.Gears:Textbox({
    Name = "Amount to Purchase",
    Flag = "ShopPurchaseGearsLimit",
    PlaceholderText = "Enter Amount..",
    Default = tostring(Configs.Shop.GearPurchaseAmount),
    Depends = {
        ["ShopPurchaseGears"] = true,
    },
    Callback = function(value)
        local limit = tonumber(value)
        Configs.Shop.GearPurchaseAmount = limit
    end,
})

Subsections.Eggs:Toggle({
    Name = "Purchase Eggs",
    Flag = "ShopPurchaseEggs",
    Default = Configs.Shop.AutoPurchaseEggs,
    Callback = function(value)
        Configs.Shop.AutoPurchaseEggs = value
        if (value) then
            if (not Features.Connections.AutoPurchaseEggsConnection) then
                Features.Connections.AutoPurchaseEggsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Shop:AutoPurchaseEggs()
                end))
            end
        else
            if (Features.Connections.AutoPurchaseEggsConnection) then
                Features.Connections.AutoPurchaseEggsConnection:Disconnect()
                Features.Connections.AutoPurchaseEggsConnection = nil
            end
        end
    end,
})

Subsections.Eggs:Dropdown({
    Name = "Eggs",
    Flag = "ShopPurchaseEggsList",
    Options = Configs.Shop.EggPurchaseSelection,
    Default = Configs.Shop.SelectedPurchaseEggs,
    Max = 99,
    Depends = {
        ["ShopPurchaseEggs"] = true,
    },
    Callback = function(value)
        Configs.Shop.SelectedPurchaseEggs = value
    end,
})

Subsections.Eggs:Textbox({
    Name = "Amount to Purchase",
    Flag = "ShopPurchaseEggsLimit",
    PlaceholderText = "Enter Amount..",
    Default = tostring(Configs.Shop.EggPurchaseAmount),
    Depends = {
        ["ShopPurchaseEggs"] = true,
    },
    Callback = function(value)
        local limit = tonumber(value)
        Configs.Shop.EggPurchaseAmount = limit
    end,
})

Subsections.Cosmetics:Toggle({
    Name = "Purchase Cosmetics",
    Flag = "ShopPurchaseCosmetics",
    Default = Configs.Shop.AutoPurchaseCosmetics,
    Callback = function(value)
        Configs.Shop.AutoPurchaseCosmetics = value
        if (value) then
            if (not Features.Connections.AutoPurchaseCosmeticsConnection) then
                Features.Connections.AutoPurchaseCosmeticsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Shop:AutoPurchaseCosmetics()
                end))
            end
        else
            if (Features.Connections.AutoPurchaseCosmeticsConnection) then
                Features.Connections.AutoPurchaseCosmeticsConnection:Disconnect()
                Features.Connections.AutoPurchaseCosmeticsConnection = nil
            end
        end
    end,
})

Subsections.Cosmetics:Dropdown({
    Name = "Cosmetics",
    Flag = "ShopPurchaseCosmeticsList",
    Options = Configs.Shop.CosmeticPurchaseSelection,
    Default = Configs.Shop.SelectedPurchaseCosmetics,
    Max = 99,
    Depends = {
        ["ShopPurchaseCosmetics"] = true,
    },
    Callback = function(value)
        Configs.Shop.SelectedPurchaseCosmetics = value
    end,
})

Subsections.Cosmetics:Textbox({
    Name = "Amount to Purchase",
    Flag = "ShopPurchaseCosmeticsLimit",
    PlaceholderText = "Enter Amount..",
    Default = tostring(Configs.Shop.CosmeticPurchaseAmount),
    Depends = {
        ["ShopPurchaseCosmetics"] = true,
    },
    Callback = function(value)
        local limit = tonumber(value)
        Configs.Shop.CosmeticPurchaseAmount = limit
    end,
})

local pets = Utils:GetActivePets()
Configs.Main.PetList = pets

Subsections.Freeze:Toggle({
    Name = "Freeze Pets",
    Flag = "PetFreeze",
    Default = Configs.Main.FreezePets,
    Callback = function(value)
        Configs.Main.FreezePets = value
        if (value) then
            if (not Features.Connections.FreezePetsConnection) then
                Features.Connections.FreezePetsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Main:FreezePets()
                end))
            end
        else
            if (Features.Connections.FreezePetsConnection) then
                Features.Connections.FreezePetsConnection:Disconnect()
                Features.Connections.FreezePetsConnection = nil
            end
        end
    end,
})

local Petlist = Subsections.Freeze:List({
    Name = "Select Pets",
    Flag = "PetFreezeList",
    Options = Configs.Main.PetList,
    Default = Configs.Main.SelectedPets,
    Max = 99,
    Callback = function(value)
        Configs.Main.SelectedPets = value
    end,
})

Subsections.Freeze:Button({
    Name = "Refresh List",
    Callback = function()
        local pets = Utils:GetActivePets()
        Configs.Main.PetList = pets
        Petlist:Refresh(pets)
        local validSelections = {}
        for _, selected in ipairs(Configs.Main.SelectedPets or {}) do
            if (table.find(pets, selected)) then
                table.insert(validSelections, selected)
            end
        end
        Configs.Main.SelectedPets = validSelections
    end,
})

Subsections.Feed:Toggle({
    Name = "Auto-Feed",
    Flag = "FeedAutoFeed",
    Default = Configs.Pets.AutoFeed,
    Callback = function(value)
        Configs.Pets.AutoFeed = value
        if (value) then
            if (not Features.Connections.AutoFeedConnection) then
                Features.Connections.AutoFeedConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Main:FeedPets()
                end))
            end
        else
            if (Features.Connections.AutoFeedConnection) then
                Features.Connections.AutoFeedConnection:Disconnect()
                Features.Connections.AutoFeedConnection = nil
            end
        end
    end,
})

local FeedPetList = Subsections.Feed:List({
    Name = "Select Pets",
    Flag = "FeedPetList",
    Options = Configs.Pets.FeedPetList,
    Default = Configs.Pets.SelectedFeedPet,
    Max = 99,
    Depends = {
        ["FeedAutoFeed"] = true,
    },
    Callback = function(value)
        Configs.Pets.SelectedFeedPet = value
    end,
})

Subsections.Feed:Dropdown({
    Name = "Allow Mutations",
    Flag = "FeedAllowMutationsList",
    Options = Configs.Pets.AllowMutationsList,
    Default = Configs.Pets.SelectedAllowMutations,
    Max = 99,
    Depends = {
        ["FeedAutoFeed"] = true,
    },
    Callback = function(value)
        Configs.Pets.SelectedAllowMutations = value
    end,
})

Subsections.Feed:Textbox({
    Name = "Feed At Hunger",
    Flag = "FeedAtHunger",
    PlaceholderText = "Enter Hunger..",
    Default = tostring(Configs.Pets.FeedAtHunger),
    Depends = {
        ["FeedAutoFeed"] = true,
    },
    Callback = function(value)
        local hunger = tonumber(value)
        if (hunger and hunger >= 0 and hunger <= 100) then
            Configs.Pets.FeedAtHunger = hunger
        end
    end,
})

Subsections.Feed:Textbox({
    Name = "Feed Till Hunger",
    Flag = "FeedTillHunger",
    PlaceholderText = "Enter Hunger..",
    Default = tostring(Configs.Pets.FeedTillHunger),
    Depends = {
        ["FeedAutoFeed"] = true,
    },
    Callback = function(value)
        local hunger = tonumber(value)
        if (hunger and hunger >= 0 and hunger <= 100) then
            Configs.Pets.FeedTillHunger = hunger
        end
    end,
})

Subsections.Hatch:Toggle({
    Name = "Auto-Hatch",
    Flag = "HatchAutoHatch",
    Default = Configs.Pets.AutoHatchEggs,
    Callback = function(value)
        Configs.Pets.AutoHatchEggs = value
        if (value) then
            if (not Features.Connections.AutoHatchConnection) then
                Features.Connections.AutoHatchConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Pets:AutoHatch()
                end))
            end
        else
            if (Features.Connections.AutoHatchConnection) then
                Features.Connections.AutoHatchConnection:Disconnect()
                Features.Connections.AutoHatchConnection = nil
            end
        end
    end,
})

Subsections.Hatch:Toggle({
    Name = "Auto-Place",
    Flag = "HatchAutoPlace",
    Default = Configs.Pets.AutoPlaceEggs,
    Callback = function(value)
        Configs.Pets.AutoPlaceEggs = value
        if (value) then
            if (not Features.Connections.AutoPlaceEggsConnection) then
                Features.Connections.AutoPlaceEggsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Pets:AutoPlaceEggs()
                end))
            end
        else
            if (Features.Connections.AutoPlaceEggsConnection) then
                Features.Connections.AutoPlaceEggsConnection:Disconnect()
                Features.Connections.AutoPlaceEggsConnection = nil
            end
        end
    end,
})

Subsections.Hatch:Dropdown({
    Name = "Place Eggs",
    Flag = "HatchEggsList",
    Options = Configs.Pets.AutoPlaceEggsOptions,
    Default = Configs.Pets.SelectedAutoPlaceEggs,
    Max = 99,
    Depends = {
        ["HatchAutoPlace"] = true,
    },
    Callback = function(value)
        Configs.Pets.SelectedAutoPlaceEggs = value
    end,
})

Subsections.SellPets:Toggle({
    Name = "Auto-Sell Pets",
    Flag = "SellPetsAutoSell",
    Default = Configs.Pets.SellPets,
    Callback = function(value)
        Configs.Pets.SellPets = value
        if (value) then
            if (not Features.Connections.AutoSellPetsConnection) then
                Features.Connections.AutoSellPetsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Pets:AutoSellPets()
                end))
            end
        else
            if (Features.Connections.AutoSellPetsConnection) then
                Features.Connections.AutoSellPetsConnection:Disconnect()
                Features.Connections.AutoSellPetsConnection = nil
            end
        end
    end,
})

Subsections.SellPets:Dropdown({
    Name = "Sell Options",
    Flag = "SellPetsOptions",
    Options = Configs.Pets.SellPetsOptions,
    Default = Configs.Pets.SelectedSellPetsOptions,
    Max = 99,
    Depends = {
        ["SellPetsAutoSell"] = true,
    },
    Callback = function(value)
        Configs.Pets.SelectedSellPetsOptions = value
    end,
})

Subsections.SellPets:Dropdown({
    Name = "Rarity",
    Flag = "SellPetsRarity",
    Options = Configs.Pets.SellPetsRarities,
    Default = Configs.Pets.SelectedSellPetsRarities,
    Max = 99,
    Depends = {
        ["SellPetsAutoSell"] = true,
        ["SellPetsOptions"] = {
            contains = {"Rarity"}
        },
    },
    Callback = function(value)
        Configs.Pets.SelectedSellPetsRarities = value
    end,
})

Subsections.SellPets:Textbox({
    Name = "Weight Limit",
    Flag = "SellPetsWeightLimit",
    PlaceholderText = "Enter weight limit..",
    Default = tostring(Configs.Pets.SellPetsWeight),
    Depends = {
        ["SellPetsAutoSell"] = true,
        ["SellPetsOptions"] = {
            contains = {"Weight"}
        },
    },
    Callback = function(value)
        local weightLimit = tonumber(value)
        if (weightLimit and weightLimit >= 0) then
            Configs.Pets.SellPetsWeight = weightLimit
        end
    end,
})

Subsections.SellPets:Textbox({
    Name = "Age Limit",
    Flag = "SellPetsAgeLimit",
    PlaceholderText = "Enter age limit..",
    Default = tostring(Configs.Pets.SellPetsAge),
    Depends = {
        ["SellPetsAutoSell"] = true,
        ["SellPetsOptions"] = {
            contains = {"Age"}
        },
    },
    Callback = function(value)
        local ageLimit = tonumber(value)
        if (ageLimit and ageLimit >= 0) then
            Configs.Pets.SellPetsAge = ageLimit
        end
    end,
})

-- Plot
Subsections.Movable:Toggle({
    Name = "Auto Move Fruits",
    Flag = "PlotMoveFruits",
    Default = Configs.Plot.MoveFruits,
    Callback = function(value)
        Configs.Plot.MoveFruits = value
        if (value) then
            if (not Features.Connections.MoveFruitsConnection) then
                Features.Connections.MoveFruitsConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Plot:MoveFruits()
                end))
            end
        else
            if (Features.Connections.MoveFruitsConnection) then
                Features.Connections.MoveFruitsConnection:Disconnect()
                Features.Connections.MoveFruitsConnection = nil
            end
        end
    end,
})

local movables = Subsections.Movable:Dropdown({
    Name = "Movable Plants",
    Flag = "PlotMovableList", 
    Options = Configs.Plot.MovableFruits,
    Default = Configs.Plot.SelectedMovableFruits,
    Max = 99,
    Depends = {
        ["PlotMoveFruits"] = true,
    },
    Callback = function(value)
        Configs.Plot.SelectedMovableFruits = value
    end,
})

Subsections.Movable:Dropdown({
    Name = "Move Plants Mode",
    Flag = "PlotMoveFruitsMode",
    Options = Configs.Plot.MoveFruitsMode,
    Default = Configs.Plot.SelectedMoveFruitsMode,
    Max = 99,
    Multiple = true,
    Depends = {
        ["PlotMoveFruits"] = true,
    },
    Callback = function(value)
        Configs.Plot.SelectedMoveFruitsMode = value
    end,
})


Subsections.Destructible:Toggle({
    Name = "Auto Destroy",
    Flag = "PlotAutoDestroy",
    Default = Configs.Plot.AutoDestroy,
    Callback = function(value)
        Configs.Plot.AutoDestroy = value
        if (value) then
            if (not Features.Connections.AutoDestroyConnection) then
                Features.Connections.AutoDestroyConnection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
                    Features.Plot:AutoDestroy()
                end))
            end
        else
            if (Features.Connections.AutoDestroyConnection) then
                Features.Connections.AutoDestroyConnection:Disconnect()
                Features.Connections.AutoDestroyConnection = nil
            end
        end
    end,
})

local destructibles = Subsections.Destructible:Dropdown({
    Name = "Removable Plants", 
    Flag = "PlotDestructibleList",
    Options = Configs.Plot.Removables,
    Default = Configs.Plot.SelectedRemovables,
    Max = 99,
    Depends = {
        ["PlotAutoDestroy"] = true,
    },
    Callback = function(value)
        Configs.Plot.SelectedRemovables = value
    end,
})


--[[
Sections.Trading:Toggle({
    Name = "Auto-Trade",
    Flag = "TradingAutoTrade",
    Default = Configs.Trading.AutoTrade,
    Callback = function(value)
        Configs.Trading.AutoTrade = value
    end,
})

local tradeplayerlist = Sections.Trading:Dropdown({
    Name = "Trade Player",
    Flag = "TradingPlayerList",
    Options = Configs.Trading.TradePlayerlist,
    Default = Configs.Trading.SelectedTradePlayer,
    Depends = {
        ["TradingAutoTrade"] = true,
    },
    Callback = function(value)
        Configs.Trading.SelectedTradePlayer = value
    end,
})

Sections.Settings:Toggle({
    Name = "Auto-Accept Trades",
    Flag = "TradingAutoAcceptTrades",
    Default = Configs.Trading.AutoAcceptTrades,
    Callback = function(value)
        Configs.Trading.AutoAcceptTrades = value
    end,
})
]]



local Runtime = 
{
    Cooldowns =
    {
        LastCheckedPlayerlist = 0,
        PlayerlistCheckInterval = 5,
        LastCheckedActivePets = 0,
        ActivePetsCheckInterval = 3,
        LastCheckedDestructibles = 0,
        DestructiblesCheckInterval = 3,
        LastCheckedMovables = 0,
        MovablesCheckInterval = 3,
    },

    Cache =
    {
        LastPlayerList = {},
        LastActivePets = {},
        LastDestructibles = {},
        LastMovables = {},
    },

    UpdatePlayerlist = function(self)
        if (tick() - self.Cooldowns.LastCheckedPlayerlist < self.Cooldowns.PlayerlistCheckInterval) then
            return
        end

        self.Cooldowns.LastCheckedPlayerlist = tick()
        local playerlist = {}
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            --if (player.Name ~= Players.LocalPlayer.Name) then
                table.insert(playerlist, player.Name)
           -- end
        end


        if (#playerlist ~= #self.Cache.LastPlayerList) then
            self.Cache.LastPlayerList = playerlist
            tradeplayerlist:Refresh(playerlist)
        end
    end,

    UpdateActivePets = function(self)
        if (tick() - self.Cooldowns.LastCheckedActivePets < self.Cooldowns.ActivePetsCheckInterval) then
            return
        end

        self.Cooldowns.LastCheckedActivePets = tick()
        local activePets = {}
        for _, pet in pairs(Utils:GetActivePets()) do
            table.insert(activePets, pet)
        end

        if (#activePets ~= #self.Cache.LastActivePets) then
            self.Cache.LastActivePets = activePets
            Petlist:Refresh(activePets)
            FeedPetList:Refresh(activePets)
        end
    end,

    UpdateDestructibles = function(self)
        if (tick() - self.Cooldowns.LastCheckedDestructibles < self.Cooldowns.DestructiblesCheckInterval) then
            return
        end
        
        local garden = Utils:ReturnGarden()
        local destructibleList = {}
        for i,v in pairs(garden.Important.Plants_Physical:GetChildren()) do
            if (v:IsA("Model") and not Utils:Contains(destructibleList, v.Name)) then
                table.insert(destructibleList, v.Name)
            end
        end

        if (#destructibleList ~= #self.Cache.LastDestructibles) then
            self.Cache.LastDestructibles = destructibleList
            Configs.Plot.Removables = destructibleList
            destructibles:Refresh(destructibleList)
        end
    end,

    UpdateMovables = function(self)
        if (tick() - self.Cooldowns.LastCheckedMovables < self.Cooldowns.MovablesCheckInterval) then
            return
        end
        
        local garden = Utils:ReturnGarden()
        local movableList = {}
        for i,v in pairs(garden.Important.Plants_Physical:GetChildren()) do
            if (v:IsA("Model") and not Utils:Contains(movableList, v.Name)) then
                table.insert(movableList, v.Name)
            end
        end
        
        if (#movableList ~= #self.Cache.LastMovables) then
            self.Cache.LastMovables = movableList
            Configs.Plot.MovableFruits = movableList
            movables:Refresh(movableList)
        end
    end,

    Initialize = function(self)
        --self:UpdatePlayerlist()
        self:UpdateActivePets()
        self:UpdateDestructibles()
        self:UpdateMovables()
    end,
}

RunService.Heartbeat:Connect(function()
    Runtime:Initialize()
end)


local ConfigsModule = 
{
    Cache = 
    {
        Configs = {"Default"},
        SelectedAction = "Save",
        SelectedConfig = nil,
        TextboxInput = "",
    },

    GetConfigurations = function(self)
        self.Cache.Configs = {}
        for _, file in pairs(listfiles(Storage.ConfigsPath)) do
            if (file:match("%.json$")) then
                local configName = file:match("([^/\\]+)%.json$")
                if (configName) then
                    table.insert(self.Cache.Configs, configName)
                end
            end
        end

        if (#self.Cache.Configs == 0) then
            table.insert(self.Cache.Configs, "Default")
        end
    end,

    ValidateConfigName = function(self, name)
        if (not name or name == "") then
            return false, "Config name cannot be empty"
        end
        
        local cleanName = name:gsub("[^%w_]", ""):gsub("%s+", "")
        
        if (cleanName == "") then
            return false, "Config name must contain valid characters"
        end
        
        if (#cleanName > 50) then
            return false, "Config name too long (max 50 characters)"
        end
        
        return true, cleanName
    end,

    ConfigExists = function(self, configName)
        local filePath = Storage.ConfigsPath .. "/" .. configName .. ".json"
        return isfile(filePath)
    end,

    SaveConfiguration = function(self, configName)
        local isValid, result = self:ValidateConfigName(configName)
        if (not isValid) then
            return false, result
        end
        
        local cleanName = result
        local content = Library:GetConfig()
        local filePath = Storage.ConfigsPath .. "/" .. cleanName .. ".json"
        
        local message = ""
        if (self:ConfigExists(cleanName)) then
            message = "Config '" .. cleanName .. "' overwritten successfully"
        else
            message = "Config '" .. cleanName .. "' saved successfully"
        end
        
        writefile(filePath, content)
        self:GetConfigurations()
        return true, message
    end,

    LoadConfiguration = function(self, configName)
        if (not configName or configName == "") then
            return false, "No config selected"
        end
        
        local filePath = Storage.ConfigsPath .. "/" .. configName .. ".json"
        if (isfile(filePath)) then
            local content = readfile(filePath)
            if (content) then
                Library:LoadConfig(content)
                return true, "Config '" .. configName .. "' loaded successfully"
            end
        end
        return false, "Failed to load config '" .. configName .. "'"
    end,

    DeleteConfiguration = function(self, configName)
        if (not configName or configName == "") then
            return false, "No config selected"
        end
        
        if (configName == "Default") then
            return false, "Cannot delete Default config"
        end
        
        local filePath = Storage.ConfigsPath .. "/" .. configName .. ".json"
        if (isfile(filePath)) then
            delfile(filePath)
            self:GetConfigurations()
            return true, "Config '" .. configName .. "' deleted successfully"
        end
        return false, "Config '" .. configName .. "' not found"
    end,

    ExecuteAction = function(self)
        local success, message = false, ""
        
        if (self.Cache.SelectedAction == "Save") then
            local configName
            
            -- If there's a selected config, override it without needing textbox input
            if (self.Cache.SelectedConfig and self.Cache.SelectedConfig ~= "") then
                configName = self.Cache.SelectedConfig
                success, message = self:SaveConfiguration(configName)
            else
                -- Fall back to textbox input for new configs
                configName = self.Cache.TextboxInput
                if (not configName or configName == "") then
                    message = "Please select a config to override or enter a new config name"
                else
                    success, message = self:SaveConfiguration(configName)
                end
            end
        elseif (self.Cache.SelectedAction == "Create") then
            local configName = self.Cache.TextboxInput
            if (not configName or configName == "") then
                message = "Please enter a new config name"
            else
                success, message = self:SaveConfiguration(configName)
            end
        elseif (self.Cache.SelectedAction == "Load") then
            if (not self.Cache.SelectedConfig) then
                message = "Please select a config to load"
            else
                success, message = self:LoadConfiguration(self.Cache.SelectedConfig)
            end
        elseif (self.Cache.SelectedAction == "Delete") then
            if (not self.Cache.SelectedConfig) then
                message = "Please select a config to delete"
            else
                success, message = self:DeleteConfiguration(self.Cache.SelectedConfig)
            end
        end
        
        print(message)
        return success, message
    end,
}

ConfigsModule:GetConfigurations()

Sections.Configs:Textbox({
    Name = "Name",
    Flag = "ConfigsName",
    PlaceholderText = "Enter config name..",
    Callback = function(value)
        ConfigsModule.Cache.TextboxInput = value
    end,
})

local configlist = Sections.Configs:List({
    Name = "Configurations:",
    Flag = "ConfigsList",
    Options = ConfigsModule.Cache.Configs,
    MinHeight = 80,
    Callback = function(value)
        ConfigsModule.Cache.SelectedConfig = value
    end,
})

Sections.Configs:Dropdown({
    Name = "Actions",
    Flag = "ConfigsActions",
    Options = {"Save", "Load", "Delete", "Create"},
    Searchable = true,
    Default = "Save",
    Callback = function(value)
        ConfigsModule.Cache.SelectedAction = value
    end,
})

Sections.Configs:Button({
    Name = "Confirm",
    Callback = function()
        ConfigsModule:ExecuteAction()
        configlist:Refresh(ConfigsModule.Cache.Configs)
    end,
})

local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
    if (not checkcaller() and key == "CFrame" and Exploits.AntiAim.Settings.Desync) then
        if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            if (LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0) then
                if (self == LocalPlayer.Character.HumanoidRootPart) then
                    return Exploits.AntiAim.Settings.CFrame or CFrame.new()
                end
            end
        end
    end
    return oldIndex(self, key)
end)

RunService.Heartbeat:Connect(function()
    Runtime:UpdateDestructibles()
    Runtime:UpdateMovables()
    Exploits.AntiAim:desyncLoop()
end)

LocalPlayer.CharacterAdded:Connect(function()
    Exploits.AntiAim:updateCharacter()
end)
