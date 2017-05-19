# # method implementation
# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# # method invocation
# say("hi there") {
# #   system 'cls'
# # }


# def test
#   yield(0, 2)                              # passing 1 block argument at block invocation time
# end

# # method invocation
# test do |num1, num2|                    # expecting 2 parameters in block implementation
#   puts num1 + num2
# end

# 5.times do |num|
#   puts num
# end

# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end

#   number
# end

# times(5) do |num|
#   puts num
# end

# def each(array)
#   counter = 0

#   while counter < array.size
#     yield(array[counter])                           # yield to the block, passing in the current element to the block
#     counter += 1
#   end

#   array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
# end

# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end

# def select(array)
#   counter = 0
#   new_array = []
  
#   while counter < array.size
#     new_array << yield(array[counter])
#     counter += 1
#   end
#   new_array.delete(nil)
#   p new_array
# end

# select([1, 2, 3, 4, 5]) do |num|
#   if num.odd?
#     num    
#   end
# end

# puts "------------------"



# def select(array)
#   counter = 0
#   new_array = []
  
#   while counter < array.size
#     new_array << yield(array[counter])
#     counter += 1
#   end
#   new_array.delete(nil)
#   p new_array
# end

# select([1, 2, 3, 4, 5]) do |num|
#   puts num
# end

# puts "------------"

# def select(array)
#   counter = 0
#   new_array = []
  
#   while counter < array.size
#     if yield(array[counter])
#       new_array << (array[counter])
#     end
#     counter += 1
#   end
#   new_array.delete(nil)
#   p new_array
# end

# array = [1, 2, 3, 4, 5]

# select(array) { |num| num.odd? }
# select(array) { |num| puts num } 
# select(array) { |num| num + 1 }  

# def reduce(array, start = 0)
#   result = start
  
#   array.each do |num|
#     result += yield(0, num)
#   end
#   p result
# end

# array = [1, 2, 3, 4, 5]

# reduce(array) { |acc, num| acc + num }  
# reduce(array, 10) { |acc, num| acc + num } 
# reduce(array) { |acc, num| acc + num if num.odd? } 


# Exercises for the Blocks. 

# class Tree
#   include Enumerable
# end

# def compute(arg)
#   if block_given?
#     yield(arg)
#   else
#     "Does not compute"
#   end
  
# end

# p compute(5) {|ele| ele + 5 + 3 }
# p compute("hi") {|x| x + 'a' + 'b' }
# p compute("test")

# def missing(arr)
#   new_array = []
#   (arr.min..arr.max).each do |x| 
#     new_array << x
#   end
#   p new_array
#   arr.each do |x|
#     new_array.delete(x)
#   end
#   #new_array.delete((arr.min..arr.max).each {|x| x})
#   p new_array
# end

# missing([-3, -2, 1, 5])
# missing([1, 2, 3, 4])
# missing([1, 5])
# missing([6])

# def divisors(num)
#   result = []
#   (1..num).each do |x|
#     if num % x == 0
#       result << x
#     end
#   end
#   p result
# end

# divisors(12)
# divisors(7)
# divisors(1)
# divisors(98)
# divisors(99400891)

# ROT13 = {
#   "a" => "n",
#   "b" => "o",
#   "c" => "p",
#   "d" => "q",
#   "e" => "r",
#   "f" => "s",
#   "g" => "t",
#   "h" => "u",
#   "i" => "v",
#   "j" => "w",
#   "k" => "x",
#   "l" => "y",
#   "m" => "z",
#   "n" => "a",
#   "o" => "b",
#   "p" => "c",
#   "q" => "d",
#   "r" => "e",
#   "s" => "f",
#   "t" => "g",
#   "u" => "h",
#   "v" => "i",
#   "w" => "j",
#   "x" => "k",
#   "y" => "l",
#   "z" => "m",
#   " " => " "
# }

# p ROT13["z"]

# def decipher(str)
#   result = []
#   result = str.split("").map do |x|
#     ROT13[x.downcase]
#   end
#   result.join("")
# end

