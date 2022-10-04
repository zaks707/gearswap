function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','FullMacc','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Naegling','MeleeClubs','MagicWeapons','None')--,'Almace','HybridWeapons','Naegmace','Tizbron','Tizalmace')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.da_jse_back = gear.crit_jse_back --{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back =gear.crit_jse_back --{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.wsd_jse_back = gear.crit_jse_back --{name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.nuke_jse_back = "Aput Mantle"--{name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	gear.obi_cure_waist = "Salire Belt"
	gear.obi_nuke_waist = "Salire Belt"
	gear.obi_cure_back = "Aput Mantle"
	
	autows = 'Savage Blade'

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	--select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {}--{feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +1"}
	sets.buff.Convergence = {}--{head="Luh. Keffiyeh +3"}
	sets.buff.Diffusion = {}--{feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back--[[,legs="Hashishin Tayt +1"--]]}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flume Belt +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {}--{hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Fast cast sets for spells

	sets.precast.FC = {--[[main="Vampirism",sub="Vampirism",--]]ammo="Impatiens",
		head="Carmine Mask +1",--[[neck="Voltsurge Torque",--]]ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Amalric Doublet +1",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Weatherspoon Ring",
		--[[back="Perimede Cape",--]]waist="Witful Belt",legs="Aya. Cosciales +1",feet="Malignance Boots"}

	sets.precast.FC.Utsusemi = {}--set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = {}--set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb",
				  head="Herculean Helm",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands="Jhakri Cuffs +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Herculean Trousers",feet="Herculean Boots"}

	sets.precast.WS.Acc = sets.precast.WS --[[{ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
			      back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}
				  --]]
	sets.precast.WS.FullAcc = sets.precast.WS --[[{ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
			      back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}
				  --]]

	sets.precast.WS.DT = {ammo="Aurgelmir Orb",
				  head="Malignance Chapeau",--[[neck="Loricate Torque +1",--]]ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
				  back=gear.da_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.precast.WS.Fodder = sets.precast.WS --[[{ammo="Falcon Eye",
				  head="Carmine Mask +1",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
				  body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
			      back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}
				  --]]

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Jukukik Feather",head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Moonshade Earring",ear2="Odr Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",back=gear.crit_jse_back},legs="Gleti's Breeches",feet="Gleti's Boots")
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",ear2="Odr Earring",back=gear.crit_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ear1="Moonshade Earring",ear2="Brutal Earring",body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",back=gear.wsd_jse_back,legs="Luhlaza Shalwar +3",waist="Dynamic Belt",feet="Herculean Boots"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,waist="Dynamic Belt",feet="Herculean Boots"})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {head="Lilitu Headpiece",neck="Mirage Stole +2",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +2",
		hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Luhlaza Shalwar +3",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Luhlaza Shalwar +3",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +3",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
			         head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
			         head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
			         back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	--sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {ammo="Aurgelmir Orb",
		head="Adhemar bonnet +1",neck="Mirage Stole +2",ear1="Odr Earring",ear2="Mache Earring +1",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring",
		back=gear.wsd_jse_back,waist="Cuchulain's Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Physical.Resistant = sets.midcast['Blue Magic'].Physical--[[{main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		--]]
	sets.midcast['Blue Magic'].Physical.Fodder = sets.midcast['Blue Magic'].Physical--[[{main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Suppanomimi",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back="Cornflower Cape",waist="Grunfeld Rope",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}
		--]]
	sets.midcast['Blue Magic'].PhysicalAcc = sets.midcast['Blue Magic'].Physical--[[{main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Malignance Boots"}
		--]]
	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Ombre Tathlum +1",
		 head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Enchntr. Earring +1",
		 body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Jhakri Ring",ring2="Stikini Ring +1",
		 back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +1"}
					 
	sets.midcast['Blue Magic'].Magical.Proc = sets.midcast['Blue Magic'].Magical--[[{ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
		--]]			 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{neck="Mirage Stole +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1"})--,waist="Yamabuki-no-Obi"})

	sets.midcast['Blue Magic'].Magical.Fodder = sets.midcast['Blue Magic'].Magical--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		 back=gear.ElementalCape,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
		--]]
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Ombre Tathlum +1",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Friomisi Earring",ear2="Enchntr. Earring +1",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Salire Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Enfeebling Magic'] = sets.midcast['Blue Magic'].Magical--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Psycloth Lappas",feet="Skaoi Boots"}
		--]]
	sets.midcast['Dark Magic'] = sets.midcast['Blue Magic'].Magical--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
		--]]
	sets.midcast['Enhancing Magic'] = sets.midcast['Blue Magic'].Magical--[[{main="Vampirism", sub="Vampirism",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		--]]
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Pukulatmuj",legs="Carmine Cuisses +1"})

	--sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	--sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	--sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	--sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	--sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	--sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	--sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	--sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = sets.midcast['Blue Magic'].Magical--[[{ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
		--]]
	sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
		--]]
	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Blue Magic'].Magical--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +2"}
		--]]
	--sets.midcast.Helix = sets.midcast['Elemental Magic']
	--sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1"}--,ring2="Archon Ring"}
	sets.element.Light = {ring2="Weatherspoon Ring"}

	sets.midcast.Cure = set_combine(sets.midcast['Blue Magic'].Magical, {ear1="Mendi. Earring",legs="Carmine Cuisses +1"})--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}
		--]]
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion"})--,hands="Hieros Mittens",
		--back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = sets.midcast['Blue Magic'].Magical--[[{ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +3",hands="Luh. Bazubands +1",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}
		--]]
	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {head="Malignance Chapeau",neck="Mirage Stole +2",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = sets.midcast['Blue Magic'].Stun--[[{main="Iris",sub="Iris",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		--]]
	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		head="Carmine Mask +1",neck="Phalaina Locket",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Moonlight Cape",waist=gear.ElementalObi,legs="Gyve Trousers",feet="Medium's Sabots"}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = sets.midcast.Cure--[[{main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Mavi Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}
		--]]
	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	--sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {--ammo="Mavi Tathlum",
		neck="Mirage Stole +2",--head="Luh. Keffiyeh +3",ear1="Gifted Earring",ear2="Njordr Earring",
		body="Assim. Jubbah +2",--[[hands="Rawhide Gloves",--]]ring1="Stikini Ring +1",ring2="Stikini Ring +1",}
		--back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Buff = sets.midcast['Blue Magic'].SkillBasedBuff--[[{main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +3",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves +1"}
		--]]
	--sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	--sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	--sets.latent_refresh = {waist="Fucho-no-obi"}
	--sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +1"}

	-- Resting sets
	sets.resting = {ammo="Falcon Eye",
			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Bleating Mantle",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets
	sets.idle = {--[[main="Bolelabunga",sub="Genmei Shield",--]]ammo="Staunch Tathlum",
			      --head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Jhakri Robe +2",--[[hands="Herculean Gloves",--]]ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			      back="Rosmerta's Cape",waist="Flume Belt +1"}--,legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	--sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {--[[main="Mafic Cudgel",sub="Genmei Shield",--]]ammo="Staunch Tathlum",
				head="Malignance Chapeau",--neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
		        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",--ring2="Dark Ring",
				--[[back="Moonlight Cape",--]]waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1"})--,feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {--[[main="Mafic Cudgel",sub="Genmei Shield",--]]ammo="Staunch Tathlum",
				head="Malignance Chapeau",neck="Mirage Stole +2",--ear1="Etiolation Earring",ear2="Sanare Earring",
		        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",--ring2="Shadow Ring",
				--[[back="Shadow Mantle",--]]waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = sets.defense.PDT--[[{main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
				head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
				back="Moonlight Cape",waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
				--]]
    sets.defense.MEVA = sets.defense.PDT--[[{main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Carrier's Sash",legs="Telchine Braconi",feet="Malignance Boots"}
		--]]
	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi"}--,ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	--sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	--sets.weapons.Tizbron = {main="Tizona",sub="Thibron"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Nibiru Cudgel"}
	--sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Naegling = {main="Naegling",sub="Hep. Sapara +1"}
	--sets.weapons.Naegmace = {main="Naegling",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Maxentius",sub="Nibiru Cudgel"}
	--sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	--sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {ammo="Aurgelmir Orb",
			    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},neck="Mirage Stole +2",ear1="Telos Earring",ear2="Suppanomimi",
			    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
				ring1="Chirich Ring +1",ring2="Chirich Ring +1",
			    back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Samnuha Trousers",feet={ name="Herculean Boots", augments={'Accuracy+11 Attack+11','DEX+10','Accuracy+12','Attack+14',}}}

	--[[sets.engaged.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}
	--]]

	sets.engaged.Acc = sets.engaged--[[{main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Mirage Stole +2",ear1="Cessance Earring",ear2="Telos Earring",
				body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
				back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
				--]]
	--[[sets.engaged.Acc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	--]]
	sets.engaged.FullAcc = sets.engaged--[[{main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Telos Earring",
				body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
				--]]
	--[[sets.engaged.FullAcc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			    back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	--]]
	sets.engaged.Fodder = sets.engaged--[[{main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Dedition Earring",ear2="Brutal Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
				--]]
	--[[sets.engaged.Fodder.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Dampening Tam",neck="Mirage Stole +2",ear1="Dedition Earring",ear2="Telos Earring",
			    body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}
	--]]
	sets.engaged.DT = {ammo="Aurgelmir Orb",
			    head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Suppanomimi",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
			    back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	--[[sets.engaged.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	--]]
	sets.engaged.Acc.DT = sets.engaged.DT--[[{main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
				--]]
	--[[sets.engaged.Acc.DT.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	--]]
	sets.engaged.FullAcc.DT = sets.engaged.DT--[[{main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Odr Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
				--]]
	sets.engaged.Fodder.DT = sets.engaged.DT--[[{main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
				--]]
	--[[sets.engaged.Fodder.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	--]]
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	--sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}
	--sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
--[[function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(2, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 2)
	else
		set_macro_page(6, 2)
	end
end--]]

autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MagicWeapons']='Black Halo',['MeleeClubs']='Black Halo',
     ['HybridWeapons']='Sanguine Blade',['Naegling']='Savage Blade',['Naegmace']='Savage Blade'}