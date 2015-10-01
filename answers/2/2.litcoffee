`and` is the one with higher precedence. This can be seen by using the constructs from the previous exercise; compare the outputs of running the following statements:

*   
        (true or false) and false

*   
        true or (false and false)

*   
        true or false and false

You can see that the result of the last statement is `true`, which is the same as the second statement, where we enforce that we perform the `and` operation before the `or` operation.
