gw2minion = {}
gw2minion.btreecontext = {}

function gw2minion.Init()
	-- Register Button 
	local gw2mainmenu = {
		header = { id = "GW2MINION##MENU_HEADER", expanded = false, name = "GW2Minion", texture = GetStartupPath().."\\GUI\\UI_Textures\\gw2minion.png"},
		members = {{ id = "GW2MINION##MENU_ADDONS", name = "Addons", tooltip = "Installed Lua Addons.", texture = GetStartupPath().."\\GUI\\UI_Textures\\addon.png"}	}
	} 
	ml_gui.ui_mgr:AddComponent(gw2mainmenu)
	
	-- Setup GuestServerList
	gw2minion.RefreshGuestServers()	
	
	-- setup meshmanager
	if ( ml_mesh_mgr ) then 
		ml_mesh_mgr.GetMapID = function () return Player:GetLocalMapID() end
		ml_mesh_mgr.GetMapName = function () return ml_global_information.CurrentMapName end
		ml_mesh_mgr.GetPlayerPos = function () return Player.pos end

		-- Set worldnavigation data
		ml_mesh_mgr.navData = persistence.load(GetLuaModsPath()..[[GW2Minion\]].."worldnav_data.lua")
		if ( not table.valid(ml_mesh_mgr.navData)) then 
			ml_mesh_mgr.navData = {} 
		else
			ml_mesh_mgr.SetupNavNodes()
		end
		
		-- Set default meshes SetDefaultMesh(mapid, filename)
		ml_mesh_mgr.SetDefaultMesh(15,"Queensdale")
		ml_mesh_mgr.SetDefaultMesh(17,"Harathi Hinterlands")
		ml_mesh_mgr.SetDefaultMesh(19,"PlainsOfAshford")
		ml_mesh_mgr.SetDefaultMesh(20,"Blazeridge Steppes")
		ml_mesh_mgr.SetDefaultMesh(21,"Fields of Ruin")
		ml_mesh_mgr.SetDefaultMesh(22,"FireHeartRise")		
		ml_mesh_mgr.SetDefaultMesh(23,"Kessex Hills")		
		ml_mesh_mgr.SetDefaultMesh(24,"Gendarran Fields")
		ml_mesh_mgr.SetDefaultMesh(25,"IronMarches")
		ml_mesh_mgr.SetDefaultMesh(26,"Dredgehaunt Cliffs")
		ml_mesh_mgr.SetDefaultMesh(27,"LonarsPass")
		ml_mesh_mgr.SetDefaultMesh(28,"Wayfarer Foothills")		
		ml_mesh_mgr.SetDefaultMesh(29,"TimberlineFalls")
		ml_mesh_mgr.SetDefaultMesh(30,"FrostGorge Sound")
		ml_mesh_mgr.SetDefaultMesh(31,"Snowden Drifts")		
		ml_mesh_mgr.SetDefaultMesh(32,"DiessaPlateau")
		ml_mesh_mgr.SetDefaultMesh(34,"Caledon Forest")
		ml_mesh_mgr.SetDefaultMesh(35,"MetricaProvince")
		ml_mesh_mgr.SetDefaultMesh(39,"MountMaelstrom")
		
		ml_mesh_mgr.SetDefaultMesh(51,"Straits of Devastation")
		ml_mesh_mgr.SetDefaultMesh(53,"Sparkfly Fen")
		ml_mesh_mgr.SetDefaultMesh(54,"Brisban Wildlands")
		
		ml_mesh_mgr.SetDefaultMesh(62,"CursedShore")
		ml_mesh_mgr.SetDefaultMesh(65,"Malchors Leap")
		ml_mesh_mgr.SetDefaultMesh(73,"BloodtideCoast")
		
		-- Lions Arch
		ml_mesh_mgr.SetDefaultMesh(50,"Lions Arch")
		-- Black Citadel
		ml_mesh_mgr.SetDefaultMesh(218,"Black Citadel")
		ml_mesh_mgr.SetDefaultMesh(371,"Heros Canton")
		ml_mesh_mgr.SetDefaultMesh(833,"Ash Tribune Quarters")
		ml_mesh_mgr.SetDefaultMesh(460,"Citadel Stockade")
		ml_mesh_mgr.SetDefaultMesh(372,"Blood Tribune Quarters")
		ml_mesh_mgr.SetDefaultMesh(373,"The Command Core")
		-- Divitnity's Reach
		ml_mesh_mgr.SetDefaultMesh(18,"Divinitys Reach")
		ml_mesh_mgr.SetDefaultMesh(378,"Queens Throne Room")
		ml_mesh_mgr.SetDefaultMesh(248,"Salma District (Home)")
		ml_mesh_mgr.SetDefaultMesh(914,"The Dead End")
		ml_mesh_mgr.SetDefaultMesh(330,"Seraph Headquarters")
		-- Hoelbrak
		ml_mesh_mgr.SetDefaultMesh(326,"Hoelbrak")
		ml_mesh_mgr.SetDefaultMesh(374,"Knut Whitebears Loft")
		ml_mesh_mgr.SetDefaultMesh(375,"Hunters Hearth (Home)")
		ml_mesh_mgr.SetDefaultMesh(376,"Stonewrights Steading")
		-- Rata Sum
		ml_mesh_mgr.SetDefaultMesh(139,"Rata Sum")
		ml_mesh_mgr.SetDefaultMesh(650,"Applied Development Lab (Home)")
		ml_mesh_mgr.SetDefaultMesh(651,"Council Level")
		ml_mesh_mgr.SetDefaultMesh(649,"Snaff Memorial Lab")
		-- The Grove
		ml_mesh_mgr.SetDefaultMesh(91,"The Grove")
		ml_mesh_mgr.SetDefaultMesh(647,"Dreamers Terrace (Home)")
		ml_mesh_mgr.SetDefaultMesh(646,"The House of Caithe")
		ml_mesh_mgr.SetDefaultMesh(648,"The Omphalos Chamber")
				
		ml_mesh_mgr.SetDefaultMesh(350,"Heart of the Mists")
		ml_mesh_mgr.SetDefaultMesh(873,"Southsun Cove")
		ml_mesh_mgr.SetDefaultMesh(968,"EdgeOfTheMist")
		
		--LS2
		ml_mesh_mgr.SetDefaultMesh(988,"Dry Top")
		ml_mesh_mgr.SetDefaultMesh(1015,"SilverWastes")
		
		--HoT
		ml_mesh_mgr.SetDefaultMesh(1052,"Verdant Brink")
		ml_mesh_mgr.SetDefaultMesh(1043,"Auric Basin")
		ml_mesh_mgr.SetDefaultMesh(1041,"DragonStand")
		ml_mesh_mgr.SetDefaultMesh(1045,"TangledDepths")
		ml_mesh_mgr.SetDefaultMesh(1155,"Lions Arch Aerodrome")
		
		--LS3
		ml_mesh_mgr.SetDefaultMesh(1165,"Bloodstone Fen")
		ml_mesh_mgr.SetDefaultMesh(1175,"Ember Bay")
		ml_mesh_mgr.SetDefaultMesh(1178,"BitterfrostFrontier")
		ml_mesh_mgr.SetDefaultMesh(1185,"Lake Doric")
		ml_mesh_mgr.SetDefaultMesh(1195,"Draconis Mons")
		ml_mesh_mgr.SetDefaultMesh(1203,"Sirens Landing")

		--sPVP
		ml_mesh_mgr.SetDefaultMesh(549,"sPvP Battle of Kyhlo")
		ml_mesh_mgr.SetDefaultMesh(554,"sPvP Forest of Niflhel")
		ml_mesh_mgr.SetDefaultMesh(795,"sPvP Legacy of the Foefire")	
		ml_mesh_mgr.SetDefaultMesh(875,"sPvP Temple of the Silent Storm")		
		ml_mesh_mgr.SetDefaultMesh(894,"sPvP Spirit Watch")
		ml_mesh_mgr.SetDefaultMesh(900,"sPvP Skyhammer")
		ml_mesh_mgr.SetDefaultMesh(984,"sPvP Courtyard")
		ml_mesh_mgr.SetDefaultMesh(1011,"sPvP Battle of Champions")
		ml_mesh_mgr.SetDefaultMesh(1163,"sPvP Revenge of the Capricorn")		
		ml_mesh_mgr.SetDefaultMesh(1171,"sPvp Coloseum")
		
		--PoF
		ml_mesh_mgr.SetDefaultMesh(1210,"Crystal Oasis")
		ml_mesh_mgr.SetDefaultMesh(1228,"Elon Riverlands")
		ml_mesh_mgr.SetDefaultMesh(1211,"Desert Highlands")
		ml_mesh_mgr.SetDefaultMesh(1226,"The Desolation")
		
		
		--Instances
		ml_mesh_mgr.SetDefaultMesh(896,"North Noland Hatchery") -- Diessa Plateau
		ml_mesh_mgr.SetDefaultMesh(866,"Mad Kings Labyrinth")
		ml_mesh_mgr.SetDefaultMesh(881,"BellChoir")
				
	end
	
