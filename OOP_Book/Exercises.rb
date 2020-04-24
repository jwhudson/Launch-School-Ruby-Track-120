# # The Object Model Exercises

# # How do we create an object in Ruby? Give an example of the creation of an object.

# class MyClass
#   include Jump
# end

# class_one = MyClass.new

# # What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# # A module is a collection of behaviours that is usable in other classes via mixins. A module is "mixed-in" to a class using the include method invocation.

# module Jump
#   def jump(height)
#     puts "I can jump #{height} meters!"
#   end
# end

# #------------------------------------------------------------------------------#

# class MyCar

#   attr_accessor :color
#   attr_reader :year

#   def initialize(year, model, color)
#     @year = year
#     @color = color
#     @model = model
#     @velocity = 0
#   end

#   def self.mileage( liter, miles)
#     puts "#{miles.to_f/liter} miles per liter of petrol."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "The car is now #{color}."
#   end

#   def speed_up(speed)
#     @velocity += speed
#     puts "You accelerate to #{@velocity} mph."
#   end

#   def brake(reduction)
#     @velocity -= reduction
#     puts "you brake and decelerate to #{@velocity} mph."
#   end

#   def current_speed
#     puts "The car is currently going #{@velocity} mph."
#   end

#   def turn_off
#     @velocity = 0
#     puts "You park the car."
#   end

#   def to_s
#     "This car is a #{@year} #{@model} that is #{@color}."
#   end
# end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.turn_off
# lumina.current_speed

# lumina.color = "yellow"
# p lumina.color
# p lumina.year
# p lumina.to_s

# MyCar.mileage(200, 10)
#------------------------------------------------------------------------------#

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n
#   end

#   def speak
#     "#{self.name} says arf!"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new

# puts sparky.speak
# puts paws.speak

#------------------------------------------------------------------------------#

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   def speak
#     super + " from GoodDog class"
#   end
# end

# sparky = GoodDog.new
# p sparky.speak

#------------------------------------------------------------------------------#

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# bruno = GoodDog.new("brown")

# p bruno

# #------------------------------------------------------------------------------#

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# p BadDog.new(2, "bear") # #<BadDog:0x000000000137a720 @name="bear", @age=2>

#------------------------------------------------------------------------------#

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable  # mixing in Swimmable module
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable  # mixing in Swimmable module
# end


# sparky = Dog.new
# neemo = Fish.new
# paws = Cat.new

# sparky.swim # "I'm swimming!"
# neemo.swim # "I'm swimming!"
# paws.swim

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

# puts "---Animal method lookup---"
# puts Animal.ancestors

# ---Animal method lookup---
# Animal
# Walkable
# Object
# Kernel
# BasicObject

# fido = Animal.new

# p fido.speak # "I'm an animal, and I speak!"
# p fido.walk # "I'm walking."
# p fido.swim # undefined method `swim' for #<Animal:0x0000000000a64988> (NoMethodError)



# ---GoodDog method lookup---
# GoodDog
# Climbable
# Swimmable
# Animal
# Walkable
# Object
# Kernel
# BasicObject

#------------------------------------------------------------------------------#

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end
#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end

#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak("Arf!") # "Arf!"
# kitty.say_name("kitty") # "kitty"

# value = Mammal.some_out_of_place_method(4) # 16
# value = Mammal::some_out_of_place_method(4) # 16

#------------------------------------------------------------------------------#

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure # "Sparky in human years is 28"

#------------------------------------------------------------------------------#

# class Animal
#   def a_public_method
#     "Will this work? " + self.a_protected_method
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end

# fido = Animal.new
# fido.a_public_method # => Will this work? Yes, I'm protected!
# fido.a_protected_method # NoMethodError: protected method `a_protected_method' called for #<Animal:0x007fb174157110>

# class Parent
#   def say_hi
#     p "Hi from Parent."
#   end
# end

# class Child < Parent
#   def say_hi
#     p "Hi from Child."
#   end
# end

# child = Child.new
# child.say_hi # "Hi from Child."

# son = Child.new
# son.send :say_hi # "Hi from Child."

#------------------------------------------------------------------------------#

# class Child
#   def say_hi
#     p "Hi from Child."
#   end

#   def send
#     p "send from Child..."
#   end

#   def instance_of?
#     p "I am a fake instance"
#   end
# end

# heir = Child.new
# heir.instance_of? Child

# `instance_of?': wrong number of arguments (given 1, expected 0)

# lad = Child.new
# lad.send :say_hi # ArgumentError: wrong number of arguments (1 for 0)

# c = Child.new
# c.instance_of? Child # true
# c.instance_of? Parent # false


#------------------------------------------------------------------------------#

# module Towable
#   def can_tow?(pounds)
#     pounds > 2000
#   end
# end


# class Vehicle
#   attr_accessor :color
#   attr_reader :model, :year
#   @@number_of_vehicles = 0

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @velocity = 0
#     @@number_of_vehicles += 1
#   end

#   def self.number_of_vehicles
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

#   def self.mileage( liter, miles)
#     puts "#{miles.to_f/liter} miles per liter of petrol."
#   end

#   def speed_up(speed)
#     @velocity += speed
#     puts "You accelerate to #{@velocity} mph."
#   end

#   def brake(reduction)
#     @velocity -= reduction
#     puts "you brake and decelerate to #{@velocity} mph."
#   end

#   def current_speed
#     puts "The car is currently going #{@velocity} mph."
#   end

#   def turn_off
#     @velocity = 0
#     puts "You park the vehicle."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "The vehicle is now #{color}."
#   end

#   def age
#     puts "This Vechile is #{how_old?} years old."
#   end
#   private

#   def how_old?
#     time = Time.now
#     time.year - self.year
#   end
# end


# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "This car is a #{@year} #{@model} that is #{@color}."
#   end

# end



# class MyTruck < Vehicle
#   include Towable

#   NUMBER_OF_DOORS = 2
# end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.turn_off
# MyCar.mileage(13, 351)
# lumina.spray_paint("red")
# puts lumina
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors
# p lumina.age

#------------------------------------------------------------------------------#

# class Student

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(student)
#     self.grade > student.grade
#   end

#   protected

#   def grade
#     @grade
#   end

# end

# bob = Student.new("Bob", 95)
# joe = Student.new("Joe", 98)

# p joe.better_grade_than?(bob)

#------------------------------------------------------------------------------#

# class Cat
# end

# w = Cat.new
# y = Cat.new

# p w == y

# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def self.change_grade(new_grade)
#     grade = new_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak