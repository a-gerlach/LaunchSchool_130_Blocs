- A closure is a general programming concept that allows programmers to save a "chunk of code" and execute it at a later time. 
  It's called a "closure" because it's said to bind its surrounding artifacts (ie, variables, methods, objects, etc) 
  and build an "enclosure" around everything so that they can be referenced when the closure is later executed. 
  Its sometimes useful to think of a closure as a method that you can pass around and execute, but its not defined with an explicit name. 

- In Ruby, a closure is implemented through a Proc object. That is, we can pass 
  around a Proc object as a "chunk of code" and execute it later. 

- In Ruby, every method can take an optional block as an implicit parameter. 
  You can just tack it on at the end of the method invocation

- just realize that blocks do not enforce argument count, unlike normal methods in Ruby. 

- 
    - blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" 
      to be executed later.
    
    - blocks can take arguments, just like normal methods. But unlike normal methods, it wont complain about wrong 
      number of arguments passed to it.
    
    - blocks return a value, just like normal methods.
    
    - blocks are a way to defer some implementation decisions to method invocation time. 
      It allows method callers to refine a method at invocation time for a specific use case. 
      It allows method implementors to build generic methods that can be used in a variety of ways.
    
    - blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.

- This implies that the Proc keeps track of its surrounding context, and drags it around wherever the chunk of code is passed to. 
  In Ruby, we call this its binding, or surrounding environment/context. 
  A closure must keep track of its surrounding context in order to have all the information it needs in order to be executed later. 
  This not only includes local variables, 
  but also method references, constants and other artifacts in your code -- whatever it needs to execute correctly, it will drag all of it around


TESTING

Lecture: Minitest


  - Test Suite: this is the entire set of tests that accompanies your program or application. 
    You can think of this as all the tests for a project.
  
  - Test: this describes a situation or context in which tests are run. 
    For example, this test is about making sure you get an error message after trying to log in with the wrong password. 
    A test can contain multiple assertions.
    
  - Assertion: this is the actual verification step to confirm that the data returned by your program 
    or application is indeed what is expected. You make one or more assertions within a test.

-In the previous assignments, we have been quickly diving down into the tests and assertions, 
  but in larger projects, there are usually 4 steps to writing a test:

  - Set up the necessary objects.
  
  - Execute the code against the object we are testing.
  
  - Assert the results of the execution.
  
  - Tear down and clean up any lingering artifacts.

- In the simplest cases, we wont need either set up or tear down, but just keep in mind that 
  there are 4 steps to running any test, and it is SEAT. 
  At the minimum, you will need EA, even if the E is just a simple object instantiation.

- Remeber you can call a block with _ and it will fill it with something:
  birds = ['crow', 'finch', 'hawk', 'eagle']

  def types(birds)
    yield birds
  end

  types(birds) do |_,_,*birds_of_prey|
    puts "Two birds of prey are the #{birds_of_prey.join(' and ')}."
  end

- A lambda enforces the number of arguments. If the expected 
  number of arguments are not passed to it, then an error is thrown.

- If we have a yield and no block is passed, then an error is thrown.

- Comparison

  - Lambdas are types of Procs. Technically they are both Proc objects. 
    An implicit block is a grouping of code, a type of closure, it is not an Object.
  
  - Lambdas enforce the number of arguments passed to them. 
    Implicit block and Procs do not enforce the number of arguments passed in.


- Making objects comparable is actually quite easy; you dont have to create every possible comparison operator for the object. 
  Instead, all you need to do is include the Comparable mixin, and define one method: <=>. 
  The <=> method should return 0 if the two objects are "equal", 
  1 if the receiving object is greater than the other object, and -1 if the receiving object is less that the other object. 


  # FIrst version of my solution for the test-coding challenge

  # class Atbash

#   ATBASH_HASH = {
#     "a" => "z",
#     "b" => "y",
#     "c" => "x",
#     "d" => "w",
#     "e" => "v",
#     "f" => "u",
#     "g" => "t",
#     "h" => "s",
#     "i" => "r",
#     "j" => "q",
#     "k" => "p",
#     "l" => "o",
#     "m" => "n"
#   }

#   def self.encode(code)
#     self.apply_code(code)
#   end

#   def self.apply_code(input)  
#     p new_input = input.gsub(/[^0-9a-zA-Z]/, "")
  
#     p input_array = new_input.chars
#     encoded_array = []
#     counter = 0
#     input_array.each do |x|
#       x.downcase!
#       if ATBASH_HASH.keys.include?(x)
#         encoded_array << ATBASH_HASH[x]
#       elsif ATBASH_HASH.values.include?(x)        
#         encoded_array << ATBASH_HASH.key(x)
#       elsif x[/\d+/]
#         encoded_array << x
#       end
#       counter += 1
#       if counter % 5 == 0
#         encoded_array << " "
#       end
#     end
#     p encoded_array.join
#   end
# end

# plaintext = 'The quick brown fox jumps over the lazy dog.'

# Atbash.encode('Testing, 1 2 3, testing.')
