!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

# Week 2 #

!SLIDE

# Methods #

	@@@ ruby
	1.even?

	(1..10).include?(5)

	[1,3,5].reject{|n| n == 3}

	"123".to_i

!SLIDE

# Methods #

	@@@ ruby
	def	do_something
	  # ...
	end

	def	do_something_with_args(arg1, arg2)
	  # ...
	end

!SLIDE

# Methods #

	@@@ ruby
	def tax_amount(dollars, rate = 8.75)
	  ((dollars * rate) / 100).round(2)
	end

	tax_amount(75)    # => 6.56

	tax_amount(75, 5) # => 3.0

	tax_amount        # => ArgumentError

!SLIDE

# Objects #

## Instances of a larger classification ##

!SLIDE

# Objects #

	@@@ ruby
	String.ancestors
	# [String, Comparable, Object,
	# Kernel, BasicObject]

	Hash.ancestors
	# [Hash, Enumerable, Object,
	# Kernel, BasicObject]

	Fixnum.ancestors
	# [Fixnum, Integer, Numeric, Comparable,
	# Object, Kernel, BasicObject]

!SLIDE

# Class Declaration #

	@@@ ruby
	class Player
	end

	Player.class
	# => Class

	Class.ancestors
	# [Class, Module, Object,
	# Kernel, BasicObject]

!SLIDE

# Objects #

## State + Behavior = Object ##

!SLIDE

# Objects #

	@@@ ruby
	class Player
	end

	class BaseballPlayer < Player
	end

	class BasketballPlayer < Player
	end

	class HockeyPlayer < Player
	end

!SLIDE smbullets

# Objects #
## State ##

* Name
* Height
* Weight
* Team
* HR / RBI / Avg / Errors
* Goals / Assists / Penalties

!SLIDE smbullets

# Objects #
## Behavior ##

* Throw
* Catch
* Swing
* Dribble
* Shoot

!SLIDE smbullets

# Instance Variables #

* Name beginning with @
* Different objects of the same class can have different values
* Cannot be observed or altered from outside the object
* Do not need to be declared
* nil until they are initialized

!SLIDE

# Accessor Methods #

	@@@ ruby
	class Player
	  def team
	    @team
	  end

	  def team=(team)
	    @team = team
	  end
	end

!SLIDE

# Accessor Methods #

	@@@ ruby
	class Player
	  attr_accessor :team
	end

!SLIDE

# Accessor Methods #

	@@@ ruby
	b = BaseballPlayer.new
	b.team = "Yankees"
	b.inspect
	# => #<BaseballPlayer:0x0xx @team="Yankees">

!SLIDE

# Accessor Methods #

	@@@ ruby
	attr_accessor :team

	attr_reader :team

	attr_writer :team

!SLIDE smbullets

# Initialize #
### initialize() ###

* Special constructor method gets called for all new objects
* Set initial attributes for all new instances of that class
* Require arguments to create a new object

!SLIDE

# Initialize #

	@@@ ruby
	class BaseballPlayer < Player

	  attr_accessor :batting_average, :home_runs
	  attr_reader :name

	  def initialize(name)
	    @name            = name
	    @batting_average = 0
	    @home_runs       = 0
	  end

	end

!SLIDE

# Methods #

	@@@ ruby
	class HockeyPlayer < Player
	  attr_accessor :shot_percentage

	  def initialize
	    @shot_percentage = 0
	  end

	  def shoot
	    if shot_percentage > 50
	      puts "SCORE!"
	    else
	      puts "MISS!"
	    end
	  end
	end

!SLIDE

# Methods #

	@@@ ruby
	h = HockeyPlayer.new
	h.shoot
	# => "MISS!"

	h.shot_percentage = 75
	h.shoot
	# => "SCORE!"

!SLIDE

# Method Visibility #

## public ##
## protected ##
## private ##

!SLIDE smbullets incremental

# Method Visibility #

* public: methods can be called by anyone - no access control. Methods are public by default (except for initialize)
* protected: methods can only be invoked by objects of the defining class and its subclasses
* private: methods cannot be called with an explicit receiver - receiver is always the current object (self)

!SLIDE

# Method Visibility #

	@@@ ruby
	class HockeyPlayer < Player
	  attr_accessor :shot_percentage

	  def shoot
	    puts "SCORE!" if high_shot_percentage?
	  end

	  private

	  def high_shot_percentage?
	    (shot_percentage || 0) > 50
	  end
	end

!SLIDE

# Method Visibility #

	@@@ ruby
	h = HockeyPlayer.new
	h.shot_percentage = 75
	h.shoot
	# => "SCORE!"

	h.high_shot_percentage?
	# NoMethodError: private method `high_...

!SLIDE

# test/unit #
### http://ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html ###

!SLIDE

# Ruby Standard Library #
### http://ruby-doc.org/stdlib/ ###

	@@@ ruby
	require 'digest/sha2'
	Digest::SHA2.hexdigest("password")
	# => "5e884898da280..."

	require 'csv'
	CSV.generate(...)

	require 'net/http'
	Net::HTTP.new("api.github.com", 80)
