---
title: "Ruby"
summary: "\"Finding out what you're called and repeating your name.\""
date: 2020-01-10
weight: 5
math: false
toc: true
---

# Objects, classes and hierarchies

OOP is all about **objects**, their state and behavior. **State** is captured by instance variables and usually differs from object to object. **Behavior** is captured by methods and is usually the same across objects of the same kind.

**Classes** group objects with the same attributes and behaviors, and thus provide a way to define attributes and behaviors of objects in one place. Objects are then created from classes, inheriting the functionality defined in the class.

> A class is like a blueprint that describes the properties and behavior of a type of object. An instance of a class then is an actual object of that class.

```ruby
# Named class

class Something
end

some_instance = Something.new

# Anonymous class

some_class = Class.new
def some_class.some_method; end

some_instance = some_class.new
some_instance.some_method
```

_Class methods_ (like `Dolphin::oldest`) are methods that are defined and called directly on class objects.
_Instance methods_ (like `Dolphin#name`) are methods accessible to and called on instances.

Ruby is very consistent in its take on OOP: everything is an object, including what are primitives in many other OOP languages, like strings, integers, Boolean values, and `nil`, as well as classes, modules, and so on. When it comes to instantiation, variable accessibility, and so on, classes behave pretty much like objects, because they are objects. What distinguishes classes is that they are the only objects that can spawn other objects.

OOP is one way to realize **encapsulation** and **inheritance**.

## Encapsulation

Encapsulation refers to exposing only that which is necessary to expose, and hiding everything else.

In Ruby, methods are by default public in the sense that they are accessible from anywhere as long as the class or object name is known. Ruby provides two ways to hide methods, so they are no longer accessible from everywhere:

* The method `private` makes method definitions private, i.e. they are accessible only within the class.
* The method `protected` makes method definitions protected, i.e. they are accessible only across instances of that class.

Encapsulation has at least two advantages:

* Methods that provide implementation details can be hidden, so they cannot be used anywhere outside of the class. This makes it possible to later change those methods without possibly breaking other parts of the program that use this method.
* Exposing as little as necessary goes a long way in avoiding name clashes.

## Inheritance

Grouping things into different classes of objects provides a natural concept of inheritance, that allows for re-using functionality, while being able to override more general functionality for more specific cases.

Inheritance is a way to inherit behavior from another class or module. All instance methods defined in a class or module from which a class `C` inherits will become instance methods of all instances of `C`. Thus the current object has access to all instance methods defined somewhere in the inheritance hierarchy. Inheritance thus allows for re-using methods and thereby avoiding duplicate code.

```ruby
class Animal
  def move
    puts "I'm moving!"
  end
end

class Dolphin < Animal
end
```

As a subclass, `Dolphin` inherits all methods defined in `Animal`, `move` can therefore be called on an instance of `Dolphin`, as in the following example.

```ruby
Dolphin.new.move
"I'm moving!"
=> nil
```

Inheritance also enables **polymorphism**, i.e. allows objects to be of different kinds (and accordingly adopt different behaviors).

## Single inheritance

A class can be direct subclass of exactly one other class. Single inheritance is a problem when a class is supposed to inherit behavior from two or more classes which are not (and should not be) in a subclass relation.

For example, we could have two classes `SwimmingObject` and `FlyingObject` for objects that swim and fly, respectively. A class `Duck` should inherit from both classes, as ducks can both swim and fly. However, subclassing allows for only one direct superclass, thus we can have either `class Duck < SwimmingObject` or `class Duck < FlyingObject`.

The only option to inherit from both by means of class inheritance would be to define `FlyingObject` as subclass of `SwimmingObject` or vice versa. But this means that a class inheriting from one will always also inherit from the other, which gets us into trouble as soon as we want objects that can fly but not swim (e.g. chicken) as well as objects that can swim but not fly (e.g. penguins).

Ruby has single inheritance, i.e. a class can have only one superclass. The superclass of `Class` is `Module`.
```ruby
> Class.ancestors
=> [Class, Module, Object, Kernel, BasicObject]
```

## Modules

Modules are collections of methods and constants, and a class can gain access to those by including the module. Most importantly, a class can include arbitrarily many modules. Thus, when defining swimming- and flying-related methods in modules instead of classes, as in the following code, the class `Duck` can inherit those methods by including both modules. Now we can also have a class `Chicken` that includes `Flying` but not `Swimming`, and a class `Penguin` that includes `Swimming` but not `Flying`.

```ruby
module Swimming
end

module Flying
end

class Duck
  include Swimming
  include Flying
end

class Chicken
  include Flying
end

class Penguin
  include Swimming
end
```

Classes and modules are collections of methods and constants, and classes are, in fact, modules. Classes are instances of `Class`, modules are instances of `Module` (with `Class` being a direct subclass of `Module`).

