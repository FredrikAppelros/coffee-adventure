# Loops

Now we've learnt how to bundle operations and data together with functions and data structures. This allows us to work with computations in a convenient way. But what happens when you have to perform the same computation ten times? Well, we could just write out the same function call ten times over. But what if we it weren't ten times, but a million times? Obviously, there must be a better way to do this.

### Comprehensions

Luckily, performing the same task over and over in rapid succession is something computers really excel at. The construct that is used to repeat a task is called a *loop*. The first type of loop we will try out is the *comprehension*. A comprehension iterates over a given data structure and performs a task for each element. We can create a comprehension with the `for` keyword in combination with either `in` or `of`, depending on the data structure.

    eat = (food) ->
      console.log "Wow! This #{food} is delicious!"

    dishes = ['taco', 'boeuf bourguignon', 'lentil soup']
    eat dish for dish in dishes

The `for dish in dishes` part is the actual comprehension. We're binding each element of the array `dishes` to a variable, which in this case we chose to call `dish`. The rest of the row, `eat dish`, is the statement which we wish to perform for each element. This uses the postfix form of `for`, but we can also write comprehensions that use code blocks instead, such as in the following snippet.

    for dish in dishes
      eat dish
      console.log '*burp*'

Similarily, we can iterate over objects and their properties the same way by exchanging the `in` for an `of`.

    listen = (genre, like) ->
      console.log "♪ #{genre} ♪"
      if like
        console.log 'I love this song!'
      else
        console.log 'Urgh. What garbage is this?'

    genres =
      'Rock': true
      'Hip Hop': true
      'Dubstep': false
    listen genre, like for genre, like of genres

If you're only interested in the name of the property, and not the value, you can simplify it a bit.

    console.log "I listen to #{genre} music" for genre of genres

With comprehensions you can even filter out unwanted elements using the `when` keyword.

    console.log "I like #{genre}" for genre, like of genres when like

Okay, but what if we just want to repeat something a fixed amount of times instead of iterating an existing data structure? Well, we could use a *range*.

### Ranges

A range in CoffeeScript is the same thing as an interval in mathematics. It is a set of numbers that lie between two endpoints. Ranges are created with square brackets, like arrays, and can be either *inclusive* or *exclusive*. An inclusive range includes the last endpoint while an exclusive range excludes it.

    console.log i for i in [10..1]
    console.log i for i in [20...25]

As you can see, we can start the iteration from either endpoint. Inclusive and exclusive ranges are denoted by `..` and `...` respectively. If we want to change our stride, i.e. the distance between each discrete step of our range, we can do that with the help of the `by` keyword. We don't even need to use integers!

    console.log i for i in [0...0.3] by 0.1

### While loops

Comprehensions are all well and good when we know beforehand how many times we need to perform an action. But what if this is unknown? When we need to repeat something based on some general condition we can use a `while` loop instead.

    haystack = [2, 13, 7, 33, 6, 11]
    needle = 7
    pos = 0
    pos++ while haystack[pos] isnt needle
    console.log "The number #{needle} was found in position #{pos}"

The syntax is simple. After the `while` keyword comes the condition statement. So long as this statement evaluates to `true`, the loop keeps on going. Just like comprehensions, `while` loops can be written with code blocks as well. Similar to `unless`, we also have `until`, which is short for `while not`.

    cmds = ['do stuff', 'do stuff', 'quit', 'do stuff']
    pos = 0
    until cmds[pos++] is 'quit'
      console.log 'Work, work!'

### Breaking and skipping

We've previously mentioned how we can use a `return` statement to prematurely jump out of a function. Similarily, we can use a `break` statement to prematurely jump out of a loop.

    for i in [0..5]
      break if i is 3
      console.log i

This can be useful if we want to abort the processing done in our loop, but still want to execute some cleanup code located further down in our function.

Much like the `break` statement we can also use the `continue` keyword to skip a single iteration within a loop.

    for i in [0..5]
      continue if i is 3
      console.log i

### Caveats

One thing that we need to be careful of is using asynchronous functions within loops and comprehensions. An example of an asynchronous function is the `setTimeout` function, which takes two parameters; `callback` and `delay`. It will call the `callback` function after approximately `delay` milliseconds. Let's see what happens if we use this in a naive way.

    work = (task, callback) ->
      console.log "Starting task: #{task}"
      setTimeout callback, 1

    tasks = ['rake', 'plant', 'mow']
    for task in tasks
      work task, ->
        console.log "Completed task: #{task}"

Huh? We just got three `Completed task: mow` in a row. That is because the `callback` function uses the variable `task` in the comprehension. Since the function `setTimeout` is asynchronous, the comprehension will move to the next element of the array before `callback` can be invoked. In this case, the comprehension managed to finish and therefore the `task` variable got stuck on the last element of the array, `'mow'`, resulting in three identical outputs.

We can resolve this situation quite easily by binding each iteration to the current value of the `task` variable. The `do` statement helps us with just that by directly invoking the function that is passed to it. The function will then bind its arguments to its parameters and thus the `callback` function will use the correct value of the `task` variable.

    for task in tasks
      do (task) ->
        work task, ->
          console.log "Completed task: #{task}"

We've now walked through the last types of control flow statements that we will encounter. Next, we will learn about the classes.

## Exercises

1. Make the computer print out your own name 100 times.

2. Create a function which prints out each element of a given list, but in reverse order.

3. Create a function which finds the largest number in a list of positive numbers.
