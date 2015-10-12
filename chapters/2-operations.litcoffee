# Operations

Even the most complex computer program can be broken down into a series of rather simple operations that are performed on the data. We will now go through a few of the available basic operations that can be performed on the types that we introduced in the previous exercise.

Let's start with some basic arithmetic operations.

    1 + 2
    3 - 4
    5 * 6
    7 / 8
    1 + 2 - 3

Okay, so now we see that the REPL actually returns the result of these calculations, and doesn't just echo back what we just wrote! Let the significance of this sink in for a bit. We told the computer to run a computation for us and provide us with the result. This is the essence of computer programming. The example itself is not very impressive though, since you can do this with any pocket calculator. Let's look at some operations that are not commonly found in calculators: comparisons.

    1 is 1
    1 isnt 2
    2 > 3
    3 < 4
    5 >= 5
    6 <= 7

So, what's happening here is that we're comparing two numbers to each other and that we receive a boolean value as the result. This value indicates if the comparison was truthful or not. We will see how that is useful later on.

We also see that an *operator*, the symbol that represents the operation, doesn't have to concist of a single character. It can in fact be a series of symbols in concert or even a word. The values on either side of the operation symbol are called *operands*.

Another operator that is commonly used in programming is `%`, the modulo operator. Even if you haven't heard of the term modulus before, you have probably used it. Let's try it out.

    4 % 10
    14 % 10
    42 % 2

As you might have figured out, the modulus is simply a fancy word for the remainder that is produced during division.

Yet another thing that's good to know is that operators have different *precedence*. This is just like ordinary mathematical notation where multiplication has a higher precedence than addition. And again, just like in mathematical notation, the precedence of an expression can be changed using parenthesis. This means that the following expression will evaluate to different results.

    1 + 2 * 3
    (1 + 2) * 3

The last arithmetic operator we will introduce in this chapter is the negation operator, `-`, which returns the negative value of its operand.

    -(1 + 2)

It uses the same symbol as the subtraction operator, but the difference lies in how many operands they operate on. The negation operator is a *unary operator*, which means that it only has a single operand. On the other hand, the subtraction operator, is a *binary operator*, which means that it uses two operands. In some languages there are even *ternary operators* which, yeah, you guessed it, works with three operators.

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

    not true
    true and false
    true or false

Be sure to try different combinations of these to really understand how these operations work!

So, to summarize things:

* There are a set of symbols and words within the language that are used as operators.
* Operators operate on specific data types. The same operator can do different things to different data types.
* Operations return values of a specific data type, which is not necessarily the same type as the operands.
* You can use parenthesis to enforce the precedence of particular terms in an expression.

Now, let's move on to another powerful concept: variables!
