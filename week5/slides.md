!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

# Week 5 #

!SLIDE smbullets

# Today #

* Metaprogramming
* Mix-In Conventions
* Digging into Rails

!SLIDE

# Metaprogramming #
### Code that writes code ###


!SLIDE

# Metaprogramming #

	@@@ ruby
	%w(dev stage prod).each do |env|
	  define_method "test_#{env}" do |reset_db|
	    if reset_db && env != "prod"
	      puts "Resetting db project_#{env}"
	    end
	  end
	end

!SLIDE

# Metaprogramming #

	@@@ ruby
	def test_dev(reset_db)
	  if reset_db && env != "prod"
	    puts "Resetting db project_dev"
	  end
	end

	def test_stage(reset_db)
	  # ...
	end

	def test_prod(reset_db)
	  # ...
	end

!SLIDE

# Metaprogramming #

	@@@ ruby
	"James Miller".send(:length)
	# => 12

	"James-Miller".send(:split, "-")
	# => ["James", "Miller"]

!SLIDE

# Metaprogramming #
