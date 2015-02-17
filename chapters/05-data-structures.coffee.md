# Data structures

We can now perform a lot of transformations on data, but we can only operate on individual values. To be able to work with larger and more complex data types, e.g. images, we need to be able to bundle individual values together. This is where different types of *data structures* come into use.

The first data structure that we will try out is the *array*. An array is pretty much just a list; an ordered sequence of values. Arrays are created using the `[` and `]` characters. They're very intuitive; take a look!

    [1, 2, 3]
    ['a', 'b', 'c']

As you can see, we separate the individual elements with the `,` character, just like with function arguments and parameters.

So, how is this useful? Well, consider the application of displaying an image on a computer monitor. A monitor is made out of millions of tiny picture elements called *pixels*. To draw the image, each pixel needs to be set to the correct color. Since we don't want to write a function that takes a million arguments, we could use an array of colors to represent the entire image with a single argument. Neat-o!

{}
in
of

## Exercises

1. Create a list of
2. Write the function `favorite` from the exercises in the previous chapter, but this time, don't use any conditional statements.