end
RegisterEventHandler("Module.Initalize",gw2minion.Init)

-- Get's called internally in ml_bt_mgr.lua by the :run() of the gw2minion.mainbtreeinstance. This draws UI code for ther internal GW2_Main btree here.
-- This is to add always the same "core" functions and UI elements to the Main Menu
function gw2minion.DrawMenuCode()
	gw2minion.mainbtreeinstance:drawMenuElements()
end

-- Is called when the BTree is started. Allows us to supply a custom context table to the BTree
function gw2minion.LoadContext()
	return gw2minion.btreecontext
end

-- Gets called by the BT-Manager, after changes on the BT were saved. I'm just reloading the tree from the file here.
function gw2minion.ReloadBTree()
	if ( FileExists(GetLuaModsPath()  .. "\\\GW2Minion\\\GW2_Main.bt")) then 
		
		local btreeinfo = {
			filename = "GW2_Main.bt",
			filepath = GetLuaModsPath()  .. "\\\GW2Minion",
			
			LoadContext = function() return gw2minion.LoadContext() end,	-- Is called when the BTree is started. Allows us to supply a custom context table.
			Reload = function() gw2minion.ReloadBTree() end,			-- Called when the BTree was changed and saved in the BT-Editor
			
			internal = true,	-- if set, it will not be listed in the BotMode dropdown box
			DrawMenuCode = function() gw2minion.DrawMenuCode() end,	-- Draws UI Elements into the Main Menu from our internal BTree which is running inside this file.
			
			--private = false, -- if set, it will be treated as a private addon, loadble from a .paf file.
			--LoadSubTree = function(filename) d("IMPLEMENT ME to load "..filename) end,	-- Required for private addons with additional private sub-behavior trees
		}				
		d("Loading GW2 Main.bt")
		gw2minion.mainbtreeinstance = BehaviorManager:LoadBehavior( btreeinfo )
		if ( not table.valid(gw2minion.mainbtreeinstance)) then
			ml_error("[GW2Minion] - Failed to load core behaviortree")
		end
	end