# p decipher("Nqn Ybirynpr")
# p decipher("Wbua Ngnanfbss")

# def any?(arr)
#   #arr.index(yield(arr))
#   result = []
  # arr.each do |x|
  #   p x
  #   return true if yield(x) == true

  # end
  # false
# end

# p any?([1, 2, 5, 6]) { |value| value.even? }
# p any?([1, 3, 5, 7]) { |value| value.even? }
# p any?([2, 4, 6, 8]) { |value| value.odd? } 
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 }
# p any?([1, 3, 5, 7]) { |value| true }
# p any?([1, 3, 5, 7]) { |value| false }
# p any?([]) { |value| true }

# def all?(arr)
#   arr.each do |x|
#     p x
#     return false if yield(x) == false
#   end
#   true
# end


# p all?([1, 3, 5, 6]) { |value| value.odd? } 
# p all?([1, 3, 5, 7]) { |value| value.odd? }
# p all?([2, 4, 6, 8]) { |value| value.even? }
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 }
# p all?([1, 3, 5, 7]) { |value| true }
# p all?([1, 3, 5, 7]) { |value| false }
# p all?([]) { |value| false }

# def none?(arr)
#   arr.each do |x|
#     p x
#     return false if yield(x) == true
#   end
#   true  
# end

# p none?([1, 3, 5, 6]) { |value| value.even? }
# p none?([1, 3, 5, 7]) { |value| value.even? }
# p none?([2, 4, 6, 8]) { |value| value.odd? }
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 }

# def one?(arr)
#   result = []
#   return true if arr.empty?
#   arr.each do |x|
#     p x
#     result << yield(x)
#     return false if result.count(true) == 2
#   end
#   return true if result.count(true) == 1
#   false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }
# p one?([1, 3, 5, 7]) { |value| value.odd? }
# p one?([2, 4, 6, 8]) { |value| value.even? } 
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 }
# p one?([1, 3, 5, 7]) { |value| true } 
# p one?([1, 3, 5, 7]) { |value| false }
# p one?([]) { |value| true } 

# def count(arr)
#   result = []
#   result = arr.select do |x|
#     yield(x)
#   end
#   result.size
  
# end

# p count([1,2,3,4,5]) { |value| value.odd? }
# p count([1,2,3,4,5]) { |value| value % 3 == 1 }
# p count([1,2,3,4,5]) { |value| true }
# p count([1,2,3,4,5]) { |value| false }
# p count([]) { |value| value.even? }
# p count(%w(Four score and seven)) { |value| value.size == 5 }

# def step(start, stop, step)
#   counter = start
#   loop do
#     yield(counter)    
#     break if counter + step > stop
#     counter += step

#   end
#   counter
# end


# p step(1, 10, 3) { |value| puts "value = #{value}" }

# def zip(arr1, arr2)
#   result = []
#   counter = 0
#   loop do 
#     result[counter] = arr1[counter], arr2[counter]
#     counter += 1
#     break if counter == arr1.length
#   end
#   p result
# end

# zip([1, 2, 3], [4, 5, 6])


# def map(arr)
#   result = []
#   arr.each do |x|
#     result << yield(x)
#   end
#   p result
# end


# map([1, 3, 6]) { |value| value**2 }
# map([]) { |value| true } 
# map(['a', 'b', 'c', 'd']) { |value| false }
# map(['a', 'b', 'c', 'd']) { |value| value.upcase } 

# map([1, 3, 4]) { |value| (1..value).to_a }

# def count(arg1, arg2, arg3)
#   arr = [arg1, arg2, arg3]
#   p arr
#   result = []
#   arr.each do |x|
#     result << yield(x) if yield(x)
#   end
#   p result.size
# end


# count(1, 3, 6) { |value| value.odd? }
# count(1, 3, 6) { |value| value.even? }
# count(1, 3, 6) { |value| value > 6 } 
# count(1, 3, 6) { |value| true }

# def drop_while(arr)
#   found_false = false
#   result = []
#   arr.each do |x|
#     if yield(x) == false then found_false = true end
#     if found_false == true
#       result << x
#     end
#   end
#   p result
# end

