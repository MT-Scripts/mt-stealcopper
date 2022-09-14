local Translations = {
  stealboxes = {
    ["target_label"] = "Steal Box",
    ["stealing_animation_label"] = "STEALING BOX...",
    ["stealing_animation_canceled"] = "You canceled the stealing",
    ["already_stolen_error"] = "Someone already steal here",
    ["messed_up_error"] = "YOU MESSED UP!!!",
    ["box_removed"] = "You stole the box",
    ["police_notification"] = "Box steal in pogress",
    ["police_notified"] = "The police have been notified!!!",
  },
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
