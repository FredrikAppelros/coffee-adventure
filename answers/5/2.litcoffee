    favorite = (idx) ->
      ordinal = switch idx
        when 1 then 'first'
        when 2 then 'second'
        when 3 then 'third'
        when 4 then 'fourth'
        when 5 then 'fifth'
      animal = switch idx
        when 1 then 'unicorn'
        when 2 then 'cobra'
        when 3 then 'ocelot'
        when 4 then 'manbearpig'
        when 5 then 'nyan cat'
      console.log "My #{ordinal} favorite animal is the #{animal}!"
