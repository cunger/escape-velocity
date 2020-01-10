---
title: "JavaScript"
summary: "Functions. Prototypes. Promises. Etc."
date: 2020-01-10
weight: 3
math: false
toc: true
---

# Expressions and statements

The two major syntactic categories in JavaScript are _expressions_ and _statements_. A program is a sequence of statements. Statements _do stuff_: they declare variables or functions, assign a value to a variable, define a conditional loop, evaluate an expression, and so on. Expressions produce a value.

Functions can be defined by means of a function declaration statement:
```
function f() {
  // ...
}
```
Or by means of an expression of the form `(function f() { ... })`. The latter can again occur everywhere an expression can occur, and allows for defining anonymous, i.e. unnamed, functions (`function () { ... }`).

## Conditional loops

### _If-then-else_ statement

```
if {
  // ...
} else {
  // ...
}
```
Can also be written as an expression of the form `condition ? expression : expression` (which thus can occur everywhere expressions can occur, e.g. as a function argument).

### _For_ loop

```
for (initialExpression; condition; incrementExpression) {
  // ...
}
```
Note that all three parts are optional and can be taken care of in the block instead, e.g. `for (; ;) { ... }` is possible. If no condition is given, JavaScript will assume `true`.

### _While_ loop

```
// Evaluating the condition before executing the block:
while (condition) {
  // ...
}

// Evaluating the condition after executing the block:
do {
  // ...
} while (condition);
// Thus, the block is executed at least once.
```

# Types and values

## Type system

JavaScript is dynamically typed, with the following types:

* Boolean (`true`, `false`)
* Number (floating-point numbers with their inherent imprecision, including `Infinity` and `NaN`)
* String (arbitrary size with any character from the UTF-16 character set, single or double quoted)
* Null (`null`)
* Undefined (`undefined`)
* Object (including `Function`, `Array`, etc.)

`typeof` returns one of the following:
* `"boolean"`
* `"number"`
* `"string"`
* `"undefined"`
* `"function"`
* `"object"`

In order to test whether an object is an array, use `Array.isArray(object)`.

## Null and Undefined

