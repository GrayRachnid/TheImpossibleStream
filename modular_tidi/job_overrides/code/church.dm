/datum/job/roguetown/templar
	total_positions = 2
	spawn_positions = 2

/datum/job/roguetown/templar/New()
	. = ..()
	job_subclasses -= /datum/advclass/templar/maris

/datum/job/roguetown/acolyte/New()
	. = ..()
	job_subclasses -= /datum/advclass/herald


// Any Pentacle worshipper may take the Martyr. the outfit converts them to Undivided on spawn.
/datum/job/roguetown/martyr
	allowed_patrons = ALL_DIVINE_PATRONS

/datum/outfit/job/roguetown/martyr
	allowed_patrons = list(/datum/patron/divine/undivided)
