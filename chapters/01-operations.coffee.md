# Operations

Even the most complex computer program can be broken down into a series of rather simple operations that are performed on the data. We will now go through a few of the available basic operations that can be done on the types that we introduced in the previous exercise.

Let's start with some basic arithmetic operations.

    1 + 2
    3 - 4
    5 * 6
    7 / 8
    1 + 2 - 3

Okay, so now we see that the REPL actually returns the result of these calculations, and doesn't just echo back what we just wrote! Let the significance of this sink in for a bit. We told the computer to run a computation for us and provide us with the result. This is the essence of computer programming. The example itself is not very impressive though, since you can do this with any pocket calculator. Let's look at some operations that are not commonly found in calculators: comparisons.

    1 > 2
    2 < 3
    4 >= 4
    5 <= 6

So, what's happening here is that we're comparing two numbers to each other and that we receive a boolean value as the result. This value indicates if the comparison was truthful or not. We will see how that is useful later on.

We also see that an *operator*, the symbol that represents the operation, doesn't have to concist of a single character. It can in fact be a series of symbols in concert or even a word as we will see a bit further down. The values on either side of the operation symbol are called *operands*.

Another operator that is commonly used in programming is `%`, the modulo operator. Even if you haven't heard of the term modulus before, you have probably used it. It's simply a fancy word for the remainder that is produced when doing an integer division. Let's try it out.

    4 % 10
    14 % 10
    42 % 2

So, what can we do with the other types we just introduced?

With strings, we have another intuitive operation that we can perform: concatenation. That is, to add one string to the end of another.

    'This will result in' + ' a single string'

So, what more can we do? Well, we can concatenate strings with numbers.

    'I wish I had ' + 12 + ' apples'

As you see this simply uses the decimal representation of the number and treats it as if it were a string. A better way to do this is to use *string iterpolation*.

    "I wish I had #{ 24 / 2 } apples"

When interpolating a string, any code within `#{}` will be evaluated and inserted back into the string. This is only possible using `"` characters. Strings enclosed in `'` characters are always interpreted literally.

Perhaps you have noticed that the `+` operator does different things to different types of data. That is what data types are for; to allow us to define different operations on them. So, can we remove a part of a string from another? Let's try it.

    'This is a very long string' - 'very'

Well, no, at least not like that. The return value we got was `NaN`, which stands for "Not a Number". There is no operation to do what we would like to do, so the computer assumed we tried to subtract a number from another number. As none of the operands were actually a number, the computer tries to make us aware of this. We will soon see other ways that the computer uses to help us find errors in the code that we write.

Now, let's introduce some operations that we can perform on booleans.

    true is false
    true isnt false
    not true
    true and false
    true or false

Be sure to try different combinations of these to really understand how these operations work!

The words that are used as operators here are *keywords*, which are reserved within the language and may not be used for anything else other than to represent the operation.

Another thing worthy of noting is that the `not` operator takes only a single operand. The other operators we've seen until now have been *binary operators*, i.e. they work on two operands. The `not` operator is a *unary operator*, which means it operates on a single operand. In some languages there are even *ternary operators* which, yeah, you guessed it, works with three operators.

Yet another thing that's good to know is that operators have different *precedence*. This is just like ordinary mathematical notation where multiplication has a higher precedence than addition. And again, just like in mathematical notation, the precedence of an expression can be changed using parenthesis. This means that the following expression will evaluate to different results.

    1 + 2 * 3
    (1 + 2) * 3

Lastly, there also exists a unary operator that uses the same symbol as the binary operator for subtraction, `-`. This operator, the negation operator, returns the negative value of its operand.

    -(1 + 2)

So, to summarize things:

* There are a set of symbols and words within the language that are used as operators.
* Operators operate on specific data types. The same operator can do different things to different data types.
* Operations return values of a specific data type, which is not necessarily the same type as the operands.
* You can use parenthesis to enforce the precedence of particular terms in an expression.

Now, let's move on to another powerful concept: variables!

## Exercises

1. What is the result of the following expressions?

  * `(3 + 2 - 1) * 2 / 4 >= 3`
  * `17 % (7 + 2)`
  * `(true or false) and false`
  * `true or (false and false)`
  * `true or (5 > 6)`

2. Which operator has higher precedence; `and` or `or`?
