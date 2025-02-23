/datum/reagent/medicine/healthpot
	name = "Зелье здоровья"
	description = "Постепенно восстанавливает все виды повреждений."
	reagent_state = LIQUID
	color = "#ff0000"
	taste_description = "здоровья"
	overdose_threshold = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 210

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+50, BLOOD_VOLUME_MAXIMUM)
	else
		//can overfill you with blood, but at a slower rate
		M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)	
		//some peeps dislike the church, this allows an alternative thats not a doctor or sleep. 
		M.heal_wounds(2) //at a motabalism of .5 U a tick this translates to 80WHP healing with 20 U Most wounds are unsewn 15-100. This is powerful on single wounds but rapidly weakens at multi wounds.
		M.update_damage_overlays()
	M.adjustBruteLoss(-1*REM, 0) // 45u = 15 oz = 120~ points of healing
	M.adjustFireLoss(-1*REM, 0)
	M.adjustOxyLoss(-1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1*REM)
	M.adjustCloneLoss(-1*REM, 0)
	..()
	. = 1
//super and minor health potions
/datum/reagent/medicine/lesserhealthpot
	name = "Малое зелье здоровья"
	description = "Постепенно восстанавливает небольшое количество всех видов повреждений."
	reagent_state = LIQUID
	color = "#ff6b6b"
	taste_description = "холодного масла и плоти"
	overdose_threshold = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 210

/datum/reagent/medicine/lesserhealthpot/on_mob_life(mob/living/carbon/M)
	M.heal_wounds(1) 
	M.update_damage_overlays()
	M.adjustBruteLoss(-0.4*REM, 0) // 45u = 15 oz = 50 points of healing
	M.adjustFireLoss(-0.4*REM, 0)
	M.adjustOxyLoss(-0.5, 0)
	M.adjustCloneLoss(-0.5*REM, 0) //heals as half as health
	..()
	. = 1

	
/datum/reagent/medicine/greaterhealthpot
	name = "Большое зелье здоровья"
	description = "Значительно исцеляет все виды повреждений."
	reagent_state = LIQUID
	color = "#ff7700"
	taste_description = "рыжести" //цвет зелья рыжий, поэтому такая хуйня
	overdose_threshold = 47 //45 units in a bottle, 2 units to safeguard
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 210

/datum/reagent/medicine/greaterhealthpot/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+50, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)	
		M.heal_wounds(4)
		M.update_damage_overlays()
	M.adjustBruteLoss(-2*REM, 0) // 45u = 15 oz = 240 points of healing
	M.adjustFireLoss(-2*REM, 0)
	M.adjustOxyLoss(-2, 0)
	M.adjustCloneLoss(-2*REM, 0) //heals as twice as much as health + every organ
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -1)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -1)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -1)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -1)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -1)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -1)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -1)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -1)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1)
	..()
	. = 1

/datum/reagent/medicine/greaterhealthpot/overdose_process(mob/living/carbon/M)
	M.adjustBruteLoss(1, 0)
	M.adjustToxLoss(3, 0)
	M.add_nausea(15)
	M.adjustFireLoss(1, 0)


/datum/reagent/medicine/manapot
	name = "Зелье маны"
	description = "Постепенно восстанавливает выносливость."
	reagent_state = LIQUID
	color = "#0000ff"
	taste_description = "маны"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.energy_add(100)
	..()
	. = 1

/datum/reagent/berrypoison
	name = "Ягодный яд"
	description = "Густая, тёмная жидкость." //нуууууу, тут вообще голубой цвет, так что опустим цвет
	reagent_state = LIQUID
	color = "#00B4FF"
	metabolization_rate = 0.1

/datum/reagent/berrypoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER))
		M.add_nausea(9)
		M.adjustToxLoss(3, 0)
	return ..()

/datum/reagent/organpoison
	name = "Яд из органов"
	description = "Вязкая черная жидкость прилипает к стеклу." //Красный цвет...
	reagent_state = LIQUID
	color = "#ff2f00"
	metabolization_rate = 0.1

/datum/reagent/organpoison/on_mob_life(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_NASTY_EATER) || HAS_TRAIT(M, TRAIT_ORGAN_EATER) || HAS_TRAIT(M, TRAIT_WILD_EATER))
		return ..()
	else
		M.add_nausea(9)
		M.adjustToxLoss(3, 0)
	return ..()

/datum/reagent/erpjuice/cum
	name = "Любовный сок"
	description = "Густая, липкая, кремообразная жидкость, выделяемая во время оргазма."
	reagent_state = LIQUID
	color = "#ebebeb"
	taste_description = "солёный, терпкий"
	metabolization_rate = 0.1

/datum/reagent/erpjuice/cum/on_mob_life(mob/living/carbon/M) //Rejoice, cum whores can now very inefficiently drink cum to substain themselves.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(1)
			H.adjust_nutrition(0.5) //Semen is not very nutritious. The player can go about 3 rounds of cumming before needing to wait a long time code-wise to cum more.
		if(H.blood_volume < BLOOD_VOLUME_NORMAL)
			H.blood_volume = min(H.blood_volume+10, BLOOD_VOLUME_NORMAL)
	..()

/datum/crafting_recipe/roguetown/cooking/soap
	name = "Мыло"
	reqs = list(
		/obj/item/ash = 1,
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/food/snacks/fat = 1)
	result = /obj/item/soap
	skill_level = 5
