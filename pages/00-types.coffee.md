---
layout: chapter
title: Types
permalink: /chapters/0/
chapter: 0
first: true
last: false
---
# Types

The data that a computer uses for its computations is located in memory. Everything in the memory is really just numbers. We can, however, interpret these numbers in different ways. Depending on how you interpret it, the same data might represent a number, a snippet of text or even an image. The most common interpretations can be built into the language itself, as is the case with CoffeeScript. These interpretations are called *types*.

Let's try creating some different types of data. How about we start with some numbers? Open the CoffeeScript REPL with the `coffee` command and type in the following:

    4
    8
    15
    16
    23
    42

We're not just restricted to integers, we can of course represent any real number.<sup>[1]</sup>

    0.5
    123.45

As you see, after each input the REPL responds by echoing the same number that was entered. Each row you entered is actually a *statement*, a piece of code that the computer executes. The echoed number is actually the result of evaluating the code you just typed. But more on that later, let's create a bit of text, or a *string* as the technical term is.

    "We can write text within double ticks..."
    '... or single ticks'

Another type that is very common in programming, but that doesn't have much recognition anywhere else is the *boolean*. Booleans have only two possible values, either `true` or `false`.

    true
    false

These values will come in handy later on when we need our code to react to different circumstances.

There's one more thing that you will run across, but that's not a data type, and that is *comments*. Comments are not actually part of the code, but simply small pieces of text that the programmer adds to clarify things. The computer will just skip these lines. Comments are created with the `#` charater:

    # This is just a comment and will be ignored by the computer

That's it for data types; next up is operations!

<sub>[1] There are some numbers that can never be represented with [perfect accuracy](http://en.wikipedia.org/wiki/Floating_point#Accuracy_problems) using the standard floating point representation.</sub>
