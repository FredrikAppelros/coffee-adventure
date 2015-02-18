# Data structures

We can now perform a lot of transformations on data, but we can only operate on individual values. To be able to work with larger and more complex data types, e.g. images, we need to be able to bundle individual values together. This is where different types of *data structures* come into use.

### Objects

The primary data structure that is used in CoffeeScript is the *object*. Objects, just like in the real world, have *properties*. Properties in CoffeeScript can be seen as variables that are bound to the object. Objects themselves are considered values and can be assigned to variables, just like any basic data type. Let's create some objects and see what we can do with them.

    emptyObject = {}
    car = {make: 'Volvo', model: 'V70'}
    dog =
      breed: 'Dalmatian'
      name: 'Arnold'
      age: 4

Here we've demonstrated a few different ways to construct objects. Normally, objects are created with curly brackets. Optionally, we can initialize the object with some properties by writing them between the brackets. In the snippet above, `{}` creates an empty object without any properties. The object that we assigned to the `car` variable has been created with the properties `make` and `model`. These properties have been assigned the values of `'Volvo'` and `'V70'`, respectively. The property name is delimited from the property value by the `:` character. When multiple properties are defined on the same row, we have to separate them with the `,` character.

We have also created an object, stored in `dog`, without using any brackets. In this case we're using indentation instead. By writing each property on a separate line, we do not have to use the `,` character.

Okay, so now we can bundle variables together into objects, but how do we access them? Simple, we can just use dot notation to access the different properties of an object.

    console.log car.make
    console.log dog.name

Hey! I recognize that pattern. Is `log` just a property of `console`? Yep, that's exactly right. `console` is actually an object and `log` is a function that belongs to that object. Properties whose values are functions are usually called *methods*. So that means that the global object `console` has a method called `log`, which we can access by writing `console.log`.

What if we want to access a property on an object, but the property name is dynamic? No worries, the bracket notation got you covered!

    prop = 'breed'
    console.log dog[prop]

Okay, so now we know two ways of accessing properties on objects. But how do we set properties after the object has been created? Actually, both of these ways of accessing the properties can also be used to change the value of it. They can even be used to add new properties.

    car.model = 'S80'
    car.sunroof = false
    dog['name'] = 'Julian'

Sweet. One last thing that we can do with objects is test for the presence of a property with the `of` keyword.

    console.log 'turbo' of car
    console.log 'name' of dog

### Arrays

The next data structure that we will look at is the *array*. An array is pretty much just a list; an ordered sequence of *elements*. Arrays are created using the square bracket. They're very intuitive; take a look!

    emptyArray = []
    [42, 'b', -9, false]
    superheroes = [
      'Batman'
      'Superman'
      'Wonder Woman'
    ]

As you can see, either we can separate the individual elements with the `,` character, or we can just write them on separate lines, much like with objects.

So, how is this useful? Well, consider the application of displaying an image on a computer monitor. A monitor is made out of millions of tiny picture elements called *pixels*. To draw the image, each pixel needs to be set to the correct color. Since we don't want to write a function that takes a million arguments, we could use an array of colors to represent the entire image with a single argument. Neat-o!

But now that the values are in the array, how do we access them? Just like with objects, we can use the bracket notation to access individual elements by their position, or *index*, in the array. And just like with objects, we can also assign new values to the elements using the same notation, or even add new elements at specific indices. Take a look:

    list = ['a', 'b', 'c']
    list[0]
    list[2] = true
    list[8] = 13

Note that arrays are zero-indexed, i.e. they start at index 0, instead of 1. This often leads to some initial confusion, but you get used to it.

Testing for the presence of a particular element in an array can be done using the `in` keyword.<sup>[1]</sup>

    console.log 'a' in list
    console.log 'z' in list

Besides using the bracket notation to add elements to specific positions in the array, we can also just add elements to the end of an array with the `push` method.

    list = []
    list.push 1
    list.push 2
    list.push 3
    console.log list[1]

Hey, wait a minute! Did you just say method? Wasn't it only objects that could have methods? Correct, again! Arrays are actually a special type of objects, in fact, pretty much everything in CoffeeScript is an object. Numbers, strings, functions, you name it!

With these new tools at our disposal, we're able to organize data in both convenient and efficient ways. Now we can move on to learn how to process larger amounts of data with loops.

<sub>[1] If you need this operation be performant, using the in keyword might not be your best bet. Then it might be much better to use an object instead.</sub>

## Exercises

1. Create an object called `room` to represent your surroundings. It should contain the following properties: `size`, `color` and `furniture`. The `furniture` property should be an array of strings, describing the various furniture in the room.

2. Write the function `favorite` from the exercises in the previous chapter, but this time, don't use any conditional statements.
