/datum/advclass/levy
	maximum_possible_slots = 8

/datum/advclass/levy/post_equip(mob/living/carbon/human/H)
	. = ..()
	var/obj/item/roguekey/warden/tower_key = new(get_turf(H))
	if(!istype(H.back, /obj/item/storage) || !SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_INSERT, tower_key, H, TRUE, FALSE))
		tower_key.forceMove(get_turf(H))

// Everyone except Pestra.
/datum/advclass/witch
	allowed_patrons = list(
		/datum/patron/divine/undivided,
		/datum/patron/divine/astrata,
		/datum/patron/divine/noc,
		/datum/patron/divine/dendor,
		/datum/patron/divine/abyssor,
		/datum/patron/divine/ravox,
		/datum/patron/divine/necra,
		/datum/patron/divine/xylix,
		/datum/patron/divine/malum,
		/datum/patron/divine/eora,
		/datum/patron/old_god,
		/datum/patron/inhumen/zizo,
		/datum/patron/inhumen/graggar,
		/datum/patron/inhumen/matthios,
		/datum/patron/inhumen/baotha,
	)
