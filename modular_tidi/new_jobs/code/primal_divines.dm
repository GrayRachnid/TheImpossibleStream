GLOBAL_LIST_INIT(primal_divines_positions, list(
	"Druid",
	"Warden of the Wilds",
	"Korybantes",
	"Painter",
))

/datum/job/roguetown/druid
	display_title = "Maenad"
	f_title = "Maenad"
	tutorial = "Shape-changer, fanatic, long has your body been declared to the Lord of Madness. Your frenzied ways will not bow to the careful culturing of society, and your chants grow more than just trees and flowers. Loose your wyld ways upon the land, and chase your desires!"
	department_flag = PRIMAL_DIVINES
	selection_color = JCOLOR_PRIMAL_DIVINES
	allowed_patrons = list(/datum/patron/divine/dendor)
	job_traits = list(TRAIT_SEEDKNOW, TRAIT_OUTDOORSMAN, TRAIT_RITUALIST, TRAIT_HOMESTEAD_EXPERT, TRAIT_WOODWALKER, TRAIT_EXPERT_HUNTER, TRAIT_AZURENATIVE)
	min_pq = 0

// The original Warden is disabled in JOB_OVERRIDES. this is its Dendor replacement.
/datum/job/roguetown/wilds_warden
	title = "Warden of the Wilds"
	flag = WARDEN
	department_flag = PRIMAL_DIVINES
	selection_color = JCOLOR_PRIMAL_DIVINES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	forbidden_races = list(RACES_DESPISED)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = list(/datum/patron/divine/dendor)
	tutorial = "You are a Warden of the Wilds, a Dendrite ranger who keeps a vigil over the untamed wilderness beyond the walls. You serve the Primal Divines, not the Garrison."
	display_order = JDO_WARDEN
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/wilds_warden
	advclass_cat_rolls = list(CTAG_WILDS_WARDEN = 20)
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
	job_traits = list(TRAIT_AZURENATIVE, TRAIT_OUTDOORSMAN, TRAIT_SURVIVAL_EXPERT, TRAIT_EXPERT_HUNTER)
	job_subclasses = list(/datum/advclass/wilds_warden)
	has_subprefs = FALSE

/datum/outfit/job/roguetown/wilds_warden
	jobtype = /datum/job/roguetown/wilds_warden
	allowed_patrons = list(/datum/patron/divine/dendor)
	neck = /obj/item/clothing/neck/roguetown/coif/padded
	cloak = /obj/item/clothing/cloak/wardencloak
	backr = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/warden
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes
	job_bitflag = NONE

