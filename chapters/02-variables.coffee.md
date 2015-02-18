# Variables

As we've mentioned before, the data that a computer uses for its computations is stored in the memory. To use it, we first need to access it. This could be done by using direct memory addressing, but a far simpler way is to use variables. Variables are just symbols that represent a memory address.

We can use variables to store the result of our computations. To do this, we will use yet another operator, `=`, the assignment operator. It takes two operands; a variable and a value. The variable is simply a word that acts as a handle for the stored value. We can use any combination of alphanumeric characters, as well as the `_` and `$` characters, so long as the variable does not start with a digit and does not conflict with any of the keywords in the language.<sup>[1]</sup>

    myvariable = 42
    another_variable = 24
    x = 1 + 2
    th1sIsAv4r1abl3 = 'Forty-two'

Variables can also be used as values. That is, we can also use them on the right-hand side of the assignment operator or in other operations.

    a = 1
    b = 2
    c = a + b
    c = c * 3

The last type of operation where a variable is modified and then stored back into itself is so common that there exists a couple of operators that acts as shorthands for it.

    x += 1
    x -= 2
    x *= 3
    x /= 4
    x %= 5

The case where you simply increment or decrement x numeric variable is so common that there exists even more concise shorthands for that.

    x++
    x--

To see the value that is currently stored in a variable, you can create a statement that consist of just the variable name.

    x

So what happens if we try to access a variable that we haven't used yet? Let's find out.

    thisvariabledoesnotexist

Whooa! The computer just threw a ton of strange text back at us. This time the computer did not return a result, as we just introduced an error. Instead, it gave us what is called a *stack trace*. It is used to trace the source of the problem, so that we can correct it. In this case, we can see it clearly in the first row:

`ReferenceError: thisvariabledoesnotexist is not defined`

Aha, so apparently we cannot reference variables before they are defined. In CoffeeScript, variables are defined the first time you assign something to them.

Variables will be very useful for us when we start writing more complex pieces of code. But let's move on. Next up is functions!

<sub>[1] This is actually not completely true, but is generally considered good practice. The actual rules that are applied to variable identifiers can be found [here](http://www.ecma-international.org/ecma-262/5.1/#sec-7.6).</sub>

## Exercises

1. Which of the following variable names are valid?
  * `abc`
  * `ABC`
  * `abc123`
  * `abc_123`
  * `123abc`
  * `a1b2c3`
2. What value does the variable `x` have after executing the following statements?
  ```coffee
  x = 1
  y = 5
  x += 2
  x %= 3
  x++
  x *= 4
  y /= 5
  x--
  y = x
  y -= 2
  ```
