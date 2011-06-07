!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

# Week 3 #

!SLIDE smbullets

# Today #

* Instance variable review
* Accessor method review
* Inheritance
* Method lookup
* Class methods
* Class variables and constants
* Namespaces
* Exceptions (begin, rescue, end)
* Mix-ins

!SLIDE

# Instance Variables #

	@@@ ruby
	def initialize(pkey, options = {})
	  @key_object = OpenSSL::PKey::RSA.new(pkey)
	  @type       = "rsa"
	  @comment    = options[:comment] || ""
	end

!SLIDE

# Accessor Methods

	@@@ ruby
	attr_reader :key_object
	attr_accessor :comment

	def key_object
	  @key_object
	end

	def comment
	  @comment
	end

	def comment=(comment)
	  @comment = comment
	end

!SLIDE smbullets incremental

# Inheritance
### Define a relation between two classes ###

* All objects know their class
* Classes know their superclass (parent class)
* Classes lower down the hierarchy get the features of those higher up, but can add specific features of their own
* Classes can only inherit from a single other class
* Allows you to append or redefine differences between each subclass rather than reinvent the wheel

!SLIDE

# Inheritance

	@@@ ruby
	class Mammal
	  def breathe
	    puts "Breathing!"
	  end
	end

	class Human < Mammal
	  def talk
	    puts "Talking!"
	  end
	end

	Human.new.breathe # => "Breathing!"
	Human.new.talk    # => "Talking!"

!SLIDE

# Inheritance

	@@@ ruby
	class Bird
	  def fly
	    puts "Flying!"
	  end
	  def lay_eggs
	    puts "Laying eggs!"
	  end
	end
	class Penguin < Bird
	  def fly
	    puts "I can't :("
	  end
	end
	Penguin.new.fly      # => "I can't :("
	Penguin.new.lay_eggs # => "Laying eggs!"

!SLIDE

# Method Lookup

!SLIDE smbullets

# Class Methods

!SLIDE

# Class Methods

	@@@ ruby
	class Person
	  def self.search(name)
	    if found = SQL.find(name)
	      Person.new(found)
	    else
	      raise "Person not found"
	    end
	  end
	end

!SLIDE

# Class Methods

	@@@ ruby
	class SSHKey
	  def self.generate(options = {})
	    SSHKey.new(RSA.generate(bits), options)
	  end

	  def initialize
	    # ...
	  end
	end

!SLIDE

# Class Variables

	@@@ ruby
	class Polygon
	  @@sides = 10

	  def self.sides
	    @@sides
	  end
	end

	class Triangle < Polygon
	  @@sides = 3
	end

	Triangle.sides # => 3
	Polygon.sides  # => 3

!SLIDE smbullets

# Constants

* Names must start with an uppercase character
* Should only ever be assigned once
* Reassignment generates a warning
* Can be defined within classes, but are accessible outside the class

!SLIDE

# Constants

	@@@ ruby
	class Polygon
	  SIDES = 10
	end

	class Triangle < Polygon
	  SIDES = 3
	end

	Triangle::SIDES # => 3
	Polygon::SIDES  # => 10
	SIDES # => NameError: uninitialized constant