* The value `null` indicates a non-object, i.e. occurs where an object is expected. `typeof` tags it as `"object"` (see _The history of typeof null_ in [Chapter 9 of Speaking JavaScript](http://speakingjs.com/es5/ch09.html)).
* The value `undefined` indicates a non-value, i.e. is the value of uninitialized variables, missing parameters and missing properties, as well as the implicit return value of functions without an explicit `return` statement.

Trying to access a property on `null` or `undefined` throws an error.

## Objects vs primitives

Objects are mutable, all other values are primitives and immutable.

Primitives are compared by value (just beware that `NaN` does not equal anything, not even itself) and passed by value, while objects are compared by reference (thus are strictly equal only to themselves) and passed by reference.

The primitive types Boolean, Number, String have object constructors that create wrapper objects holding the corresponding primitive value.
When a function is called on a primitive value, as in `"fnord".toUpperCase()`, the corresponding constructor is called in order to create a temporary object of the appropriate type. In this case, a function is called on a string, which leads to the creation of a temporary object by means of the `String` constructor function. That object has `String.prototype` as its prototype, which implements methods like `toUpperCase`. This method's return value will be returned an the temporary object again destroyed. In this way, primitive values can "borrow" methods from the relevant constructor's prototype object.

## Type coercion

Type coercion is the conversion of a value of one type to a value of another type. JavaScript can convert to String, Number, and Boolean.

### Explicit type coercion

As functions, wrapper object constructors convert to the corresponding primitive type.

* `Number(undefined) ==> NaN`
* `Number(null) ==> 0`
* `Number(false) ==> 0`, `Number(true) ==> 1`
* Given a string, it parses it as a number, e.g. `Number('3.14') ==> 3.14`. If that fails, it return `NaN`.
  Alternatively use `+x`, or `parseInt(x, 10)` and `parseFloat(x)`, which is especially useful if the input string also contains a unit:
  ```
  parseInt('20pt', 10) // 20
  Number('20pt')      // NaN
  ```

* `String()` does the obvious (except for conversion to primitives, see end of [Chapter 8: Values](http://speakingjs.com/es5/ch08.html)).
  Preferred over `x.toString()`, as the latter throws an error when called on `null` or `undefined` and can be overridden by individual objects (and thus lead to unexpected results). If you want a JSON string, use `JSON.stringify(x)`, which prints everything as `null` that doesn't convert into a JSON value (e.g. functions and `undefined`). When called on an object that implements `toJSON()`, it calls that method.

* `Boolean(x)` converts `x` to `false` if it is falsy, and to `true` otherwise. Falsy values are:
    * `false`
    * `null`, `undefined`
    * `0`, `NaN`
    * `''`

  Alternatively, `!!x` can be used to convert any value into a Boolean, due to the way `!` works (see [Booleans](booleans.md)).

### Implicit type coercion

Many operators and methods try very hard to coerce operands and arguments to the type they need, as the first version of JavaScript did not have exception handling.

Binary operators in general trigger numeric conversion:
* comparison operators (`>`, `<`, `<=`, `>=`)
* arithmetic operators (`-`, `+`, `*`, `/`, `%`)
* loose/lenient equality (`==`, `!=`)

With the exception that comparison and equality operators don't trigger numeric conversion if both operands are strings, or any operand is `null` or `undefined`, and `+` triggers string conversion if any operand is a string.

If an operand is an object, it is first converted to a primitive (meaning to a Number or String), roughly following [this algorithm](https://gist.github.com/samoshkin/baf070ab19b73f4f39ec54149fb37c30#file-js-to-primitive-internal-js). Note that, as a result, arrays are converted to strings.

Also note that `{` at the beginning of a line is always interpreted as a block statement, not as an object, thus for the operation it is ignored:
```
{}+[]+{}
==> +[]+{}
==> 0 + {}
==> 0 + '[object Object]'
==> '0[object Object]'
```

Strict equality (`===`, `!==`) does not perform type coercion.

# Booleans

**Logical Not (`!`)** converts its operand to a Boolean and then negates it, thus returns a Boolean.

Binary logical operators are:
* _Value-preserving:_ They always return either one of the operands, unchanged.
* _Short-circuiting:_ The second operand is not evaluated if the first operand already determines the result.

**Logical And (`&&`)**:
If the first operand can be converted to `false`, return it. Otherwise, return the second operand.

**Logical Or (`||`)**:
If the first operand can be converted to `true`, return it. Otherwise, return the second operand.

# Arrays

_Arrays_ are objects where
* _elements_ are all values that have been assigned to non-negative integer keys, and
* the property `length` is 1 larger than the highest such key (it is therefore not necessarily equal to the number of elements).

Elements should be accessed via `array[index]` instead of dot notation.

Note that negative integers don't count as array indices, thus `array[-1]` will try to look up the key `"-1"`. For accessing the last element in an array, use `array[array.length - 1]` or `array.slice(-1)[0]`.

The `length` property can be explicitly set. Setting it to less than the current length truncates the array. Setting it to more does not create keys for the additional, non-present elements; however, empty slots will be shown when printing the array.

## Arrays as stacks and queues

The following methods are all mutating:

* `array.pop()` and `array.push(...values)`
* `array.shift()` and `array.unshift(...values)`

## Slice and splice

* `array.slice(startIndex = 0, exclusiveEndIndex = array.length)` returns the subarray as a new array. Also allows negative indices as `startIndex` for access counting from the end of the array. With defaults useful for (shallow) copying an array: `copy = array.slice()`.

* `array.splice(startIndex, deleteCount, values)` removes `deleteCount` elements, starting from `startIndex` and replacing them by `values`. In contrast to `slice`, `splice` is mutating the array.

## List processing

_Iteration:_
* `forEach(function)` always returns `undefined`, independent of the return value of the passed callback function.
```
array.forEach(function (element) {
  return false; // This is the return value of the anonymous function and will be ignored.
}); // ==> undefined
```
Also, `forEach` always iterates over the whole list; the only way to break out is by throwing an error.

_Filter and transform:_
* `filter(function)` returns a new array.
* `map(function)` also returns a new array.
* `array.sort(function)` sorts the array in place, i.e. is mutating. Note that without providing a comparison function (returning a number <0, 0, >0), the default sort comparison is by string Unicode points, with all array elements being converted into strings (yes, also numbers!).

_Checks:_
* `some(function)`
* `every(function)`

The callback function passed to `forEach`, `filter`, `map`, `some` and `every` is called with three arguments: the current element, its index, and the array over which is iterated.

_Folding:_
* `array.reduce(function, initialValue?)`, where `function` is being passed four arguments: the so far accumulated value, the current element, the index of the current element, and the array that is processed. If the `initialValue` is not given, `reduce` uses the first element of the array as initial value.
* Analogously for `reduceRight`.

# Functions

In JavaScript, functions are first-class citizens.

A function declaration creates a function as well as a variable with the function name, to which the function is assigned as value. That is, the following two are in principle equivalent (however, differing when it comes to [hoisting](scope.md)):
```
function fnord() {
  // ...
}

var fnord = function () {
  // ...
};
```

When a function created by a function declaration is called, we speak of _function invocation_; when a function created as a property of an object (i.e. a _method_) is called, we speak of _method invocation_.

All functions can be invoked in two ways:
* as a function: `f(args)`
* as a constructor: `new f(args)`

For _constructor functions_, see [object creation](object-creation.md).

## Pure functions

A _pure_ function
* is referentially transparent, i.e. given the same inputs, the output is always the same, and
* does not produce any side effects.

In particular, this means it doesn't depend on or modify variables outside of its scope.

## Input

When invoked, the arguments passed to the function are bound to the function parameters. Missing parameters have `undefined` as value, excess parameters are ignored but are accessible within the function body via `arguments`. `arguments` is array-like, but not an array; in order to turn it into an array:
* `Array.prototype.slice.call(arguments)`
* `Array.from(arguments)` (ES6)

ES6 introduces [rest parameter syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters):
```
function f(a, b, ...rest) {
  // ...
}
```
Which allows for collecting arguments into an array (a real one, unlike `arguments`).
It looks exactly the same as [spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), also introduced by ES6, which allows for expanding an array into its elements, as in `someFunction(...array)`.

ES6 also introduces default values:
```
function f(start = 0, count = 10, end = start + count) {
  // ...
}

// ES5 pattern for defaults:
function f(start, count, end) {
  start = start || 0;
  count = count || 10;
  end   = end   || start + count;

  // ...
}
```
Default values are used whenever the argument is `undefined` - both when it is left out and when it is explicitly set to `undefined`.

Arguments are bound to parameters from left to right, independent of default values:
```
function f(a = 1, b) {
  return [a, b];
}

f();  // [1, undefined]
f(2); // [2, undefined]
```

## Output

Functions without an explicit `return` statement have `undefined` as return value.

## Closures

When a function is defined, a _closure_ is created.

> A closure is the combination of a function and the lexical environment within which that function was declared.
-- MDN

> A closure is a function plus the connection to the scope in which the function was created. The name stems from the fact that a closure “closes over” the free variables of a function[, i.e. the variables not declared within the function].

Closures thus preserve the function's access to all variables in its own as well as in its surrounding scopes. This access is retained throughout the life-time of the function, independent in which scope it is invoked. Note that this means access to the identifiers; functions will look up the corresponding values only when invoked.  

Closures play a key role, for instance, in [private data](private-data.md) and partial function application.

### Partial function application

Partial function application is the process of applying a function to some of its parameters and return a function that expects the rest of the parameters.

_Example:_
```
function fMap(fn, list) {
  return list.map(fn);
}

function fMapWith(fn) {
  return function (list) {
    return fMap(fn, list);
  }
}

const incrementElements = fMapWith(x => x + 1);

incrementElements([1, 2, 3]);
incrementElements([1, 3, 5, 7]);
```

Partial application like this relies on the facts that JavaScript supports closures (so the returned function can access `fn`, even when invoked in a different context) and that functions are first-class citizens, i.e. can be arguments and return values.

A generic version for arbitrarily many arguments looks like this (very similar to what `bind` does):
```
function partial(fn) {
  var args = Array.prototype.slice.call(arguments, 1);
  var self = this;

  return function() {
    return fn.apply(self, args.concat(Array.prototype.slice.call(arguments)));
  };
}
```

Finally, _currying_ is the process as transforming a function of _n_ arguments such that it can be called as a chain of _n_ functions each with a single argument. This has no real use case in JavaScript, though. Cf. [Ben Alman](http://benalman.com/news/2012/09/partial-application-in-javascript/):
* In functional languages like Haskell, every function is inherently curried, i.e. takes exactly one argument. Applying a function to several arguments is basically syntactic sugar for chained applications of a curried function.
* In JavaScript, function application is defined to take all arguments, i.e. functions are inherently uncurried.   

# Execution context

Functions initially have no context, but receive one when they are executed.
Thus with every function invocation, the function has access to its _execution context_, through the keyword [`this`](this.md).

Binding a function to its execution context happens when the function is executed, not when it is defined.
Since functions are first-class citizens, they can be removed from their objects, passed around, and executed in a variety of different contexts.

## Implicit execution context

Upon **function invocation** (e.g. `smile()`), the execution context, and thus `this`, is the global object, because the function is implicitly called on the global object. That is, `window` in the browser environment, and `global` in Node (and `module.exports` within a module).

`this` also refers to the global object outside of any function scope. Unless in strict mode, then it is `undefined`.

Upon **method invocation** (e.g. `person.smile()`), there is an explicit receiver; the execution context, and thus `this`, is the calling object.
Just don't get confused with _explicit_ and _implicit_: When executing `person.smile()`, the execution context of `smile` is implicitly bound to `person`, as this is the explicit receiver of the function call.

```
var obj = {
  method: function () {
    function whereAmI() {
      console.log(this);
    }

    whereAmI();    // this === global object, because function invocation
  }
};

obj.method();      // this === obj, because method invocation

func = obj.method;
func();            // this === global object, because function invocation
```
See also _context loss_ below.

## Explicit execution context

The execution context can also be changed explicitly by means of `call`, `apply`, and `bind`.
`call` and `apply` explicitly bind a function's execution context to an object when invoking the function:
```
func.call(obj, arg1, arg2); // this === obj
func.apply(obj, args);      // this === obj

func.call();                // this === global
obj.func.call();            // this === global
```

`bind` permanently binds a function to a provided object. It creates and returns a new function that always uses the provided object as execution context. (Except for when the function is called as a constructor with `new`, then `this` will be the newly created object.)

Here's roughly how `bind` works:
```
Function.prototype.bind = function (context) {
  var args = Array.prototype.slice.call(arguments, 1);
  var self = this;

  return function() {
    return self.apply(context, args.concat(Array.prototype.slice.call(arguments));
  };
}
```
That is, `bind` uses _partial application_.

## The value of `this`

> `this` is the current execution context of a function

Functions are initially unbound, but dynamically bound to a context object at execution time.
In order to know what `this` points to, you have to answer: What is the calling object?

* When a function is defined on the global object and called without an explicit receiver (`greet(name)`),
`this` is the global object.
* When a function is called with an explicit receiver (`object.greet()`), `this` is the calling object.
* When a function is called by means of `call` or `apply`, `this` is explicitly provided.
* When a constructor function is called with the `new` operator (`new Greeting()`), `this` refers to the newly created object.

Binding a function to an object (`greet.bind(object)`) returns a new function, for which `this` always refers to that object.

## Context loss

The execution context does not propagate to nested functions. That is:
```
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }

    fun(); // will log global
  }
};
```

One option is to explicitly bind `this` to a variable and use that variable:
```
var obj = {
  method: function () {
    var self = this;

    function fun() {
      console.log(self);
    }

    fun(); // will log obj
  }
};
```
Another option is to either explicitly provide the context upon execution:
```
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }

    fun.call(this); // will log obj
  }
};
```
Or bind the method to the object:
```
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }.bind(this);

    fun(); // will log obj
  }
};
```

Note that context loss is a problem in all nested functions, e.g. also with `forEach`, `map`, `every`, `some`:
```
var obj = {
  stuff: [],
  method: function () {
    stuff.forEach(function (element) {
      // this === whatever context with which `forEach` calls the callback
    })
  }
}
```
These methods therefore take an optional context argument (e.g. `forEach(callback, [thisArg])`):
```
 var obj = {
   stuff: [],
   method: function () {
     stuff.forEach(function (element) {
       // this === obj
     }, this)
   }
 }
```

# Variable scope

JavaScript variables are lexically scoped, i.e. the structure of the source code determines which variables are accessible where.

Each scope has access to the variables it contains and to the variables in the scopes that surround it.

Variables declared via `var` are function-scoped. That is, functions create a new scope, while code blocks (`{ ... }`) do not. `var` variables are hoisted, and when declared in the global scope, they are added to the global object.

In ES6, variables declared via `let` and `const` are block-scoped, i.e. their scope is the innermost enclosing block. They are not subject to hoisting and are not added to the global object.

```
var x = 0;
let y = 1;

this.x; // => 0
this.y; // => undefined
```

In ES5, a common pattern to mimic block scope (and thus limit the lifetime of a variable, either to make it private or to avoid global variables) is an _immediately invoked function expression_ (IIFE):
```
(function () {
  // ...
}());
```
IIFEs can, of course, be passed parameters and given a meaningful name, just like any other function expression:
```
var x = 23;

(function meaningfulName(number) {
  // ...
}(2 * x));
```

## Identifier look-up and hoisting

Prior to code execution, identifiers are resolved and associated with their scope, in the following order:

* `this`, `arguments`
* function parameters (thus calling a function parameter `arguments` overrides the pre-defined one, also using `a, b, a`, the second `a` will override the first one)
* function declarations
* variable declarations

> [T]here is always a chain of environments, starting with the currently active environment, continuing with its outer environment, and so on[, ending with] with the global environment. [...]
> To resolve an identifier, the complete environment chain is traversed, starting with the active environment.

When looking up an identifier, the JavaScript engine searches the scope hierarchy from bottom (local scope) to top (global scope), taking the first match it finds. Thus variables in a nested scope shadow variables with the same name in a higher scope.
When not finding an identifier doing right-hand side look-up, it throws a `ReferenceError`. When not finding a name doing left-hand side look-up, it declares it as a property of the global object.   

In this process, function declarations (including the function body) as well as variable declarations (without the assignments) are _hoisted_, that is they are processed first within their immediate scope, where function declarations are hoisted before variable declarations.

**Example** (from [Ben Cherry](http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html)):

```
var foo = 1;

function bar() {
  if (!foo) {
    var foo = 10;
  }

  console.log(foo);
}

bar();
```
Is equivalent to:
```
function bar() {
  var foo;

  if (!foo) {
    foo = 10;
  }

  console.log(foo);
}

var foo;

foo = 1;

bar();
```

Keep in mind that function expressions are not hoisted, i.e. `var f = function () {...}` behaves just like any other variable assignment, with the declaration being hoisted, the function definition not.

# Private data

IIFEs are a way to create temporary, private scope, and closures turn that _temporary_ into _as long as a reference to the function lives_.

Here's an example from Douglas Crockford:
```
var digitName = function () {
  var names = ['zero', 'one', 'two', 'three', 'four',
               'five', 'six', 'seven', 'eight', 'nine'];

  return function (n) {
    return names[n];
  };
}();
```

## Private data in objects

Private data in a function:
```
var func = function () { // open IIFE
  var private1 = ...;
  var private2 = ...;

  return function () {
    // use private stuff
  }
}();
```

Private data in a singleton object:
```
var obj = function () { // open IIFE
  // private data
  var counter = 0;

  // public data
  return {
    publicField: true;
    publicMethod: function () {
      // ...
    }
  };
}();
```

Private data in an object via its constructor:
```
function Constr() {
  var that = this; // in order to available to private functions

  // private data
  var counter = 0;

  function privateFunction() {
    counter++;

    // public data
    that.publicField  = ...;
    that.publicMethod = ...;
  }

  // other public data
  that.anotherPublicField = ...;
}
```

## The module pattern

```
var Module = (function() {
  var private1 = 'foo';
  var private2 = 0;

  function privateMethod() {
      // ...
  }

  return {
    publicProperty: '',
    publicMethod: function(args) {
        // do something
    },
    privilegedMethod: function(args) {
        // do something with private data
    }
  };
})();
```

## Alternatives

For data that is not secret but simply should not be relied on when using an API,
it can be enough to follow the convention to start names of private properties
with an underscore, e.g. `_counter`. This way, they're accessible for testing
and inspection, while others know that they're not meant as public interface.

# Objects

Objects are roughly maps from strings to values. A key-value pair is called a _property_, and _methods_ are properties whose values are functions.

Objects are created by constructors (e.g. the pre-defined constructors `Object`, `Array,` etc.) or by means of special literals:

* Object literals: `{}`
* Array literals: `[]`
* Regular expression literals: `//`

Property names can be any valid string, property values can be any valid expression.

Properties can be accessed in two way:

* _dot notation_: `object.property`, upon which the string `"property"` will be looked up among the property names of the object.
* `object[key]`, where `key` can be any expression, which will be evaluated, with the return value being coerced into a String. If that string does not exist among the keys, it returns `undefined`.

To delete a property, use `delete object.property;`.

Object properties can capture _state_ as well as _behaviour_ (in object _methods_, i.e. properties that happen to have a function as value).
Objects thus organize code by putting related data and functions together.

Keep in mind that `{` at the beginning of a line is always interpreted as a block statement, not as an object. For example:
```
{ foo: 'bar' }['foo']; // ==> ['foo']
{} + {};               // ==> +{}
                       // ==> NaN
```

`Object.freeze(obj)` prevents all properties of `obj` to be re-assigned. Note that the references of those properties are frozen; their values can, however, still be mutated. Frozen objects cannot be unfrozen.

## Global object

When running, JavaScript creates a global object, which serves as implicit execution context.
* In the browser this is `window` (standardized in the browser's DOM, not in ECMAScript).
* In Node it is `global`.

In the browser, declared variables and functions are added as properties to the global object.
They carry a _Don't Delete_ flag, so they cannot be deleted.
```
var name = 'Bobbo';
function say() {}

this === window;    // => true

window.name;        // => 'Bobbo'
window.say;         // => function say() {}

delete window.name; // false
delete window.say;  // false
```

Undeclared variables are also added to the global object but can be deleted:
```
y = 1;

window.y;           // => 1
delete window.y;    // true
```

Node is a modular environment, therefore the execution context in the Node console is different.
Declared variables are local variables within the module's scope.
```
var name = 'Bobbo';
function say() {}

this === module.exports; // => true

module.exports.name;     // => undefined
module.exports.say;      // => undefined

global.name;             // => undefined
global.say;              // => undefined
```

Undeclared variables are added to the global object:
```
y = 1;                   // added to global

global.y;                // => 1
module.exports.y;        // => undefined
```

# Prototypes

There are no classes; objects inherit directly from other objects. More specifically: Every object has an internal [property](http://2ality.com/2012/10/javascript-properties.html) `[[Prototype]]` that points to another object, its _prototype_. It can be accessed by `__proto__` or (for browser compatibility reasons much preferred) `Object.getPrototypeOf(obj)` and checked by `pobj.isPrototypOf(obj)`. For functions this is by default `Function.prototype`, for arrays it's `Array.prototype`, etc.

Note that `foo.isPrototypeOf(bar)` is transitive, i.e. checks whether `foo` is anywhere in the prototype chain of `bar`, while `Object.getPrototypeOf(bar)` returns the object that is the value of `bar`'s internal `[[Prototype]]`' property, i.e. it's immediate prototype.

The **prototype chain** of an object is a sequence of objects starting with the object referenced by the object's internal `[[Prototype]]` property, followed by the reference of that object's `[[Prototype]]` property, and so on, until the referenced object is `Object.prototype`, which is each object's prototype and does not have a prototype itself. `Object.prototype` implements methods like `toString`, `valueOf`, `hasOwnProperty`, `isPrototypeOf`, etc.

Behaviour is shared between objects by **delegation**: When trying to access a property of an object, JavaScript first checks the object itself, and if it does not find a property of that name, walks through the prototype chain until it finds it or runs out of prototypes. An object thus delegates each property that is does not specify itself to the first object on its prototype chain that does specify it. At the same time it can override prototype behaviour by specifying the property as its own.

In order to check whether a property exists on the object as opposed to one of its prototypes, use `obj.hasOwnProperty('key')` or `Object.getOwnPropertyNames(obj)`.

## Constructor functions  

Every function in addition has a `prototype` property that points to an object that serves as prototype for all objects created by that function when invoked as a constructor (and is the object where all shared behaviour of those created objects is stored). That prototype has a `constructor` property that points back to the function. This `constructor` property is also used by the `instanceof` operator to test whether a value has been created by a particular constructor function (checking whether this constructors `prototype` is in the prototype chain of the object).

## Example

```
function Dolphin(name) {
  this.name = name;
}

const flipper = new Dolphin('flipper');
```

![Prototype hierarchy with Dolphin](/images/docs/proto1.png)

```
function Animal() {}

Dolphin.prototype = Object.create(Animal.prototype);
Dolphin.prototype.constructor = Dolphin; // otherwise `flipper instanceof Animal` won't work

// Never do: Dolphin.prototype = Animal.prototype;
// Because then they're the same object instead of being in a hierarchy,
// so all methods added to Dolphin will end up on Animal as well (and thus
// also on all objects that inherit from Animal).
```

![Prototype hierarchy with Dolphin and Animal](/images/docs/proto2.png)

# Object creation

Since there are no classes, objects can be created directly. If you need only one object, the most straightforward way is by means of an object literal, for example:
```
var obj = {
  property: 'value',
  method: function () {
    return true;
  }
};
```

If you want it to hold private data, you can use an IIFE. For example:
```
var counter = (function () {
  var i = 0;

  return {
    get: function () {
      return i;
    },
    set: function (value) {
      i = value;
    },
    increment: function () {
      i += 1;
      return i;
    },
  }
}());
```

If you need more than one object of the same kind, specify a way to create those objects, such that they can share behaviour.

## Factory pattern

A _factory function_ instantiates and returns a new object, thus allowing for the creation of objects based on a pre-defined template.

```
function makePoint(x, y) {
  // var private = 'private data here';

  return {
    x: x || 0,
    y: y || 0,
    distanceFromOrigin: function () {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    }
  };
}

var point1 = makePoint();
var point2 = makePoint(1, 1);
```

Disadvantages:
* Methods are duplicated on each created object.
* New objects are created as `Object`s, and their origin or specific type is unknown unless that information is explicitly added to the object upon creation.

## Pseudo-classical constructor pattern

A _constructor function_ is supposed to be invoked with the `new` operator, which instantiates a new object behind the scenes and provides it to the constructor function as `this`.

```
function Point(x, y) {
  // Scope safety
  if (!(this instanceof Point)) {
    return new Point(x, y);
  }

  // State -> each object created from this constructor
  // will have those properties as its own properties
  this.x = x || 0;
  this.y = y || 0;
}

// Shared behaviour -> only the prototype has the property,
// all objects created from it delegate method calls to it
Point.prototype.distanceFromOrigin = function () {
  return Math.sqrt(this.x * this.x + this.y * this.y);
};

var point1 = new Point();     // or: Point()
var point2 = new Point(1, 1); // or: Point(1, 1)
```

All properties set in the constructor function will be own properties of the created object, all properties set on the prototype will be delegated.

> The constructor is responsible for setting up instance-specific data, the prototype contains shared data (i.e., the methods).
-- [2ality](http://2ality.com/2012/01/js-inheritance-by-example.html)

If the created objects don't need a unique state at the beginning, the created object can be empty initially and delegate everything, for example:

```
function MyObject() {}

myObject.prototype.p1 = ...
myObject.prototype.p2 = ...
```

When reassigning the `prototype` to a new object, make sure to set the otherwise lost `constructor` property.
For example:
```
Point.prototype = {
  x: 0,
  y: 0,
};

Point.prototype.constructor = Point;
```

## Object linking to other objects (OLOO) pattern

```
// Create prototype object
var Point = {
  x: 0,
  y: 0,

  init: function(x, y) {
    this.x = x;
    this.y = y;

    return this;
  },

  distanceFromOrigin: function () {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  },
};

var point1 = Object.create(Point);
var point2 = Object.create(Point).init(1, 1);
```

Note that `instanceof` does not work here, because it expects a _constructor_ as argument. Instead, use `Point.isPrototypeOf(point1)`.

# Behind the curtains

### `new`

* A new object is created using the constructor function.
* The constructor function is executed with `this` set to the new object.
* If the constructor function has no explicit return, the new object is returned.

```
function newOperator(Constructor, args) {
  var object = Object.create(Constructor.prototype);
  var result = Constructor.apply(object, args);

  return result === undefined ? object : result;
}
```

### `Object.create`

```
function create(object) {
  function F() {};
  F.prototype = object;

  return new F();
}
```

# Common patterns


### Boolean checks

```
// Does an array contain an element?
array.indexOf(element) !== -1; // ES5
array.includes(element);       // ES6

// Does an object contain a key?
object.hasOwnProperty('key');

// Is a value numeric?
function isNumeric(value) {
  return typeof(value) === 'number' && !isNaN(value);
}
```

### Iterating over an object

```
Object.keys(object).forEach(function (key) {
  // ...
});

var values = Object.keys(object).map(key => object[key]);
// ES2017: Object.values(object)
```

### Shallow copying and merging of objects

```
var object1 = ...
var object2 = ...

var copy1  = Object.assign({}, object1);
var merged = Object.assign(copy1, object2);
```

`Object.assign(target, ...sources)` copies the values of all enumerable own properties of the source objects
to the target object and returns `target`.

### Sorting numbers

```
function sortAscending(array) {
  return array.slice().sort(function (x, y) { return x - y });
}

function sortDescending(array) {
  return array.slice().sort(function (x, y) { return y - x });
}
```

### Collection pipes

Counting occurrences:

```
array.reduce(function (counts, element)) {
  counts[element] = (counts[element] || 0) + 1;
  return counts;
}, {});
```

Finding the minimum:

```
array.reduce(function (currentMin, currentElement) {
  if (currentElement < currentMin) {
    return currentElement;
  } else {
    return currentMin;
  }
});
```

### Current date and time

```
var today = new Date(); // 2018-02-26T08:29:07.229Z, type: object
var today = Date();     // "Mon Feb 26 2018 09:29:35 GMT+0100 (CET)", type: string
var now   = Date.now(); // 1519633775731, type: number

var year  = new Date().getFullYear();
```

### Random integer within range

```
// Returns a random integer between min and max (inclusive)
function random(min, max) {
  return min + Math.floor(Math.abs(max - min + 1) * Math.random());
}
```

### Enum-like objects

```
const Weekday = Object.freeze({ Monday: 1, Tuesday: 2, ... });
```

# Promises

_Promises_ are objects that have a `then` method which takes two (optional) function arguments:
* a handler that is called when the promise is fulfilled, and
* a handler that is called when it is rejected.
The return value of `then` is another promise that is fulfilled when the called handler finishes, and fails when the called handler throws an error.

```
promise.then(onFulfilled, onRejected);
```

Syntactic sugar for `then(null, onRejected)`:
```
promise.cath(onRejected);
```

A promise first goes into a _pending_ state, and then into a _settled_ state, once it resolved to being either _fulfilled_ (with a return value) or _rejected_ (with a reason).

The handler functions need to either return another promise, or return a value if it succeeds or otherwise throw an error.

## Example: get the current position of the client

Without promises:

```
navigator.geolocation.getCurrentPosition(
  function (position) {
    console.log('Latitude:  ' + position.coords.latitude);
    console.log('Longitude: ' + position.coords.longitude);
  },
  function (error) {
    console.log(error.message);
  }
);
```

With promises:

```
function promiseToGetCoordinates() {
  return new Promise(function (fulfill, reject) {
    navigator.geolocation.getCurrentPosition(
      function (position) {
	fulfill(position.coords);
      },
      function (error) {
	reject(error);
      }
    );
  });
}

promiseToGetCoordinates()
.then(
  function (coordinates) {
    console.log('(' + coordinates.latitude + ',' + coordinates.longitude + ')');
  },
  function (error) {
    console.log(error.message);
  }
);
```

## Creating promises

```
new Promise(function someCalculation(fulfill, reject) {
  result = // some calculatation

  if (successful) {
    fulfill(result);
  } else {
    reject(new Error('Oops.'));
  }
});
```

## Chaining promises

Example:

```
var data = new FormData();
data.append('key', 'value');

fetch('https://url/update', {
  method: 'POST',
  body: data
})
.then(function (response) {
  if (response.ok) return response;
  throw new Error('Fetch failed.');
})
.then(response => response.json)
.then(jsonNode => parse(jsonNode))
.then(json     => process(json))
.then(result   => console.log(result) || result) // logs and returns result
.catch(error   => console.error(error));
```

## Lists of promises

```
Promise.all([
  promising1,
  promising2,
  promising3
])
.then(allFulfilled, firstRejected);
```

```
Promise.race([
  promising1,
  promising2,
  promising3
])
.then(firstFulfilled, firstRejected);
```

# References

* [Axel Rauschmayer: Speaking JavaScript](http://speakingjs.com/es5/index.html)
* [Alexey Samoshkin: JavaScript type coercion explained](https://medium.freecodecamp.org/js-type-coercion-explained-27ba3d9a2839)
* [Nolan Lawson: We have a problem with promises](https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html)
