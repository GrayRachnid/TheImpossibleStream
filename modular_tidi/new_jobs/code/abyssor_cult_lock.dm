/obj/item/roguekey/abyssor_cult
	name = "tidal key"
	desc = "A corroded key crusted with salt and tiny barnacles, stamped with a wave."
	icon_state = "rustkey"
	lockid = "abyssor_cult"

// Hands out the cult key: bag if it fits, otherwise dropped at the wearer's feet.
/mob/living/carbon/human/proc/give_abyssor_cult_key()
	var/turf/drop_turf = get_turf(src)
	var/obj/item/roguekey/abyssor_cult/key = new(drop_turf)
	if(!istype(back, /obj/item/storage) || !SEND_SIGNAL(back, COMSIG_TRY_STORAGE_INSERT, key, src, TRUE, FALSE))
		key.forceMove(drop_turf)
