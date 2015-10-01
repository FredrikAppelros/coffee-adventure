    login = (username, password) ->
      success = username is 'Homer' and password is 'doh'
      console.log 'Access denied' unless success
      success
