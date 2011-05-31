!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

# Week 2 #

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

## An instance of a larger classification ##

!SLIDE

# Objects #

## State + Behavior ##

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

# Instance Variables #

* Name beginning with @
* Different objects of the same class can have different values
* Cannot be observed or altered from outside the object
* Do not need to be declared
* nil until they are initialized

!SLIDE

# Objects #

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

# Objects #

	@@@ ruby
	b = BaseballPlayer.new
	b.team = "Yankees"
	b.inspect
	# => #<BaseballPlayer:0x0xx @team="Yankees">