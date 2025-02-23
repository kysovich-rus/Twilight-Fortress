/obj/item/clothing/mask/rogue/pestra
	name = "пестранская маска"
	desc = "Изготовленная особым образом маска оберегает носителя от гнили, насколько это возможно. Часть запаха все равно просачивается под ткань."
	icon = 'icons/roguetown/clothing/newclothes/objmasks.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/newclothes/onmob/masks.dmi'
	icon_state = "feldmask"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEARS
	body_parts_covered = FACE|EARS|EYES|MOUTH|NECK
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

/obj/item/clothing/mask/rogue/pestra/court
	name = "маска придворного лекаря"
	desc = "Сделана специально для лекаря при дворце герцога, наиболее опытного целителя в округе."
	icon_state = "pestramask"

/obj/item/clothing/mask/rogue/rag
	name = "тряпичная маска"
	desc = "Кусок ткани, сложенный таким образом, чтобы можно было легко скрыть свое лицо или защитить нос от противных запахов."
	icon = 'icons/roguetown/clothing/newclothes/objmasks.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/newclothes/onmob/masks.dmi'
	icon_state = "ragmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	experimental_onhip = TRUE
	sewrepair = TRUE
	salvage_amount = 1

/obj/item/clothing/mask/rogue/rag/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_wear_mask()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEFACE|HIDEFACIALHAIR
			body_parts_covered = NECK|MOUTH
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_wear_mask()

