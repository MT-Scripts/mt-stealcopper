local Translations = {
    stealboxes = {
      ["target_label"] = "Robar caja",
      ["stealing_animation_label"] = "Robando caja",
      ["stealing_animation_canceled"] = "Cancelaste el robo",
      ["already_stolen_error"] = "Alguien ya esta robando aqui",
      ["messed_up_error"] = "¡¡¡LO ARRUINASTE!!!",
      ["box_removed"] = "Robaste la caja",
      ["police_notification"] = "Robo a caja de acero en progreso",
      ["police_notified"] = "¡¡¡La policía ha sido notificada!!!",
      ["insuficientCops"] = 'El taladro esta sin batería.'
    },
  }
  Lang = Locale:new({
      phrases = Translations,
      warnOnMissing = true
  })
  