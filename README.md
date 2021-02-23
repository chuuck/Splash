# Splash

## Introduction

Splash is a basic programming language with a goal to read columns of integers from a file and later apply different arithmetic functions to the variables in the list. The language includes multiple functions from Haskell that can be used to extract or change values in the list a lot quicker.

## Types and Syntax

The language supports 3 different types - Integer, Boolean, List. Those can be used to achieve the necessary goal for a list of integers. Each of the types has a rule on how these types of variables can be created. First, the user has to define the type of a newvariable, then name, and later an expression that will create the new variable.

```
<type> <string> ::= <exp>
```

To define an Integer variable user can follow these set of rules:
```
<exp> ::= <digit+> | "-" <digit+>
```

To define a List: 
```
<exp> ::=  "[" <explist> "]"
<explist> ::= <explist> "," <exp> | <exp> | empty
```

To define a Boolean type:
```
<exp> ::= true | false
```

The language also supports a variety of arithmetic operations that can be used to manipulate multiple integers. 
```
<exp> ::= <exp> "+" <exp> | <exp> "-" <exp> | <exp> "*" <exp> | <exp> "^" <exp> 
<exp> ::= <exp> "modulo" <exp> | <exp> "div" <exp> 
```

It is also possible to compare two Integer types to get a Boolean type that can be used later in if statements or while loops. 
```
<exp> ::= <exp> "<" <exp> | <exp> ">" <exp> | <exp> "<=" <exp> 
<exp> ::= <exp> ">=" <exp> | <exp> "==" <exp> | <exp> "!=" <exp>
```

As mentioned before, there are multiple functions that can be performed on lists:
```
<exp> ::= <exp> "." **get** "(" <exp> ")" | <exp> "." **take** "(" <exp> ")" | <exp> "." **drop** "(" <exp> ")" 
<exp> ::= <exp> "." **sum** "(" ")" | <exp> "." **reverse** "(" ")" | <exp> "." **length** "(" ")" 
<exp> ::= <exp> "." **push** "(" <exp> ")" | <exp> "." **pop** "(" ")"
```

Lastly, Splash language also has two types of if statements and a while loop:

```
<exp> ::= **if** "(" <exp> ")" "{" <exp> "}" **else** "{" <exp> "}"
<exp> ::= **if** "(" <exp> ")" "{" <exp> "}"
<exp> ::= **while** "(" <exp> ")" "{" <exp> "}"
```

## Main Language Features

The main benefit of this language is the ability to apply multiple functions on a List. Here are some example that will show the use of said ability:

```
Integer x = 0 
Integer y = 7 
List list = [1,2,3,4,5]
x = list.pop()
list.push(y)
```

Pop() function on a list will return an element with index 0 and update the list after extracting the item. In this example x will be 1 and the list will be updated to [2,3,4,5].
Push() function will always require an Integer type inside of the brackets. The function will append the value to the beginning of a list, resulting in [7,2,3,4,5]

```
Integer x = 0
List xList = []
List yList = []
List list = [1,2,3,4,5]
x = list.get(x)
xList = list.take(2)
yList = list.drop(2)
```

To access one or more variables from a list, the user can use get() function which requires the position of a desired variable in a list. Alternatively, take() and drop() functions (often used in Haskell) can be used to achieve the same result. From the example above, it is evident that every variable has to be initialised before using it. In this example, x will result in 1, xList will be [1,2], and yList will be [3,4,5].

```
List list = [1,2,3,4,5]
Integer x = list.sum()
Integer y = list.length()
List xList = list.reverse()
```

Sum() function returns the sum of all integers - in this case x will be 15. Length() function returns the number of integers at the moment of calling a function. From the code above,y results in 5 and reverse() will make a reverse of the list, therefore, xList will be [5,4,3,2,1].

## Execution Model

After creating tokens, parsing the result, and getting a list of all instructions, the language starts working similarly to a CEK (Control, Environment, (K)ontinuation) model, created by Matthias Felleisen and Dan Friedman. Every instruction retrieved after parsing is sent to the CEK machine and stored in control. Afterwards, the machine looks for any binding variables that are needed for execution of the given instruction, and that have been priorly defined. In the case of introducing a new variable, the machine adds the binding of a variable name and the value in the environment. That environment then is used for further instructions.

Multiple instructions get evaluated in the same way, however, some differ. Arithmetic operations are evaluated in the same way: at first, the left side of the instruction is evaluated, to retrieve the value that is required by an operation; at the same time the right side is stored in Continuation; later the same is done for the right side. If both sides have the necessary values, the operation takes place and the result updates the environment or stores a new value in the environment accordingly. Comparison operators work in the same fashion.

When a list operation is being performed the model will look for the binding variable before completing the operation, in order to save the result in the environment.

Additionally, there are two if statements and a while loop that both have a block (list) of expressions that can be executed in different scenarios once or even multiple times. At first, the if statement evaluates the condition, and stores the if statement in Continuation in the meantime. If evaluated properly, a Boolean type value gets retrieved and used to understand which block of instructions is to be executed next. The while loop follows a similar principle - if the condition is evaluated to be true, it will execute the list of instructions and the new environment will be used together with the while loop stored in Continuation for further iterations until the condition returns false.

Lastly, CEK machine works through to the last state until a value is retrieved. Upon executing the last instruction, the environment gets retrieved with the updated bindings. 

## Type Checking and Error Messages

Before the parsed instructions get sent tot he CEK machine for evaluation, they first get sent to a type checker to understand if the construct matches the expected values. Concurrently, multiple error messages can be received after checking if the expected values match the types. During the process, an environment is also used to store the variable bindings.

If the type checker finds a problem during the evaluation, an error message gets displayed. If a new variable is introduced or an existing variable gets updated, an error message gets displayed saying: 

```
"Type <expected type> doesn't match <actual type> value"
```

Both in an arithmetic and a comparison operation, if one of the sides does not return an Integer, an error will be displayed saying: 
```
"Either one of the values does not return Integer"
```
For multiple list operations e.g. length(), sum() and reverse(), the type checker looks for the binding variable. If a list is not found in the environment, the following message will be displayed: 
```
"Type list not specified"
```
For list operations that also require an Integer type this error message can get displayed:
```
"Either you haven't specified list type or expression is not Integer: <variable type>. Expression Type: <expression type>"
```

After unsuccessful push operation a different message will be displayed: 
```
"You might not be pushing Integer in List. Variable Type: <variable type>. Expression Type: <expression type>
```

If a condition for if statements or while loop doesn't return a Boolean value, this error message will be displayed: 
```
"Condition does not return a boolean value"
```
Lastly if the user attempts to use a variable that hasn't been defined before, then a message will appear:
```
"Value has not been instantiated before!"
```

Coursework Mark -> 90%

