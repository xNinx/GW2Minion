ml_global_information = { }
ml_global_information.Path = GetStartupPath()
ml_global_information.Now = 0
ml_global_information.Lasttick = 0
ml_global_information.Running = false
ml_global_information.BotModes = {}
ml_global_information.LastGameState = 0

ml_global_information.WorldMarkerType = 24 -- enum for "in current map", changes on larger patches sometimes

-- Global vars which are used very often and we can just reduce the hammering by getting them once per frame here
function ml_global_information.OnUpdate()
	
	if ( Player ~= nil ) then
		if (mc_skillmanager) then ml_global_information.AttackRange = mc_skillmanager.GetAttackRange() end
				
		ml_global_information.Player_Health = Player.health or { current = 0, max = 0, percent = 0 }
		ml_global_information.Player_Power = Player.power or 0
		ml_global_information.Player_Endurance = Player.endurance or 0		
		ml_global_information.Player_InCombat = Player.inCombat or false	
		ml_global_information.Player_Position = Player.pos
		ml_global_information.Player_Level = Player.level
		ml_global_information.Player_OnMesh = Player.onmesh or false
		ml_global_information.CurrentMapID = Player:GetLocalMapID() or 0
		if ( gw2_datamanager and ml_global_information.CurrentMapID ~= 0) then  
			ml_global_information.CurrentMapName = gw2_datamanager.GetMapName( ml_global_information.CurrentMapID ) 
		else
			ml_global_information.CurrentMapName = ""
		end
		
		-- Update Debug fields	
		dAttackRange = ml_global_information.AttackRange or 120
	end
end

ml_global_information.ServersUS = {		
	{id=1010,name="Ehmry Bay"},
	{id=1018,name="Northern Shiverpeaks"},
	{id=1002,name="Borlis Pass"},
	{id=1008,name="Jade Quarry"},
	{id=1005,name="Maguuma"},
	{id=1015,name="Isle of Janthir"},
	{id=1009,name="Fort Aspenwood"},
	{id=1013,name="Sanctum of Rall"},
	{id=1007,name="Gate of Madness"},
	{id=1006,name="Sorrow's Furnace"},
	{id=1019,name="Blackgate"},
	{id=1021,name="Dragonbrand"},
	{id=1012,name="Darkhaven"},
	{id=1003,name="Yak's Bend"},
	{id=1014,name="Crystal Desert"},
	{id=1001,name="Anvil Rock"},
	{id=1011,name="Stormbluff Isle"},
	{id=1020,name="Ferguson's Crossing"},
	{id=1016,name="Sea of Sorrows"},
	{id=1022,name="Kaineng"},
	{id=1023,name="Devona's Rest"},
	{id=1017,name="Tarnished Coast"},
	{id=1024,name="Eredon Terrace"},
	{id=1004,name="Henge of Denravi"}
	}	
ml_global_information.ServersEU = {
	{id=2012,name="Piken Square"},
	{id=2003,name="Gandara"},
	{id=2007,name="Far Shiverpeaks"},
	{id=2204,name="Abaddon's Mouth [DE]"},
	{id=2201,name="Kodash [DE]"},
	{id=2010,name="Seafarer's Rest"},
	{id=2301,name="Baruch Bay [SP]"},
	{id=2205,name="Drakkar Lake [DE]"},
	{id=2002,name="Desolation"},
	{id=2202,name="Riverside [DE]"},
	{id=2008,name="Whiteside Ridge"},
	{id=2203,name="Elona Reach [DE]"},
	{id=2206,name="Miller's Sound [DE]"},
	{id=2004,name="Blacktide"},
	{id=2207,name="Dzagonur [DE]"},
	{id=2105,name="Arborstone [FR]"},
	{id=2101,name="Jade Sea [FR]"},
	{id=2013,name="Aurora Glade"},
	{id=2103,name="Augury Rock [FR]"},
	{id=2102,name="Fort Ranik [FR]"},
	{id=2104,name="Vizunah Square [FR]"},
	{id=2009,name="Ruins of Surmia"},
	{id=2014,name="Gunnar's Hold"},
	{id=2005,name="Ring of Fire"},
	{id=2006,name="Underworld"},
	{id=2011,name="Vabbi"},
	{id=2001,name="Fissure of Woe"}
}

-- Draw Marker function
function ml_global_information.DrawMarker( marker )
	local markertype = marker:GetType()
	local pos = marker:GetPosition()

    local color = 0
    local s = 25
    local h = 150
	
    if ( markertype == GetString("grindMarker") ) then
        color = 1 -- red
    elseif ( markertype == GetString("miningMarker") ) then 
        color = 4 --blue
    elseif ( markertype == GetString("fishingMarker") ) then
        color = 7 -- yellow	
    elseif ( markertype == GetString("vendorMarker") ) then
        color = 8 -- orange
    end
    --Building the vertices for the object
    local t = { 
        [1] = { pos.x-s, pos.y+s, pos.z-s-h, color },
        [2] = { pos.x+s, pos.y+s, pos.z-s-h, color  },	
        [3] = { pos.x,   pos.y-s,   pos.z-h, color  },
        
        [4] = { pos.x+s, pos.y+s, pos.z-s-h, color },
        [5] = { pos.x+s, pos.y+s, pos.z+s-h, color  },	
        [6] = { pos.x,   pos.y-s,   pos.z-h, color  },
        
        [7] = { pos.x+s, pos.y+s, pos.z+s-h, color },
        [8] = { pos.x-s, pos.y+s, pos.z+s-h, color  },	
        [9] = { pos.x,   pos.y-s,   pos.z-h, color  },
        
        [10] = { pos.x-s, pos.y+s, pos.z+s-h, color },
        [11] = { pos.x-s, pos.y+s, pos.z-s-h, color  },	
        [12] = { pos.x,   pos.y-s,   pos.z-h, color  },
    }
    local id = RenderManager:AddObject(t)
    return id
end