Also _classes_ and _modules_ are objects, namely instances of `Class` and `Module` (which themselves are objects).

> If you can reference it with a variable, it's an object.

Technically there are two differences between classes and modules:

* A class can spawn instances, a module cannot.
* A class can inherit from only one other class, but from as many modules as wanted.

On a conceptual level, classes define attributes and behaviors of objects that are of the same kind, with class inheritance capturing _is a_ relationships. Modules define behavior and functionality that can be shared among objects of different kinds, with module inclusion usually capturing _has a_ relationships.

# The method-lookup path

See also [this GitHub gist](https://gist.github.com/damien-roche/351bf4e7991449714533), and check using `some_class.ancestors`.

When resolving an identifier, Ruby checks:

* the class itself (local variables before methods)
* all modules included in the class (in reverse order of inclusion, and unless a module is included with `prepend` instead of `include` - in that case module methods take precedence over class methods)
* its superclass
* all modules included in its superclass
* ...
* `Object`
* `Kernel` (the module included in object)
* `BasicObject` (the parent of all classes)

## self and super

Note that `self` and `super` are keywords (not methods).

### super

> When you call `super` from within a method, it will search the inheritance hierarchy for a method by the same name and then invoke it.

In doing so, `super` always jumps to the next higher element of the method-lookup path. That is, if you include a module in a class, `super` will jump to that module before jumping to the superclass.
* `super` forwards all arguments passed to the method calling it to the method in `super`
* `super()` forwards no arguments
* `super(arg1, arg2)` forwards only the specified arguments

### self

`self` gives you access to the current object.

At the top level of a program, this is `main` (the built-in default object of type `Object`).

At the top level of a class or module, this is the class or module object.
```ruby
class C
  self

module M
  self
```

In a method (wherever: in a class or module, a singleton method of a specific object, or at the top-level), this is the object that responds to the method. Note that top-level methods are available to all objects.

An instance variable belongs to whatever object is `self` when the code containing the instance variables is executed.

# Object conversion

`Array(arg)` says:
> Returns `arg` as an `Array`. First tries to call `to_ary` on `arg`, then `to_a`.

`String(arg)` says something analogous:
> Returns `arg` as a `String`. First tries to call its `to_str` method, then its `to_s` method.

So they're methods for object conversion, transforming their argument using explicit and implicit object conversion.

*Explicit conversion* converts an object to the target type. For example, `obj.to_s` will give you a string representation of `obj`, and `obj.to_i` will give you an integer representation. If those methods are defined for `obj`, that is. The `Nil` class implements all of them:

```ruby
nil.to_s => ""
nil.to_a => []
nil.to_h => {}
nil.to_i => 0
nil.to_f => 0.0
nil.to_r => (0/1)
nil.to_c => (0+0i)
```

Ruby doesn't call explicit conversion methods unless you explicitly ask it to do so.

```ruby
"THX" + 1138      => TypeError
"THX" + 1138.to_s => "THX1138"
```

*Implicit conversion* is defined for objects that can be considered as something target type-ish. So `to_int` would be implemented for integer-like objects, that is objects that act like integers and thus make sense everywhere an integer makes sense. It wouldn't be implemented for objects that are not integer-like. Analogously for `to_str`, `to_ary`, `to_hash` and a few others. Hence the behavior of `nil`:

```ruby
nil.to_str  => NoMethodError
nil.to_ary  => NoMethodError
nil.to_hash => NoMethodError
nil.to_int  => NoMethodError
```

Some core Ruby operators and methods call implicit conversion methods. One example is `String#+`, which calls `to_str` on its argument, and thus fails, for example, for integers:

```ruby
"THX" + 1138
=> TypeError: no implicit conversion of Integer into String
```

Similarly, `String#*` calls `to_int` on its argument and therefore is fine being provided a `Float` (fortunately or unfortunately not attempting to print the string `3.14` times):

```ruby
"Yay!" * 3.14 => "Yay!Yay!Yay!"
```

Now it makes perfect sense why `Array(arg)` first tries `to_ary`: *Let's see whether this is already something like an array.* And only if that is not defined or returns `nil`, it calls `to_a`: *Ok, if it's not an array, let's make it one!*

What about hashes? `Hash(arg)` calls `to_hash`, and returns the empty hash for `[]` and `nil`. Period. No calling `to_h`.

```ruby
Hash([[1, 2]])   => TypeError: can't convert Array into Hash
[[1, 2]].to_hash => TypeError: can't convert Array into Hash
[[1, 2]].to_h    => {1=>2}
```

Turns out this conversion method is younger than the rest, because the whole issue is less obvious for hashes than it is for strings or arrays, so it evoked more discussion.

Finally, `Kernel` also defines numerical conversions, like `Float(arg)` and `Integer(arg)`, which convert numerical values directly into floats and integers, and for everything else fall back on `to_f` and `to_i`. Also, `Integer` is more refined than `to_i` when it comes to converting string representations of integers into numerical values. In particular, both are more picky than their `to_f` and `to_i` counterparts in expecting the given argument to be an object that can actually reasonably interpreted as `Float` or `Integer`.

```ruby
nil.to_f   => 0.0
Float(nil) => TypeError: can't convert nil into Float
Float("1138") => 1138.0
Float("THX")  => ArgumentError: invalid value for Float()
```

This makes them pretty useful for [numeric validation](https://pdxwolfy.wordpress.com/2016/04/12/numeric-validation-in-ruby/).

# Getters and setters

```ruby
attr_reader :name

# Equivalent to:

def name
  @name
end
```

```ruby
attr_writer :name

# Equivalent to:

def name=(name)
  @name = name
end
```

```ruby
attr_accessor :name

# Equivalent to:

attr_reader :name
attr_writer :name
```

**Note:** Syntactic sugar setter methods \(like `name=`\)

* are methods
* allow for syntax to look like assignment

```ruby
obj.name = 'Guybrush'

# Syntactic sugar for:

obj.name=('Guybrush')
```

```ruby
def name=(name)
  @name = name
  'Fnord!'
end

obj.name = 'Guybrush' # => 'Guybrush'
obj.name=('Guybrush') # => 'Guybrush'
```

* behave like assignment in that they always return the righ-hand side value, irrespective of the actual return value of the method

```ruby
def name=(name)
  @name = name
  'Fnord!'
end

obj.name = 'Guybrush' # => 'Guybrush'
obj.name=('Guybrush') # => 'Guybrush'
```

Private setters are an exception to the rule that private methods can never be called with an explicit receiver, even if that receiver is `self`. In fact, they require `self` in order to distinguish them from local variable assignments.

```ruby
def some_method
  self.var = value
  localvar = value
end
```

# Putting and printing

What `puts` and `print` have in common: They both call `.to_s`, hand the result to `stdout`, and return `nil`. And they both allow for arbitrarily many arguments. The two main differences:
- `puts` also adds a newline (which `print` doesn't)
- `puts` treats arrays in a special way (which `print` doesn't)

```ruby
print 1, [2, [3, 4], []], 5

1[2, [3, 4], []]5
=> nil

puts 1, [2, [3, 4], []], 5

1
2
3
4
5
=> nil
```

Still shorter and sweeter: `p`. Or as Schiller put it:

> Ich sei, gewährt mir die Bitte,
> In eurem Bunde der Dritte!

`p` calls `.inspect`, adds a newline, hands the result to `stdout`, and returns the arguments it was called on.

```ruby
p 1, [2, [3, 4], []], 5

1
[2, [3, 4], []]
5
=> [1, [2, [3, 4], []], 5]
```

So calling `p` instead of puts makes a difference mostly when it comes to arrays and `nil`.

```ruby
nil.to_s    # => ""
nil.inspect # => "nil"
```

So what about `to_s` and `inspect`? The default implementations of `to_s` and `inspect` live in the class `Object`, where the former builds a string from the object class and ID, while the latter additionally includes instance variables and their values. Except for `Main`, for which both return `"main"`.

In string interpolation, `to_s` is called. So as a rule of thumb: For getting a useful string representation of an object, it's a good idea to override `to_s`. For debugging purposes it's usually a good idea to not override `inspect`.

For more printing power there's `format` and at least the following examples I hope to remember, so I don't have to look up the documentation every time:

```ruby
format("%{x} wants %{y}", x: "Polly", y: "crack")
=> "Polly wants crack"

format("%03d", 7)   # => "007"
format("%.1f", 2)   # => "2.0"

# And mixing them:
format("%06.2f", 4.7) # => "004.70"
```

# Equality

> No entity without identity.

`BasicObject` provides:
- `==` (and `!`, which together also gives you `!=`)
- `equal?`

`Object` provides:
- `===`
- `eql?`

They all start as _object identity_: two objects are equal if they are the same object, i.e. have the same object id. Descendant classes then override those methods to provide class-specific behaviour.

## Object equality

`equal?` is never overridden, but kept to determine _object identity_.
```ruby
1.equal? 1.0 # => false
```

## Value equality

`==` is used to capture _value equality_, which allows for comparing the actual content of objects independent of their id.

```ruby
1 == 1.0 # => true
```

`eql?` is used as a stricter version of `==`, requiring the class of the two objects to be equal, in addition to their values. `eql?` is used by Ruby to compare Hash keys.

## Case equality

`===` is used in `case` statements and often only vaguely resembles equality. `a === b` can rather be understood as: _If I have a drawer `a`, does it make sense to put `b` in?_

- For `Range` it works like inclusion (in the sense of `include?`, not `cover?`).

```ruby
(1..100) === 23 # => true
```

- For `Regexp` it works like string matching (in the sense of `=~`).

```ruby
/Fnord*/ === 'Fnord!' # => true
```

- In addition, classes usually provide `===` as a class method that does the same as `is_a?`.

```ruby
String  === 'Fnord!' # => true  
Integer === 23       # => true  
```

Now, important to know about `case` statements is that the receiver of `===` is the `when` clause, not the `case` clause. Then it's easy to see what happens behind the scenes to create such incredibly convenient case behaviour.

```ruby
case input
when String then 'String!'
when /cool/ then 'Match!'
when 1..100 then 'Peanuts...'
end

# case input
# when String === input ... # input.is_a? String
# when /cool/ === input ... # /cool/ =~ input
# when 1..100 === input ... # (1..100).include? input
# end
```

The style guide says:
> Avoid explicit use of the case equality operator `===`. As its name implies it is meant to be used implicitly by case expressions and outside of them it yields some pretty confusing code.

# Comparison

At the heart of all comparison is the _spaceship operator_ `<=>`.

* The module `Comparable` uses it to implement the comparison methods `<`, `>`, `<=`, `>=`.
* The module `Enumerable` uses it to implement sorting and `min`,`max`.

In order to make objects of a custom class comparable or sortable:
- mixin the relevant module
- implement `<=>` such that `a <=> b` returns
    - `-1` if `a < b`
    - `0` if `a == b`
    - `1` if `a > b`
    - `nil` if `a` and `b` are not comparable

The default implementation of `<=>` in `Object` returns `0` if the two objects are equal (`==`), and `nil` otherwise.

# Variable scope

## Local

**Methods create their own scope.** In the sense of starting with an empty slate upon entering. As a result, local variables defined outside the method are not accessible within it. Likewise, what happens in a method, stays in the method; so local variables defined within a method are not accessible from outside. (Unless someone tells the outside.)

Here's where local_variables is really handy, although its primary use case is certainly something much cooler:

```ruby
outside = 23
p local_variables     # => [:outside]
def method
  inside = 47
  p local_variables   # => [:inside]
end
p local_variables     # => [:outside]
```

Another result of starting from an empty slate when entering the method is variable shadowing: variables that have the same name but live in different scopes are different variables. So string outside a method and string inside a method are two separate variables.

```ruby
string = 'Fnord'
p binding.local_variable_get(:string)   # => "Fnord"
def method
  string = '!'
  p binding.local_variable_get(:string) # => "!"
end
p binding.local_variable_get(:string)   # => "Fnord"
```

The same holds not only for `def`, but also for `class` and `module`.

**Blocks create a new scope, extending the scope of their container.** So local variables outside the block are accessible within it, but not vice versa.
This comes with two important facts. (Examples are stolen and adapted from [Darko Gjorgjievski](https://www.sitepoint.com/understanding-scope-in-ruby/).)

First, a block creates a new scope every time it is entered. Therefore, the following:

```ruby
2.times do
  str ||= 'fresh'
  puts str
  str = 'reassigned'
  puts str
end
```

Will output:

```ruby
fresh
reassigned
fresh
reassigned
```

And second, a block creates a new scope at the point where it is defined, not at the point of its invocation (similar to the initialization of variables), as can be demonstrated with a block argument to lambda — which is, like loop, not a keyword but a method in Kernel:

```ruby
def foo
  x = :inside
  lambda { x }
end
x = :outside
p foo.call # => :inside
```

**A local variable will be put into scope whenever it is assigned a value.** Which means: whenever the interpreter sees an assignment, even if this assignment is never executed. Whenever an assignment is parsed, space is allocated to the variable, so it starts existing. Classic example:

```ruby
known = 1
if false
  var = :false
end
p known  # => 1
p var    # => nil
p unkown # => undefined local variable or method `unknown'
```

Keep in mind that `if`, `while`, `until`, and `for` constructs are neither methods nor blocks, and thus do not create an own scope.

## Class and instance variable scope

Class and instance variables capture _state_. Unlike local variables, they are accessible across method calls. More specifically, they can be scoped on two different levels:
* _class level_ (meaning they are available in all class methods)
* _instance level_ (meaning they are available in all instance methods)

**Class variables `@@var` are scoped at the class level**, i.e. they are available in all class methods, independently of where they have been initialized.

There is only one copy of a class variable: All subclasses and also all instances of the class share that one copy. As a result of the latter, they are also available at object level, i.e. in all instance methods.

**Instance variables `@var` are scoped at the instance level**, i.e. they are available within instance methods. Instance variables that are used but not explicitly initialized evaluate to `nil`.

**Class instance variables** are instance variables at class level, and they belong to that class exclusively. They are thus good for storing class-specific stuff that you don't want to be shared across all subclasses and instances.

Here is an overview of this:

```ruby
class Test
  @ivar1 = 1 # class instance variable
  @@var1 = 1 # class variable

  def set
    @ivar2 = 2 # instance variable
    @@var2 = 2 # class variable
  end

  def self.set
    @ivar3 = 3 # class instance variable
    @@var3 = 3 # class variable
  end

  def instance_method
    # Class variables:
    # @@var1 => 1
    # @@var2 => 2
    # @@var3 => 3

    # Instance variables:
    # @ivar2 => 2

    # Class instance variables:
    # @ivar1 => nil
    # @ivar3 => nil
  end

  def self.class_method
    # Class variables:
    # @@var1 => 1
    # @@var2 => 2
    # @@var3 => 3

    # Instance variables:
    # @ivar2 => nil

    # Class instance variables:
    # @ivar1 => 1
    # @ivar3 => 3
  end
end
```

# Arrays

> Arrays are ordered, integer-indexed collections of any object.

**Traversing:** `each`es

**Selecting elements:**

- `first`, `last`,
- `fetch(index)` (throws `KeyError`), `fetch(index, default)`
- `take(n)`
- `select { |obj| ... }`, `reject { |obj| ... }`
- `find { |obj| ... }`, `find_all { |obj| ... }`, `find_index(obj)`, `find_index { |obj| ... }`

**Adding and deleting elements:**

_Deleting elements:_

- Front: `shift` and `shift(n)`, `drop(n)`
- Back: `pop` and `pop(n)`
- Wherever: `delete(obj)` and `delete_at(index)`

Keep in mind that `n` is the number of elements, not an index.

_Adding elements:_

- Front: `unshift(obj,...)` and its alias `prepend`
- Back: `push(obj,...)` / `<<`
- Wherever: `insert(index, obj)`

**Counting elements:**

- `length` and its alias `size`
- `count`, `count(obj)`, `count { |obj| ... }`

**Transforming the array:**

- `map { |obj| ... }`
- `reduce(method_sym)`, `reduce(initial, method_sym)`
- `reduce { |memo, obj| ... }`, `reduce(initial) { |memo, obj| ... }`

Both `map` and `reduce` (and its alias `inject`) live in `Enumerable`.

**Sorting:**

- `max`, `max(n)`, `max { |a, b| ... }`
- `min`, `min(n)`, `min { |a, b| ... }`
- `sort`, `sort { |a, b| ... }`
- `sort_by { |obj| ... }`

For a collection to be sortable, the objects in the collection must implement the comparison operation `<=>`. Like `map` and `reduce`, the sorting methods live in `Enumerable`.

_Unsorting:_ `shuffle`

And many more methods for grouping, slicing, zipping, and other magic.

# Hashes

> A Hash is a dictionary-like collection of unique keys and their values. [...] they are similar to Arrays, but where an Array uses integers as its index, a Hash allows you to use any object type.

**Traversing:** `each`es

**Accessing elements:**
- `keys`, `values`
- `fetch(key)` (throws `KeyError`), `fetch(key, default)`
- `key(value)`
- `select { |key, value| ... }`
- `reject { |key, value| ... }`

**Counting elements:**

- `length` and its alias `size`
- `count`, `count([key, value])`, `count { |key, value| ... }`

**Adding and deleting elements:**

- `delete(key)`
- `delete_if { |key, value| ... }`
- its opposite `keep_if { |key, value| ... }` which deletes every key-value pair except for the ones for which the block evaluates to true
- `update(other_hash)` and the equivalent `merge(other_hash)`

When merging, the values of duplicate keys will be overwritten. In case you don't want this to happen, you can provide a block that specifies what to do:
`update(other_hash) { |key, old_value, new_value| ... }`

**Transforming the hash:**

- `invert` to swap keys and values (overwrites information if the mapping is not 1–1)
- `map { |key, value| ... }` and the different forms of `reduce` (both from `Enumerable`), as well as the more specific `transform_values { |value| ... }`

# Closures

> A function or a reference to a function together with a referencing environment.

As [Paul Cantrell](https://innig.net/software/ruby/closures-in-ruby) puts it: A _closure_ is a block of code that

* can be passed around as a value,
* can be executed on demand by anyone who has that value, and at that point
* can refer to variables from the context in which is was created.

The means that it contains references to the variable bindings, not copies of the values. So if the value associated with a variable changes later \(either being changed outside the closure or by the closure itself\), the context reflects that change.

```ruby
> name = 'fred'
> p = proc {}
> p.binding.eval('name')
=> "fred"
> name = 'bob'
> p.binding.eval('name')
=> "bob"
```

**Example: counters**

```ruby
def make_counter
  n = 0
  return proc { n += 1 }
end

counter1 = make_counter
counter1.call # => 1
counter1.call # => 2

counter2 = make_counter
counter2.call # => 1

counter1.call # => 3
```

Closures are _closed_ with respect to variables defined in the context where they were created, regardless of the context in which they are called.

> Closures are important because they preserve the partial running state of a program.
>
> One of the most important aspects of Proc objects is their service as _closures_: anonymous functions that preserve the local variable bindings that are in effect when the procs are created.

## Procs

_Procs_ are _callable objects_ of type `Proc`, a direct subclass of `Object`. They are created from a code block

* `p = Proc.new { ... }`
* `p = proc {...}`

which can later be executed:

* `p.call`

Like any object, they can be assigned to variables, put into arrays and hashes, passed to methods as arguments \(in whatever number and order\), returned from methods, and so on.

## Lambdas

_Lambdas_ are also `Proc` objects, just of a slightly different flavor.

```ruby
p = proc {}
=> #<Proc:0x00000000ffdca0>

l = lambda {}
=> #<Proc:0x00000000fd2230 (lambda)>
```

They can be created

* from code blocks with the `lambda` method: `lambda { ... }`
* by means of the literal _lambda_ constructor, with or without arguments:
  * `-> { ... }`
  * `->(arg) { ... }`

_Lambdas_ differ from other _procs_ in two major respects. First, **arity rules**: _lambdas_ behave like methods, while _procs_ and blocks are lenient \(see below\). Second, **control flow**, in particular behavior upon `return`: _Lambdas_ return only from the block that defines them, and hand control back to the calling context - independent of the context in which they were defined. That is, the following two cases both print output to the screen:

```ruby
def test
  my_lambda = lambda { return }
  my_lambda.call
  puts 'This will be output to screen.'
end

test
```

```ruby
l = lambda { return }

def test(some_lambda)
  some_lambda.call
  puts "This will be output to screen."
end

test(l)
```

Other _procs_ behave like being part of the enclosing method \(meaning: the method that is enclosing them when they are defined\) by returning not only from their block but also from that method.

```ruby
def calling(p)
  p.call
end

def defining
  p = proc { return 42 }

  puts 'Go!'
  calling(p)
  puts 'Done.'
end

# > defining
# Go!
# => 42
```

Note that `return` is tied to the context at the time of creation of the _proc_. So if the _proc_ is either defined at the top-level, from which you can't return, or if the creating context no longer exists upon calling, e.g. by calling the _proc_ at the top-level of the program, this will result in a `LocalJumpError`.

If there is a need to return early from a _proc_, use `next`, which returns from the current block \(just like `return` in a _lambda_\).

```ruby
def meditate
  puts 'Adjusting posture...'
  p = Proc.new do
        puts 'Ringing bell...'
        next
        puts 'Getting distracted!'
    end
    p.call
    puts 'Sitting still...'
    true
end

# > meditate
# Adjusting posture...
# Ringing bell...
# Sitting still...
# => true
```

## Blocks

Blocks are syntactic constructs:

* `{ ... }` and `{ |arg| ... }`
* `do ... end` and `do |arg| ... end`

More specifically, they are part of the method invocation syntax. They contain everything necessary to create a _proc_ object, but they are not objects themselves. Thus they cannot be assigned to variables, they cannot be returned by methods, and the like. So in a way they are also not real closures. But they are closures in the sense of remembering their context upon creation:

> \[...\] a Ruby block carries around the context in which it was defined. A block can reference the variables that were in scope when it was defined, even if those variables later go out of scope.
>
> -- Ruby Cookbook

Each Ruby method can optionally be provided a block, which is independent of the argument list. It can be made explicit in the argument signature, however, by means of `&` \(see [& and curry](/and-and-curry.md "the section on \`&amp;\`")\), e.g.

```ruby
def method(*args, &block)
end
```

This is necessary if you want to further process the block, e.g. pass it to another method:

```ruby
def method(*args, &block)
  another_method(&block)
end
```

Methods cannot be provided more than one block, because they are not method arguments, they are part of the method invocation syntax.

`yield` is a keyword that tells Ruby to execute the block that was passed to the method. If there was no block \(which can be checked using `Kernel#block_given?`\), this results in a `LocalJumpError`.

```ruby
def method_implicit
  yield if block_given?
end

def method_explicit(&block)
  raise ArgumentError, 'expected a block' unless block
  block.call
end
```

Blocks can be captured in _proc_ objects with either `proc { ... }` or `lambda { ... }`.

## Methods

Methods are not objects, but you can get a `Method` object by means of `Object#method`:

```ruby
m = 1.method(:+)
m.call 2 # => 3

module Demo
  def self.run
   'Hello world!'
  end
end

Demo::run # => 'Hello world!'

m = Demo.method(:run)
m.call # => 'Hello world!'
```

There are two main differences between methods on the one-hand side and blocks and _procs_ on the other hand side. One concerns arity rules, the other concerns variable scope.

### Arity

While methods raise an `ArgumentError` when they are not provided arguments as specified in the method definition, blocks and non-lambda _procs_ are very lenient when it comes to arguments: they don't care about the number of arguments they receive.

* missing arguments are bound to `nil`
* additional arguments are ignored

### Scope

Block arguments are local to the block.

```ruby
def execute(p)
  str = 'string in method scope'
  puts str
  p.call
end

str = 'string in scope when proc is created'
p = proc { puts str }
```

```ruby
> p.call
string in scope when proc is created

> execute(p)
string in method scope
string in scope when proc is created
```

```ruby
var = 1
p = proc { puts "var = #{var}" } # NameError if var is no yet defined at this point

p.call # => var = 1

var = 2

p.call # => var = 2
```

**Example: Opening and closing resources**

```ruby
def file_sandwich(file_name)
  file = open(file_name)
  yield(file)
ensure
  file.close if file
end
```

_Executing around:_ If you need to do something (repeatedly) before and after some operation, put the details of that something into a method that takes a block.

**Example: Logging**

```ruby
class Whatever
  include Logging

  def do_something
    with_logging('load database') { @data = Database.read }
    # ...
    with_logging('save database') { @data.save }
  end
end

module Logging
  def with_logging(description)
    begin
      @logger.debug("Starting #{description}...")
      result = yield
      @logger.debug("Completed #{description}.")
      result
    rescue
      @logger.error("#{description} failed!")
    end
  end
end
```

Other examples are measuring execution time, etc.

**Example: Block for initialization**

```ruby
class Specification
  attr_accessor :name, :version, :description
  def initialize
    # ...
    yield(self) if block_given?
  end
end

spec = Specification.new do |s|
  s.name = 'Whatever'
  s.version = '3.14'
  s.description = '...'
end
```

**Example: Storing operations in blocks to delay execution and to stay agnostic with respect to where a resource comes from**

```ruby
class Book
  def initialize(author, title, &block)
    @author = author
    @title = title
    @read_content = block
  end

  def content
    @content ||= @read_content.call
  end
end

book = Book.new('Author', 'Title') { File.read('path') }
book = Book.new('Author', 'Title') { FTP.get('address') }
```

## The & operator

The `&` operator tells Ruby to use an object as a block. If expects that object to be a _proc_; if it is not, it first calls `to_proc` on it.

```ruby
def execute(&block) # `&` takes the block that is part of the method invocation,
                    # turns it into a `Proc` object (by calling `to_proc`),
                    # and binds it to the variable `block`.
  block.call
end

execute  { puts 'Yay!' }

p = proc { puts 'Yay!' }
execute(&p)         # `&` hands `p` to the method as the block it can take,
                    # so this is the same as saying `execute { puts 'Yay!' }`.
                    # Without `&`, `p` would be passed as a normal method argument.
```

`to_proc` is defined in

* `Proc`
* `Symbol`: It allows you to say `&:capitalize` and get back a _proc_ that captures the `capitalize` method. Note that, like above, the `&` in `array.map(&:capitalize)` tells `map` that `:capitalize.to_proc` takes the place of the block that can be part of the method invocation \(as in `array.map { |item| item.capitalize }`\).

  `Symbol#to_proc` basically works like this:

  ```ruby
    class Symbol
      def to_proc
        proc { |obj, args| obj.send(self, *args) }
      end
    end
  ```

* `Method`

It can also be defined by any class as a class or instance method.

## Currying

```ruby
p = proc { |x, y| x + y }
p.curry # => <Proc>

p.call(1)         # => <Proc>
p.call(1).call(2) # => 3
```

# Enumerable: each

`Enumerable` provides a range of collection-related behavior. In order for a class \(usually a class implementing collections, such as `Array`, `Hash`, `Set`, and `Range`\) to include and use it, `Enumerable` needs to be able to traverse through the collection - more specifically, the class must implement `each`, a method that yields successive members of the collection. In the simplest case it calls a block with one argument and binds the current member to that argument. When done, it returns the collection.

```ruby
["r", "u", "b", "y"].each { |c| puts "Give me a #{c.upcase}!" }
Give me a R!
Give me a U!
Give me a B!
Give me a Y!
=> ["r", "u", "b", "y"]
```

Building on `each`, `Enumerable` implements several handy extensions of it, among them the following two:

* `each_with_index` calls a block with two arguments: the current element and the index of that element. Like each, it returns the collection.

```ruby
collection.each_with_index { |element, index| ... }
=> collection
```

* `each_with_object` additionally expects an object, and calls a block with two arguments: the current element and that object \(which is passed to and returned from each iteration of the block\). It returns the initial object.

```ruby
collection.each_with_object(initial_memo) { |element, memo| ... }
=> initial_memo
```

```ruby
["r", "u", "b", "y"].each_with_object("") { |c, str| str << c }
=> "ruby"
["r", "u", "b", "y"].each_with_object("") { |c, str| p (str + c) }
"r"
"u"
"b"
"y"
=> ""
```

In addition, classes that include `Enumerable` might define further variants of each that are specific for that class. For example, `Array` also defines `each_index`, in case you don't care about the elements but only their indices.

```ruby
array.each_index { |index| ... }
=> array
```

And `Hash` defines a few variants that are specific to hashes:

```ruby
hash.each_key   { |key| ... }
hash.each_value { |value| ... }
hash.each_pair  { |key, value| ... }
```

They all return the hash they're called on, and `each_pair` is basically the same as `each`, just providing a more descriptive name.

Note that `String` does not include `Enumerable` but also defines `each`-like methods, based on the different possibilities of viewing strings as collections:

* `each_char`
* `each_byte`
* `each_codepoint`
* `each_line` \(with an optional separator argument\)

# Iterators and sequences

An _iterator method_ is a method that takes a block and calls its for each element in some collection, passing the element into the block as a parameter.

## Internal iteration

How to iterate is controlled by the collection that implements it. An example is `Array#each`.

In order to benefit from all the internal iteration magic, implement `each` and include `Enumerable`.

## External iteration

How to iterate is controlled from the outside, by whoever uses the iterator. In order to allow this, build an `Enumerator` object. \(`Enumerator` implements `each` and includes `Enumerable`, so enumerators are also endowed with methods for internal iteration.\)

An `Enumerator` object can be built from most of the `Enumerable` methods by not providing a block:

```ruby
array = [1, 2, 3]
array.each # same as: array.enum_for(:each), or: Enumerator.new(array, :each)
array.map  # same as: array.enum_for(:map),  or: Enumerator.new(array, :map)
```

When implementing an iteration method like those, it's good practice to include this option as follows:

```rubby
return enum_for(__callee__) unless block_given?
```

An enumerator can also be constructed explicitly as instance of the `Enumerator` class. Construction requires a block that takes a yielder as argument. A yielder is an `Enumerator::Yielder` object that passes control around. It let's us yield each item of the enumerator to blocks passed to `Enumerable` method calls, like `next`, `peek`, `rewind`, etc.

**Example: infinite sequence of natural numbers**

```ruby
def natural_numbers
  Enumerator.new do |yielder|
    n = 0
    loop do
      yielder << n # another way of saying: yielder.yield n
      n += 1
    end
  end
end

puts natural_numbers.first(10)
```

**Example: repeatedly execute a block**

```ruby
def repeatedly(&block)
  Enumerator.new do |yielder|
    loop do
      yielder << block.call
    end
  end
end

enum = repeatedly { puts 'Yay!' }
enum.first 10
```

For finite enumerators:

```ruby
loop do
  raise StopIteration if there_is_no_next_value
  yielder << next_value
end
```

# Exceptions

Global variable holding the current exception: `$!`

When another exception is thrown before the current one is handled, it replaces the current one (which is thrown away).

## Structure

```ruby
begin
  # ...
rescue
  # in case of failure
else
  # in case of success
ensure
  # always executed (e.g. cleaning up connection to external service, that would otherwise be left dangling)
end   
```

Every method is implicitly a `begin` block.

```ruby
def fnord
  # ...
rescue
  # ...
end
```

**Notes:**
* Order matters, i.e. more specific exceptions need to be `rescue`d before more general ones.
* `rescue` can match multiple error classes, e.g. `rescue IOError, ParseError, ArgumentError`

**Best practises:**
* Use exceptions only for exceptional situations. Not every time you get an answer you don't like. And not for control flow. (Raising an exception is just another form of `goto` statement, and it's expensive performance-wise.) For example, invalid user input is not unexpected, since you can predict it will happen during normal operation.
* If unsure what is the best fallback strategy, leave the decision to the caller. E.g.
```ruby
def fnord
  # ...
  if all_went_well?
    # yeah
  else
    # oh no
    yield if block_given?
  end
end

fnord { do_something_in_case_not_all_went_well }
```
* Do not `return` from an `ensure` block, as this will hide the exception. Generally, don't suppress exceptions.
* When an exception occurs, make sure to either leave the object in a consistent state, or to roll it back to its original state.
* All application and library exceptions should be descendants of `StandardError`.

## Default arguments

`raise` and `fail` are synonymous methods in Kernel, with three optional arguments: `raise ErrorClass, 'message', backtrace`

Defaults:
* error class is RuntimeError when `raised`, i.e.
    * `raise` = `raise RuntimeError`
    * `raise 'message'` = `raise RuntimeError, 'message'`
* error class is `StandardError` when `rescue`d, i.e.
    * `rescue => error` = `rescue StandardError => error`
* default backtrace is `caller`
