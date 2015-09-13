Write a simple login function called `login`. It should take two arguments: `username` and `password`. If the username and password combination matches `'Homer'` and `'doh'`, the login is successful, and the function should return `true`. In all other cases, the login function should return `false` *and* print `Access denied`. In the following snippet, only the first statement should be successful.

    login 'Homer', 'doh'
    login 'Homer', 'donut'
    login 'Bart', 'Ay! Caramba!'
