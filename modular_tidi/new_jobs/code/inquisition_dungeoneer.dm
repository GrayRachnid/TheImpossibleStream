// Placeholder name: "Dungeoneer".
/datum/job/roguetown/dungeoneer
	title = "Dungeoneer"
	flag = DUNGEONEER
	department_flag = INQUISITION
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	forbidden_races = list(RACES_DESPISED)
	allowed_patrons = list(/datum/patron/old_god)
	tutorial = "You are a Dungeoneer of the Inquisition, keeper of the cells beneath the manor."
	selection_color = JCOLOR_INQUISITION
	outfit = null
	display_order = JDO_DUNGEONEER
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	wanderer_examine = FALSE
	advjob_examine = FALSE
	give_bank_account = 15
	vice_restrictions = list(/datum/charflaw/silverweakness)
	job_traits = list(TRAIT_STEELHEARTED, TRAIT_INQUISITION, TRAIT_MEDIUMARMOR, TRAIT_SQUIRE_REPAIR)
	advclass_cat_rolls = list(CTAG_DUNGEONEER = 2)
	job_subclasses = list(/datum/advclass/dungeoneer)
	has_subprefs = FALSE // only one subclass

/datum/advclass/dungeoneer
	name = "Dungeoneer"
	tutorial = "You are a Dungeoneer of the Inquisition, keeper of the cells beneath the manor."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/dungeoneer
	category_tags = list(CTAG_DUNGEONEER)
	subclass_languages = list(/datum/language/otavan)
	cmode_music = 'sound/music/templarofpsydonia.ogg'
	// Forced to medium armor in place of the Adjudicator's heavy armor trait.
	traits_applied = list(TRAIT_MEDIUMARMOR)
	// Weighs 7 the speed penalty discourages hunting.
	subclass_stats = list(
		STATKEY_STR = 3,
		STATKEY_CON = 3,
		STATKEY_WIL = 2,
		STATKEY_SPD = -2,
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
	)
	subclass_stashed_items = list(
		"The Book" = /obj/item/book/rogue/bibble/psy
	)

/datum/outfit/job/roguetown/dungeoneer
	parent_type = /datum/outfit/job/roguetown/psydoniantemplar

/datum/outfit/job/roguetown/dungeoneer/choose_loadout(mob/living/carbon/human/H)
	var/helmets = list("Barbute", "Sallet", "Armet", "Bucket Helm", "Greatplumed Armet", "Volfskulle Bascinet")
	var/helmet_choice = input(H,"Choose your HELMET.", "TAKE UP PSYDON'S HELMS.") as anything in helmets
	switch(helmet_choice)
		if("Barbute")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/psydonbarbute, SLOT_HEAD, TRUE)
		if("Sallet")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/psysallet, SLOT_HEAD, TRUE)
		if("Armet")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/psydonhelm, SLOT_HEAD, TRUE)
		if("Bucket Helm")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/psybucket, SLOT_HEAD, TRUE)
		if("Greatplumed Armet")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/knight/psy/greatplume, SLOT_HEAD, TRUE)
		if("Volfskulle Bascinet")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/volfplate/psydonic, SLOT_HEAD, TRUE)

	H.equip_to_slot_or_del(new /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/ornate, SLOT_ARMOR, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/roguetown/armor/leather/studded/cuirbouilli, SLOT_SHIRT, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/wrists/roguetown/bracers, SLOT_WRISTS, TRUE)

	H.put_in_hands(new /obj/item/rogueweapon/sword/short/silver(H))
	H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/sword/noble, SLOT_BELT_L, TRUE)
