/datum/controller/subsystem/job/Initialize(timeofday)
	. = ..()
	GLOB.church_positions -= list("Druid", "Painter")
	GLOB.garrison_positions -= "Warden"
	GLOB.wanderer_positions -= "Lamplighter"
	GLOB.atc_positions += "Merchant's Mercenary"
	GLOB.inquisition_positions += "Dungeoneer"
