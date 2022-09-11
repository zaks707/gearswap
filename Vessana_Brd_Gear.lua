function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','DualNaegling','DualTauret','DualNukeWeapons')

	gear.melee_jse_back = "Kayapa Cape"--{name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	gear.magic_jse_back = "Aput Mantle"--{name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Blurred Harp +1'
	--info.ExtraSongInstrument = 'Daurdabla'

	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')
	
	
	-- Lock Style
	windower.chat.input('/lockstyleset 012')
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	-- !!!Genmei Shield!!!
	--sets.weapons.Aeneas = {main="Aeneas",sub="Culminus"}
	--sets.weapons.DualWeapons = {main="Aeneas",sub="Blurred Knife +1"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Tauret"}
	sets.weapons.Naegling = {main="Naegling",sub="Culminus"}
	sets.weapons.DualTauret = {main="Tauret",sub="Kali"}
	sets.weapons.DualNukeWeapons = {main="Daybreak",sub="Tauret"}

    --sets.buff.Sublimation = {waist="Embla Sash"}
    --sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Kali",sub="Culminus",ammo="Impatiens",
		head="Fili Calot +1",--[[neck="Aoidos' Matinee",--]]ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +1",hands="Gendewitha Gages",ring1="Weather. Ring",ring2="Prolix Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +1"}--,feet="Telchine Pigaches"}
		
	sets.precast.FC.DT = sets.precast.FC --[[{main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}--]]

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Culminus"})
	
	sets.precast.FC.BardSong = {range="Blurred Harp +1"} --[[{main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Blurred Harp +1",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}--]]

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring",ring2="Chirich Ring+1",
		back=gear.melee_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}
		
	sets.precast.WS.Acc = sets.precast.WS --[[{ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring",ring2="Chirich Ring +1",
		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}--]]
		
	sets.precast.WS['Savage Blade'] = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Vehemence Ring",ring2="Shukuyu",
		back=gear.melee_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Kali",sub="Culminus",ammo="Hasty Pinion +1",
		head="Fili Calot +1",--[[neck="Aoidos' Matinee",--]]ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +1",hands="Gendewitha Gages",ring1="Weather. Ring",ring2="Prolix Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +1"}--,feet="Telchine Pigaches"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Marsyas",hands="Brioso Cuffs +1"}
	sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Culminus",range="Blurred Harp +1",ammo=empty,
		head="Fili Calot +1",neck="Moonbow Whistle",
		--neck="Mnbw. Whistle +1",
		ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Fili Hongreline +1",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.magic_jse_back,waist="Eschan Stone",legs="Inyanga Shalwar",feet="Brioso Slippers +1"}
		
	sets.midcast.SongEffect.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Kali",sub="Culminus",range="Marsyas",ammo=empty,
		head="Inyanga Tiara",neck="Moonbow Whistle",
		--neck="Mnbw. Whistle +1",
		ear1="Regal Earring",ear2="Aredan Earring",
		body="Fili Hongreline +1",hands="Brioso Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.magic_jse_back,waist="Eschan Stone",legs="Inyanga Shalwar",feet="Brioso Slippers +1"}
		
	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Daybreak",sub="Culminus",range="Blurred Harp +1",ammo=empty,
		head="Inyanga Tiara",neck="Moonbow Whistle",
		--neck="Mnbw. Whistle +1",
		ear1="Regal Earring",ear2="Aredan Earring",
		body="Inyanga Jubbah +1",hands="Brioso Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.magic_jse_back,waist="Eschan Stone",legs="Inyanga Shalwar",feet="Aya. Gambieras +2"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Blurred Harp +1",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +1"}
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Daybreak",sub="Culminus",ammo="Kalboron Stone",
        head="Kaykaus Mitra +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Menelaus's Ring",
        --[[back="Tempered Cape +1",--]]waist="Salire Belt",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {ring1="Stikini Ring +1",ring2="Stikini Ring +1"}--[[{main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}--]]
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Culminus",ammo="Ombre Tathlum +1",
		head="C. Palug Crown",
		head="Kaykaus Mitra +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Regal Earring",
		body="Inyanga Jubbah +1",hands="Inyan. Dastanas +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aput Mantle",waist="Sekhmet Corset",legs="Kaykaus Tights +1",feet="Aya. Gambieras"}
		
	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic'] --[[{main="Daybreak",sub="Culminus",ammo="Ombre Tathlum +1",
		--head="C. Palug Crown",
		head="Kaykaus Mitra +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Regal Earring",
		body="Inyanga Jubbah +1",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}--]]
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	--sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	--[[sets.resting = {main="Daybreak",sub="Culminus",ammo="Staunch Tathlum +1",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}--]]
	
	sets.idle = {main="Kali",sub="Culminus",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Kaykaus Bliaut +1",
		--hands=gear.chironic_refresh_hands,
		ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1"}--,feet=gear.chironic_refresh_feet}
		
	--[[sets.idle.NoRefresh = {main="Daybreak",sub="Culminus",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Fili Cothurnes +1"}

	sets.idle.DT = {main="Daybreak",sub="Culminus",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}--]]
	
	-- Defense sets

	--[[sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}--]]

	sets.Kiting = {feet="Fili Cothurnes +1"}
	--sets.latent_refresh = {waist="Fucho-no-obi"}
	--sets.latent_refresh_grip = {sub="Oneiros Grip"}
	--sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +1",feet="Aya. Gambieras +1"}
	sets.engaged.DT = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.Acc = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = sets.engaged --[[{ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}--]]
	sets.engaged.DW.DT = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.DW.Acc = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DW.Acc.DT = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

