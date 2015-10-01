    max = (list) ->
      m = list[0]
      m = e for e in list when e > m
      m
