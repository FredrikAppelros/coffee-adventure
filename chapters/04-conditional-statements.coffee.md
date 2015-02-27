# Conditional statements

We've previously played around a bit with operators that produce boolean values, but we have yet to see them in a meaningful context. Using them within *conditional statements* allows us to run code based on different conditions.

### If statements

The most common of these conditional statements is the `if` statement. Let's find out how to use the `if` statement by creating a function which returns the absolute value of a number.

    abs = (value) ->
      if value < 0
        value = -value
      value

The `if` statement takes an expression and a code block, and executes the code block if the expression evaluates to `true`. Just like with the function body, the code block that belongs to the `if` statement needs to be indented. When we use it, we can see that the negation statement is only applied to some inputs.

    console.log abs 0
    console.log abs 1
    console.log abs -2

If we want to take action in both the case that the expression evaluates to `true` and `false`, we can do so by adding an optional `else` clause.

    name = 'Rebecca Black'
    if name is 'MC Hammer'
      console.log 'Hammer time!'
    else
      console.log "Can't touch this."

What if we want to execute a statement only if an expression is `false` instead? Well, we can either use the `not` operator or we can use the shorthand form `unless`, which is the same as `if not`.

    age = 26
    console.log 'No grown-ups allowed!' unless age < 18

Here we're using the postfix form of `unless`, that is, we wrote the conditional at the end of, instead of in front of the statement which we wanted to execute conditionally. This can also be applied to the `if` statement, of course.

If we want to be really concise, we can even write an entire `if` statement with an `else` clause on a single line with the help of the `then` keyword.

    weekend = false
    food = if weekend then 'candy' else 'beans'
    console.log 'Today I will eat ' + food

Be sure to also note that the `if` statement returned a value which we assigned to a variable. So, just like most things in CoffeeScript, even `if` statements return results. Neat!

In the case that our condition has more than two states, we can even add a couple of `else if` clauses.

    size = 42
    if size < 10
      console.log "That's not very big"
    else if size < 20
      console.log "Meh, decent I guess"
    else if size < 50
      console.log "Now, that's big"
    else
      console.log "That thing is HUGE!"

Note that the order of the `else if` clauses makes a difference. If we were to shift them around we would never reach `size < 20` because we would have already triggered the `size < 50` condition.

When we add `else if` clauses, this also affects the `else` clause. The `else` clause is only executed if none of the previous clauses evalutes to `true`.

### Switch statements

Another type of conditional statement is the `switch` statement. This one can be really useful if we have a single variable with multiple states, such as in the following snippet.

    cmd = 'dance'
    switch cmd
      when 'eat' then console.log 'Om-nom-nom'
      when 'dance'
        console.log '*spin*'
        console.log '*sidestep*'
      when 'sleep' then console.log 'Zzz-zzz-zzz'
      else console.log "I can't do that!"

The same logic can be achieved using just `if` statements, but this way is more convenient. Here we use the `when` keyword to define the different states that our variable can assume, in combination with an `else` clause in the case that the variable doesn't match any of our defined states.

Conditional statements are the second type of control flow statements that we've run into. Soon we will learn of a few more. But first we need to learn about some basic data structures.

## Exercises

1. Write a simple login function called `login`. It should take two arguments: `username` and `password`. If the username and password combination matches `'Homer'` and `'doh'`, the login is successful, and the function should return `true`. In all other cases, the login function should return `false` *and* print `Access denied`. In the following snippet, only the first statement should be successful.

  ```coffee
  login 'Homer', 'doh'
  login 'Homer', 'donut'
  login 'Bart', 'Ay! Caramba!'
  ```

2. Write a function called `favorite`, that takes a number as an argument, and outputs that spot on a list of your top 5 favorite dishes/artists/animals. For example, calling the function with the number `3` might produce the following output: `My third favorite animal is the ocelot!`
