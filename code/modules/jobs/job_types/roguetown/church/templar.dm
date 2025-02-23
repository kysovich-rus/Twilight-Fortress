//shield flail or longsword, tief can be this with red cross

/datum/job/roguetown/templar
	title = "Templar"
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "Вы - храмовник, воин, который отказались от богатства и титула вместо служения церкви, либо из-за фанатизма, либо из-за прошлого позора. \
	Храмовники охраняют церковь и жреца, бдительно следя за ересью и богохульством. В тревожных снах они гадают, делает ли пролитая ими кровь их святыми или запятнанными."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_patrons = ALL_CLERIC_PATRONS
	outfit = /datum/outfit/job/roguetown/templar
	min_pq = 2
	max_pq = null
	total_positions = 3
	spawn_positions = 3
	display_order = JDO_TEMPLAR
	give_bank_account = TRUE

	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/templar
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/templar/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron.name)
		if("Astrata")
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/astrata
			else
				head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/astrata/alt
			cloak = /obj/item/clothing/cloak/templar/astratan
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Noc")
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/noc
			cloak = /obj/item/clothing/cloak/tabard/crusader/noc
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Dendor")
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/dendor
			cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Necra")
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/necra
			else
				head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/necra/alt
			cloak = /obj/item/clothing/cloak/templar/necran
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Pestra")
			wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/pestrahelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/pestra
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Malum")
			wrists = /obj/item/clothing/neck/roguetown/psicross/malum
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/malum
			cloak = /obj/item/clothing/cloak/templar/malummite
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Abyssor")
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/abyssorgreathelm
			cloak = /obj/item/clothing/cloak/abyssortabard
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Ravox")
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/ravox
			cloak = /obj/item/clothing/cloak/tabard/crusader/ravox
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Eora")
			head = /obj/item/clothing/head/roguetown/helmet/sallet/eoran
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
			cloak = /obj/item/clothing/cloak/tabard/crusader/eora
			mask = /obj/item/clothing/mask/rogue/facemask/goldmask
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
		if("Xylix")
			wrists = /obj/item/clothing/neck/roguetown/psicross/xylix
			cloak = /obj/item/clothing/cloak/tabard/crusader/xylix
			head = /obj/item/clothing/head/roguetown/helmet/heavy/templar/xylixhelm
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather/advanced
			neck = /obj/item/clothing/neck/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/armor
	backl = /obj/item/storage/backpack/rogue/satchel
	switch(H.patron.name)
		if("Necra")
			backpack_contents = list(/obj/item/key/graveyard, /obj/item/key/church)
		if("Xylix")
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel, /obj/item/key/church)
		else
			backpack_contents = list(/obj/item/key/church = 1)
	backr = /obj/item/rogueweapon/shield/tower/metal
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/silver
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		switch(H.patron.name)
			if("Malum")
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
				beltr = /obj/item/rogueweapon/mace/warhammer/steel
				H.change_stat("strength", 3)
				H.change_stat("perception", 2)
				H.change_stat("intelligence", 2)
				H.change_stat("constitution", 2)
				H.change_stat("endurance", 2)
				ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			if("Xylix")
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
				beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
				beltr = /obj/item/ammo_holder/quiver/arrows
				backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
				H.change_stat("strength", -2)
				H.change_stat("perception", 3)
				H.change_stat("intelligence", 2)
				H.change_stat("constitution", -2)
				H.change_stat("endurance", 2)
				H.change_stat("speed", 3)
				H.change_stat("fortune", 2)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			else
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
				beltr = /obj/item/rogueweapon/sword/long
				H.change_stat("strength", 3)
				H.change_stat("perception", 2)
				H.change_stat("intelligence", 2)
				H.change_stat("constitution", 2)
				H.change_stat("endurance", 2)
				ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/templar/post_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