end

function gw2minion.LoadBehaviorFiles()
	-- Load all our local "bot/addon" BTree files 
	BehaviorManager:LoadBehaviorFromFolder(GetStartupPath()  .. "\\\LuaMods\\\GW2Minion\\\Behavior")

	--Load the "GW2 Main/Core tree" which is a local one and gets called from in here	
	gw2minion.ReloadBTree()
 end
RegisterEventHandler("RefreshBehaviorFiles", gw2minion.LoadBehaviorFiles)


function gw2minion.DrawCall(event, ticks )
	
	if ( BehaviorManager:Ready() == true ) then
		if ( gw2minion.mainbtreeinstance ) then
			-- Run the local behaviortree
			gw2minion.mainbtreeinstance:run(gw2minion.btreecontext)
		end
	end
	
	-- Autostart once on loading ingame
	if ( not gw2minion.startedonce and Settings.GW2Minion.autostartbot == true and not BehaviorManager:Running() and GetGameState() == GW2.GAMESTATE.GAMEPLAY and NavigationManager:GetNavMeshState() == GLOBAL.MESHSTATE.MESHREADY) then
		gw2minion.startedonce = true
		BehaviorManager:Start()
		d("[GW2Minion] - Automatically starting bot")
	end
end
RegisterEventHandler("Gameloop.Draw", gw2minion.DrawCall)


function gw2minion.RefreshGuestServers()
	ml_global_information.GuestServerList = { [0] = "None" }
	local homeserverid = GetHomeServer()	
	-- US Servers
	if ( homeserverid > 1000 and homeserverid < 2000 ) then
		ml_global_information.GuestServerList = {
			[0]="None",
			[1010]="Ehmry Bay",
			[1018]="Northern Shiverpeaks",
			[1002]="Borlis Pass",
			[1008]="Jade Quarry",
			[1005]="Maguuma",
			[1015]="Isle of Janthir",
			[1009]="Fort Aspenwood",
			[1013]="Sanctum of Rall",
			[1007]="Gate of Madness",
			[1006]="Sorrow's Furnace",
			[1019]="Blackgate",
			[1021]="Dragonbrand",
			[1012]="Darkhaven",
			[1003]="Yak's Bend",
			[1014]="Crystal Desert",
			[1001]="Anvil Rock",
			[1011]="Stormbluff Isle",
			[1020]="Ferguson's Crossing",
			[1016]="Sea of Sorrows",
			[1022]="Kaineng",
			[1023]="Devona's Rest",
			[1017]="Tarnished Coast",
			[1024]="Eredon Terrace",
			[1004]="Henge of Denravi",
		}	
	elseif ( homeserverid > 2000 and homeserverid < 3000 ) then
		-- EU Servers
		ml_global_information.GuestServerList = {
			[0]="None",
			[2012]="Piken Square",
			[2003]="Gandara",
			[2007]="Far Shiverpeaks",
			[2204]="Abaddon's Mouth [DE]",
			[2201]="Kodash [DE]",
			[2010]="Seafarer's Rest",
			[2301]="Baruch Bay [SP]",
			[2205]="Drakkar Lake [DE]",
			[2002]="Desolation",
			[2202]="Riverside [DE]",
			[2008]="Whiteside Ridge",
			[2203]="Elona Reach [DE]",
			[2206]="Miller's Sound [DE]",
			[2004]="Blacktide",
			[2207]="Dzagonur [DE]",
			[2105]="Arborstone [FR]",
			[2101]="Jade Sea [FR]",
			[2013]="Aurora Glade",
			[2103]="Augury Rock [FR]",
			[2102]="Fort Ranik [FR]",
			[2104]="Vizunah Square [FR]",
			[2009]="Ruins of Surmia",
			[2014]="Gunnar's Hold",
			[2005]="Ring of Fire",
			[2006]="Underworld",
			[2011]="Vabbi",
			[2001]="Fissure of Woe",
		}
	end
end
