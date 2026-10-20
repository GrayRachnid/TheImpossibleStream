// Lesser Healing, Water Healing and the T4 revival miracles are removed from these patrons. The Painter keeps Lesser Healing.
/datum/patron/divine/abyssor/New()
	..()
	miracles -= /datum/action/cooldown/spell/miracle/heal
	miracles -= /obj/effect/proc_holder/spell/invoked/abyssheal

/datum/patron/divine/dendor/New()
	..()
	miracles -= /datum/action/cooldown/spell/miracle/heal

/datum/patron/divine/xylix/New()
	..()
	miracles -= /datum/action/cooldown/spell/miracle/heal
	miracles -= /obj/effect/proc_holder/spell/invoked/resurrect/xylix

/datum/patron/divine/malum/New()
	..()
	miracles -= /datum/action/cooldown/spell/miracle/heal
	miracles -= /obj/effect/proc_holder/spell/invoked/resurrect/malum