/datum/advclass/wilds_warden
	name = "Warden of the Wilds"
	tutorial = "You are a Warden of the Wilds, a Dendrite guardian who protects the natural order beyond the town walls."
	extra_context = "Wardens of the Wilds receive T2 miracles from Dendor."
	outfit = /datum/outfit/job/roguetown/wilds_warden/ranger
	category_tags = list(CTAG_WILDS_WARDEN)
	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_WIL = 2,
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/slings = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/wilds_warden/ranger/pre_equip(mob/living/carbon/human/H)
	..()
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/warden_machete = 1,
		/obj/item/flashlight/flare/torch/lantern/prelit = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
		/obj/item/signal_horn = 1,
		/obj/item/hunting_map/boars = 1,
	)
	add_verb(H, /mob/proc/haltyell)
	H.set_blindness(0)

	if(H.mind)
		var/armor_options = list("Light - Dodge Expert, Padded Gambeson", "Medium - Maille Training, Iron Hauberk")
		var/armor_choice = input(H, "Choose your ARMOR.", "PREPARE FOR THE HUNT-TO-COME.") as anything in armor_options
		switch(armor_choice)
			if("Light - Dodge Expert, Padded Gambeson")
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			if("Medium - Maille Training, Iron Hauberk")
				wrists = /obj/item/clothing/wrists/roguetown/bracers/jackchain
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		var/weapon_options = list("Bowhunter - Blackhorn Bow + 20 Bodkins", "Spearhunter - Dendor Scythe + Sling, +I STR / -I SPD")
		var/weapon_choice = input(H, "Choose your SPECIALITY.", "JACK OF MANY TRADES, MASTER OF NONE.") as anything in weapon_options
		switch(weapon_choice)
			if("Bowhunter - Blackhorn Bow + 20 Bodkins")
				beltr = /obj/item/quiver/bodkin
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/warden
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_MASTER, TRUE)
			if("Spearhunter - Dendor Scythe + Sling, +I STR / -I SPD")
				beltr = /obj/item/quiver/sling/iron
				r_hand = /obj/item/rogueweapon/halberd/bardiche/scythe
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				l_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/slings, SKILL_LEVEL_EXPERT, TRUE)
				H.change_stat(STATKEY_SPD, -1)
				H.change_stat(STATKEY_STR, 1)

		var/helmets = list(
			"Path of the Antelope"	= /obj/item/clothing/head/roguetown/helmet/bascinet/antler,
			"Path of the Volf"		= /obj/item/clothing/head/roguetown/helmet/sallet/warden/wolf,
			"Path of the Ram"		= /obj/item/clothing/head/roguetown/helmet/sallet/warden/goat,
			"Path of the Bear"		= /obj/item/clothing/head/roguetown/helmet/sallet/warden/bear,
			"Path of the Rous"		= /obj/item/clothing/head/roguetown/helmet/sallet/warden/rat,
			"None"
		)
		var/helmchoice = input(H, "Choose your HELMET.", "FOLLOW THE PATH OF YOUR ANCESTORS.") as anything in helmets
		if(helmchoice != "None")
			head = helmets[helmchoice]

		var/hoods = list(
			"Common Shroud"	= /obj/item/clothing/head/roguetown/roguehood/warden,
			"Antlered Shroud"		= /obj/item/clothing/head/roguetown/roguehood/warden/antler,
			"None"
		)
		var/hoodchoice = input(H, "Choose your SHROUD.", "LEST THEY SEE THE WHITES OF YOUR EYES.") as anything in hoods
		if(hoodchoice != "None")
			mask = hoods[hoodchoice]

		SStreasury.grant_savings(ECONOMIC_LOWER_MIDDLE_CLASS, H)
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_2)

/datum/job/roguetown/korybantes
	title = "Korybantes"
	flag = KORYBANTES
	department_flag = PRIMAL_DIVINES
	selection_color = JCOLOR_PRIMAL_DIVINES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	tutorial = "You are a Korybantes of Abyssor, serving the Primal Divines beyond the Pentacle's Temple. You may walk the path of a Hiereis or a Hetaeroi, and your duties are to the faithful of the Deep."
	allowed_patrons = list(/datum/patron/divine/abyssor)
	outfit = /datum/outfit/job/roguetown/monk
	advclass_cat_rolls = list(CTAG_ACOLYTE = 2, CTAG_TEMPLAR = 2)
	class_categories = TRUE
	job_traits = list(TRAIT_RITUALIST, TRAIT_STEELHEARTED, TRAIT_CLERGY, TRAIT_AZURENATIVE)
	advjob_examine = TRUE
	job_subclasses = list(
		/datum/advclass/herald,
		/datum/advclass/templar/maris,
	)
	display_order = JDO_PRIMAL_DIVINES
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

/datum/advclass/herald
	class_select_category = "Acolyte"

/datum/advclass/herald/post_equip(mob/living/carbon/human/H)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(apply_gendered_title), H), 1)

/datum/advclass/herald/proc/apply_gendered_title(mob/living/carbon/human/H)
	if(QDELETED(H))
		return
	H.advjob = (H.gender == FEMALE) ? "Hiereiai" : "Hierius"

/datum/advclass/templar/maris
	class_select_category = "Templar"

/datum/job/roguetown/painter
	display_title = "Seer"
	department_flag = PRIMAL_DIVINES
	selection_color = JCOLOR_PRIMAL_DIVINES
	allowed_patrons = list(/datum/patron/divine/abyssor)
	job_traits = list(TRAIT_WATERBREATHING, TRAIT_RITUALIST, TRAIT_CLERGY, TRAIT_AZURENATIVE)
	min_pq = 0
