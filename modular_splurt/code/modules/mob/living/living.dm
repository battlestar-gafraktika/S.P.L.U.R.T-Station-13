/mob/living
	var/datum/action/sizecode_smallsprite/small_sprite

/// Gender Change
// Intended only for silicons/robots (incl. pAI) and simple_animal code so far. This proc was made to somewhat ease up duplicated verb code.
// There's probably better way to do this but I am terrible at it --Nopeman
/mob/living/proc/change_gender()
	if(stat != CONSCIOUS)
		to_chat(usr, "<span class='warning'>You cannot toggle your gender while unconcious!</span>")
		return

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("Both", "Male", "Female", "None", "Toggle Breasts"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = TRUE
		if("Male")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = FALSE
		if("Female")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = TRUE
		if("None")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = FALSE
		if("Toggle Breasts") // Idea/Initial code by @LunarFleet (github)
			has_breasts = !has_breasts // Simplified line by @Zirok-BYOND (github)

/// Toggle admin frozen
/mob/living/proc/toggle_admin_freeze(client/admin)
	admin_frozen = !admin_frozen

	if(admin_frozen)
		SetStun(INFINITY, ignore_canstun = TRUE)
	else
		SetStun(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, "<span class='userdanger'>An admin has [!admin_frozen ? "un" : ""]frozen you.</span>")
		log_admin("[key_name(admin)] toggled admin-freeze on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-freeze on [key_name_admin(src)].")

/// Toggle admin sleeping
/mob/living/proc/toggle_admin_sleep(client/admin)
	admin_sleeping = !admin_sleeping

	if(admin_sleeping)
		SetSleeping(INFINITY, ignore_canstun = TRUE)
	else
		SetSleeping(0, ignore_canstun = TRUE)

	if(client && admin)
		to_chat(src, "<span class='userdanger'>An admin has [!admin_sleeping ? "un": ""]slept you.</span>")
		log_admin("[key_name(admin)] toggled admin-sleep on [key_name(src)].")
		message_admins("[key_name_admin(admin)] toggled admin-sleep on [key_name_admin(src)].")

/mob/living/adjust_mobsize()
	. = ..()
	if(mob_size == 0)
		AddElement(/datum/element/smalltalk)
	else
		RemoveElement(/datum/element/smalltalk)
