# Functions

So, up until now, we've only been able to use basic operations on data. What if we've created a set of statements which performs a useful computation and we want to reuse it? Enter: *functions*.

With functions we can group statements together into a sort of reusable bundle. To allow functions to operate on different inputs, they are defined using *parameters*. Parameters are simply a set of variables that the function operates on. When you want to use a function you *call* it with a set of *arguments*. The arguments are the values that will be bound to the parameters.

Okay, that was a lot of terminology and probably quite confusing. Let's try to use an existing function, `console.log`.<sup>[1]</sup> This function takes a series of strings and outputs them on the *standard output stream*, or `stdout` in short.

    console.log 'Hello, World!'

Okay, so that just printed the string right back to us. Seems a lot like just writing the string by itself as a statement, right? No, not at all. As you can see, we also got another response below it: `undefined`. Similar to statements, functions can also return values. In this case the `console.log` function does not have a return value; thus we get `undefined`. So where did the `Hello, World!` output come from?

When we're using the REPL we constantly get feedback on what our statements evaluate to. This is not the case if we write our code as a *script*. A script is a file which contains code that can be run by an *interpreter*. The interpreter is the part that is used by the REPL to convert the code that we write into actual instructions that the computer then executes. Actually, this file you're reading right now is a script!

So, to produce any kind of output from a script, we need to send it somewhere. That is what `stdout` is for! Normally, if you run the script from a terminal, then the text that is sent to `stdout` is printed in the terminal. All other statements will be silent and not result in any output.

Moving on, to fully understand functions, let's create our own. Actually, let's create it in a script. Open a new empty file and save it as `myscript.coffee`. Now, instead of entering the code into the REPL, write it in this file.

So, say we want a function that calculates the area of a triangle. The function will need to know the width and height of the triangle in order to perform the calculation. We can supply these using parameters. Then it needs to calculate the area and return the result. Here is the function in all its glory:

    triangleArea = (width, height) ->
      area = width * height
      area /= 2

To understand what's going on, let's break it down a bit. The first part, `triangleArea =`, is just a normal variable assignment. Functions can be used as values and we've chosen to store our function in a variable named `triangleArea`. The rest of the snippet is the actual function definition. The variables within parenthesis, `width` and `height`, are our function parameters. Then comes the `->` symbol that indicates the start of the *function body*.

The function body is a set of statements, or *code block*, that are executed when the function is called. As you can see, these statements are indented relative to the rest of the code. In most languages, this is done simply to make it easier for the reader to understand which parts of the code belong to the function and which don't. This is *not* the case with CoffeeScript. The indentation here is required for the interpreter to parse the code. Lines that are not indented do not belong to the function, and will not be executed when the function is called.

The indentation can be accomplished with either tabs or spaces, but be sure to not mix them. Also, if you use spaces, try to use a multiple of 2. If you use different styles of indentation within the same block, the interpreter will fail to parse your code correctly.

The value that our function returns to the caller is the same as the evaluation of the last statement in the function body. In our case, the last statement is part of the area calculation, so everything is in order. In other cases you might have to write the value that you wish to return on a row by itself at the end of the function. You can also set the return value explicitly with a `return` statement, which causes the function to return to the caller prematurely. This can be very useful when an early abort is desirable to prevent an illegal operation further on in the function.

Now, let's start using our newly created function. We do this by first specifying which function we would like to call, commonly using the variable that refers to the function, and then specifying the arguments that we would like to bind to the function parameters.

    triangleArea 10, 20

Note how we separate the arguments with the `,` character. Okay, great! So now we have a reusable function that we can apply to different arguments. Let's try to calculate the area of a few different triangles and print it to the terminal using `console.log`.

    area1 = triangleArea 20, 30
    area2 = triangleArea 30, 40
    console.log area1
    console.log area2

To run the script, first of all, save it, then simply enter the following into your terminal:

```sh
coffee myscript.coffee
```

Cool! You've just written your first script! As you can see from the order of the output, the code in the script is executed from the top down. This is the standard flow of execution. But we've already deviated from this flow! When we perform our function calls, we're actually executing code located above the function call itself.

The function call is the first type of *control flow* statements that we will be introduced to. Later on we will see other types of statements that also modify the execution order of our programs. But, before we move on, there's a few more things you need to know about writing and using functions.

What happens when a function doesn't need any arguments? Well, either you just use a pair of empty parenthesis, `()`, in the function definition, or you just skip them completely.

    printHello = ->
      console.log 'Hello'

So how do we call this function then when it doesn't take any arguments? Well, it's done like this:

    printHello()

And what about when we want to call a function with the result from another function call? Let's try to print both the width, height and area of a triangle with a single statement.

    console.log 10, 20, triangleArea 10, 20

Okay, not a problem. But what if we would like to print the area first, followed by the width and height?

    console.log triangleArea 10, 20, 10, 20

Hmm, that was not really what we intended to do. The problem here is that the inner function call, `triangleArea`, swallowed all of our arguments. The interpreter has no way of knowing which arguments should be passed to the inner function and which should be passed to the outer one. So it ends up sending all of them to the inner one even though it only cares about the two first ones. Yet again, parenthesis solves this disambiguity.

    console.log triangleArea(10, 20), 10, 20

As we mentioned before, functions can be used as values. This allows us to pass a function into another as a *callback*. This can be very useful if you have a function which you do not know how long it takes to complete, but you still want to perform an action upon completion. This situation can arise when we are waiting on user input, or waiting for another process to finish. As always, this concept is easier to grasp when we see it in action.

    rest = ->
      console.log 'Phew! That was a lot of work.'

    work = (callback) ->
      console.log 'Hard work is HARD.'
      callback()

    work rest

Okay, let's break it down. First, we create two functions; `rest` and `work`. The `work` function has a parameter, `callback`, which will be bound to another function. At the end of the `work` function, before returning, we call the function `callback`. Thus, when we call the function `work` with the argument `rest`, we will bind `rest` to the parameter `callback`, resulting in `rest` eventually being called. This can be a bit confusing, so make sure you go through this a few times until you have fully grasped the concept.

We could, in the last example, also just define the callback function directly, without first storing it in the `rest` variable. Then we would get something like this.

    work -> console.log 'Phew! That was a lot of work.'

That was it for functions. Next up we will learn how to perform different operations under different conditions.

<sub>[1] Actually, console.log is not just a function; it's a method. The difference between functions and methods will be explained in a later chapter, but for now they are pretty much equivalent.</sub>

## Exercises

1. Write a function that calculates the area of a rectangle.

2. Write a function that calculates the volume of a rectangular prism, using the function from the previous exercise to calculate the area of the base.

3. Go to `apps/paint` and follow the instructions in the [`README`](https://github.com/FredrikAppelros/coffee-adventure-paint/blob/master/README.md) file.