# drop_while([1, 3, 5, 6]) { |value| value.odd? }
# drop_while([1, 3, 5, 6]) { |value| value.even? }
# drop_while([1, 3, 5, 6]) { |value| true } 
# drop_while([1, 3, 5, 6]) { |value| false }
# drop_while([1, 3, 5, 6]) { |value| value < 5 }
# drop_while([]) { |value| true }

# def each_with_index(arr)
#   counter = 0
#   arr.each do |x|
#     yield(x, counter)
#     counter += 1
#   end  
# end


# # each_with_index([1, 3, 6]) {|value, index| puts "#{index} -> #{value**index}"}

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# def each_with_object(arr, obj)
#   arr.each do |x|
#     yield(x, obj)
#   end
#   p obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# def max_by(arr)
#   biggest = 0
#   result = nil
#   arr.each do |x|
#     if yield(x) > biggest
#       biggest = yield(x)
#       result = x
#     end
#   end
#   p result
# end

# max_by([1, 5, 3]) { |value| value + 2 } 
# max_by([1, 5, 3]) { |value| 9 - value }
# #max_by([1, 5, 3]) { |value| (96 - value).chr }
# max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size }
# max_by([-7]) { |value| value * 3 }

# def each_cons(arr)
#   index = 0
#   if arr.empty?
#     return nil
#   end
#   loop do 
#     yield(arr[index], arr[index + 1])
#     index += 1
#     break if index == arr.size - 1
#   end
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end

# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}

# hash = {}
# each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}

# def each_cons(array)
  # array.each_with_index do |item, index|
  #   break if index + 1 >= array.size
  #   yield(item, array[index + 1])
  # end
# end


# def each_cons(array, values)
  
#   array.each_with_index do |item, index|
#     if values == 2
#       counter = array[index + 1] 
#     end
#     break if index + 1 >= array.size
#     yield(item, counter)
    
#   end
# end

# # hash = {}
# # each_cons([1, 3, 6, 10], 1) do |value|
# #   hash[value] = true
# # end
# # p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash
# == { 1 => 3, 3 => 6, 6 => 10 }

# def test_odd
#   assert_equal(true, value.odd?)
# end

# def test_downcase
#   assert_equal("XYZ", value.downcase)
# end

#assert_nil(value)

# asser(list.empty)

#assert_includes(list, "xyz")

# def test_raise_initialize_with_arg
#   assert_raises(NoExperienceError) do
#     employee.hire         # this code raises ArgumentError, so this assertion passes
#   end
# end

# def test_instance_of_car
#   car = Car.new
#   assert_instance_of(Car, car)
# end

# value = Numeric.new
# assert_instance_of(Numeric, value)

# assert_kind_of(Numeric, value)

# refute_includes(list, 'xyz')

# class Device
#   def initialize
#     @recordings = []
#   end

#   def listen
#     if block_given?
#       record(yield)
#     end
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def play
#     puts @recordings
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play

# class TextAnalyzer
  
#   def process(string)
#     yield(string)
#   end
# end

# words =" djoaiwj doa\n iwjdoaij doiajdw\n djaijdoi"

# analyzer = TextAnalyzer.new
# analyzer.process(words) { |file| puts file.split(" ").size words }
# #analyzer.process(words) { |file| puts file.split("\n").size par }

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   yield(items)
# end

# # gather(items)

# gather(items) do |x|
#   puts "Let's start gathering food."
#   puts "#{x.join(', ')}"
#   puts "Let's start gathering food."
# end

# def birds(arr)
#   yield(arr[0], arr[1], arr[*])
# end

# birds(%w(raven finch hawk eagle)) {|x, y, *birds_of_prey| puts birds_of_prey }


# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*food, rest|
#   puts "#{food.join(", ")}"
#   puts "#{rest}"
# end

# gather(items) do |first, *second , last|
#   puts "#{first}"
#   puts "#{second.join(", ")}"
#   puts "#{last}"
# end

# gather(items) do |first, *rest|
#   puts "#{first}"
#   puts "#{rest.join(", ")}"
# end

