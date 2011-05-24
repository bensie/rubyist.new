!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

## github.com/bensie ##
## twitter.com/bensie ##

!SLIDE smbullets incremental

# Ruby Origins #

* Yukihiro Matsumoto (Matz) in 1995
* Interpreted, not compiled
* Object Oriented - everything is an object
* Easy to read
* Naming is intuitive (easy to write)
* Rails in 2005

!SLIDE smbullets

# Ruby in this class #

* 1.9.2 syntax preferred, 1.8.x syntax mentioned
* 1.9.x is the future, embrace it
* RVM recommended for installation (rvm.beginrescueend.com)
* USE 1.9!

!SLIDE smbullets

# Today (May 24, 2011) #

* Variables
* Strings
* Symbols
* Numbers
* Arrays
* Hashes
* Ranges
* Conditionals
* Control Structures

!SLIDE smbullets

# The Future #

* Building a contact manager in pure Ruby
* 60 minutes: Slides/Core Concepts
* 60 minutes: DIY

!SLIDE smbullets incremental

# Using Ruby #

* Use .rb for filenames
* ruby filename.rb
* ruby -e
* IRB
* ruby-doc.org

!SLIDE smbullets incremental

# Variables

* Not objects :)
* References to an object

!SLIDE

# Variables

	@@@ ruby
	a = 1
	b = 10 + 5
	c = a + b
	d = "Hello, "
	e = "SDRuby!"
	f = d + e
	g = f.length
	h = e * 5

!SLIDE

# Variables

	@@@ ruby
	a = 1
	b = a

	b # => 1

	a = 2

	b # => 1

!SLIDE

# Strings #
### http://ruby-doc.org/core/classes/String.html ###

	@@@ ruby
	group = "SDRuby"
	group.length # => 6

	group.upcase # => "SDRUBY"
	group # => "SDRuby"

	group.downcase! # => "sdruby"
	group # => "sdruby"

!SLIDE

# Strings #
### http://ruby-doc.org/core/classes/String.html ###

	@@@ ruby
	group    = "SDRuby"
	location = "San Diego"

	group + location # => "SDRubySan Diego"

	"#{group} is based in #{location}"
	# => "SDRuby is based in San Diego"

!SLIDE smbullets

# Symbols #
### http://ruby-doc.org/core/classes/Symbol.html ###

* Starts with a colon followed by one letter or more
* Looks like :this
* Like a string, but with less methods and no interpolation
* We won't use them much initially

!SLIDE

# Symbols #
### http://ruby-doc.org/core/classes/Symbol.html ###

	@@@ ruby
	"hello".methods
	"hello".methods.size

	:hello.methods
	:hello.methods.size

!SLIDE

# Numbers #

!SLIDE

# Integers (Fixnum/Bignum) #
### http://ruby-doc.org/core/classes/Fixnum.html ###
### http://ruby-doc.org/core/classes/Bignum.html ###
### http://ruby-doc.org/core/classes/Integer.html ###

!SLIDE

# Floating Point Numbers #
### http://ruby-doc.org/core/classes/Float.html ###

!SLIDE

# Integers #

	@@@ ruby
	100.class     # => Fixnum
	100.even?     # => true
	99.odd?       # => true
	99.even?      # => false
	99.succ       # => 100
	99.succ.even? # => true
	99.to_s       # => "99"

!SLIDE

# Floats #

	@@@ ruby
	f = 100.12
	f.class # => Float
	f.round # => 100
	f.ceil  # => 101
	f.floor # => 100
	f.to_s  # => "100.12"
	f + 1   # => 101.12

!SLIDE

# More Strings #

	@@@ ruby
	a = "SDRuby is #"
	b = 1
	a + b
	# => TypeError: can't convert Fixnum...

	"#{a}#{b}" # => "SDRuby is #1"

!SLIDE

# Arrays #
### http://ruby-doc.org/core/classes/Array.html ###

	@@@ ruby
	array = Array.new # => []

	animals = ["Pig", "Owl", "Shark"]

	animals[0]     # => "Pig"
	animals[1..2]  # => ["Owl", "Shark"]
	animals.sort   # => ["Owl", "Pig", "Shark"]

	animals.include?("Fox")
	# => false

!SLIDE

# Arrays #
### http://ruby-doc.org/core/classes/Array.html ###

	@@@ ruby
	numbers = [3,2,5,1,8,5,2,1]
	numbers.sort
	=> [1, 1, 2, 2, 3, 5, 5, 8]

	numbers.uniq
	=> [3, 2, 5, 1, 8]

	numbers.uniq.sort
	=> [1, 2, 3, 5, 8]

!SLIDE

# Hashes #
### http://ruby-doc.org/core/classes/Hash.html ###

	@@@ ruby
	hash = Hash.new # => {}

	pig = {weight: 1000, legs: 4}

	pig[:weight]    # => 1000
	pig[:legs]      # => 4

	pig.keys        # => [:weight, :legs]
	pig.values      # => [1000, 4]

!SLIDE

# Hashes #
### http://ruby-doc.org/core/classes/Hash.html ###
### http://ruby-doc.org/core/classes/Enumerable.html ###

	@@@ ruby
	produce = {
	  apples: 3, oranges: 1, carrots: 12
	}

	produce.each do |key, value|
	  puts "We have #{value} #{key}."
	end

!SLIDE

# Enumerable!!! #
### http://ruby-doc.org/core/classes/Enumerable.html ###

!SLIDE

# Hashes in 1.9 vs 1.8

	@@@ ruby
	h = {weight: 1000, legs: 4}       # => 1.9

	h = {:weight => 1000, :legs => 4} # => 1.8


!SLIDE

# Ranges #
### http://ruby-doc.org/core/classes/Range.html ###

	@@@ ruby
	(1..10).to_a
	# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

	(1...10).to_a
	# => [2, 3, 4, 5, 6, 7, 8, 9]

	(1..10).include?(5) # => true

	(1..10).each do |n|
	  puts n if n.odd?
	end

!SLIDE

# Ranges #
### http://ruby-doc.org/core/classes/Range.html ###

	@@@ ruby
	low  = 10
	high = 40

	(low..high).include?(55) # => false

	("a".."z").include?(5)   # => false
	("a".."z").include?("d") # => true
	("A".."Z").include?("d") # => false

!SLIDE

# Enumerable!!! #
### http://ruby-doc.org/core/classes/Enumerable.html ###

!SLIDE smbullets incremental

# Conditionals #

* Conditional statements evaluate to true or false
* Common operators: == (equal), > (greater than), >= (greater than or equal to), < (less than), and <= (less than or equal to)

!SLIDE

# Conditionals #

	@@@ ruby
	1 == 2   # => false
	1 == "1" # => false
	3 > 1    # => true
	1 >= 1   # => true

	name = "bensie"
	age  = 27

	if name == "bensie" and age > 21
	  puts "#{name} may consume alcohol"
	end


!SLIDE

# Control Structures #

	@@@ ruby
	today = Time.now

	if today.saturday?
	  puts "Do chores"
	elsif today.sunday?
	  puts "Relax"
	else
	  puts "Go to work"
	end

	puts "Do chores" if today.saturday?

!SLIDE

# Control Structures #

	@@@ ruby
	square = 4
	while square < 1000
	  square = square * square
	  puts square
	end

!SLIDE

# Control Structures #

	@@@ ruby
	temperature = 72

	case temperature
	when 0..32
	  puts "Freezing!"
	when 33..65
	  puts "Not bad"
	when 66..85
	  puts "Sounds like sunny San Diego!"
	when 86..100
	  puts "Way too hot!"
	end

!SLIDE

# Questions? #
