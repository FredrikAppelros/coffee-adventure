    favorite = (idx) ->
      ordinals = [
        'first'
        'second'
        'third'
        'fourth'
        'fifth'
      ]
      animals = [
        'unicorn'
        'cobra'
        'ocelot'
        'manbearpig'
        'nyan cat'
      ]
      idx--
      console.log "My #{ordinals[idx]} favorite animal is the #{animals[idx]}!"