# gather(items) do |a, b, c , d|
#   puts "#{a}, #{b}, #{c}, #{d}"
# end

# gather(items) do |*a, _, _ ,d|
#   puts "#{a.join(", ")}"
# end

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc # puts out the class object. It is a Proc object
# puts my_proc.class # it is a "Proc"
# my_proc.call # only outputs "This is a  ." Procs can be called without arguments
# my_proc.call('cat')# "Thi is a cat." "cat" is passed in as an argument.


# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda # Is also a "Proc" object
# puts my_second_lambda # also a "Proc object"
# puts my_lambda.class # "Proc"
# my_lambda.call('dog')# "This is a dog"
# #my_lambda.call# raises ArgumentError, (0 for 1). Lambdas cant be called without arguments
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }# gives un a NameError, becuase of a uninitialized constant

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # "This is a  ." We did not pass an argument to yield in the method.
# block_method_1('seal')# raises LocalJumpError, because we did not provide a block.


# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}# "This is a turtle"
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."# "This is a turtle and a ." The second argument is not provided so there is nothing filled in.
# end
# block_method_2('turtle') { puts "This is a #{animal}."}# Give us a name error because animal has not been initialized. 


# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# check_return_with_proc # the proc is called and the return statement
# is executed. We do not see the last puts statement

# Group 2
# my_proc = proc { return }# gives un an unexpected return (Local JumpError)

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda # the call of the lambda does not return and
#exit the method. It is most likely not executed.

# Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda(my_lambda)
# This does not throw an error

# Group 5
# def block_method_3
#   yield
# end

# block_method_3 { return }
# gives us a (Local Jump Error)

# class Exam
#   attr_writer :grade
#   attr_reader :difficulty, :grade, :passed
#   def initialize(difficulty, passed, grade)
#     @difficulty = difficulty
#     @passed = passed
#     @grade = grade
#   end
# end

# class Test < Exam
#   attr_writer :name
#   attr_reader :object_array

#   def initialize(name, dif, grade)
#     super
#     @@information = "Hi im a test class"
#     self.name = name
#     @object_array = [1, 2]
#   end

#   def self.get_info
#     puts @@information
#   end

#   def <<
#     @object_array.unshift("Test")
#   end

#   def info
#     p @name
#   end

#   def passed!
#     @passed = give_true
#   end

#   def increase_grade(points)
#     puts "This is your grade: #{grade}"
#     self.grade += points
#     puts "This is your grade now: #{grade}"
#   end

#   def good_grade?
#     if self.grade > 10
#       puts "You have a good grade"
#     else
#       puts "You have a bad grade"
      
#     end
#   end

#   def >(other_test)
#     grade > other_test.grade
#   end

#   def compare_grades(other_test)
    
#   end

#   private

#   def give_true
#     true
#   end
# end

# exam = Test.new("Weird Test", "hard", 10)
# essay = Test.new("Written Test", "easy", 15)
# exam.<<
# exam.<<
# p exam.object_array


# class Pet
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end

#   def bark
#     puts "Bark"
#   end
# end

# class Person
#   #attr_accessor :pet
#   #attr_reader :pet
#   def initialize(name)
#     @name = name
#   end

#   def create_pet(pet_name)
#     @pet = Pet.new(pet_name)
#   end

#   def give_pet_name
#     @pet.name
#   end

#   def bark
#     @pet.bark
#   end

# end

# joe = Person.new("Joe")
# joe.create_pet("Bud")
# p joe.give_pet_name
# joe.bark
# bob = Perosn.new("Bob")


# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end

# test = BankAccount.new(100)
# p test.positive_balance?

# class SecretFile
#   attr_reader :data

#   def initialize(secret_data)
#     @data = secret_data
#     @log = SecurityLogger.new
#   end

#   def data
#     puts @data
#     @log.create_log_entry#
#   end
# end

class SecurityLogger
  def create_log_entry
    puts "Log entry created"
  end
end

# files = SecretFile.new("docs")
# files.data

class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end
log1 = SecurityLogger.new
files = SecretFile.new("docs", log1)
files.data