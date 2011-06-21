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
	class Foo
	  %w(dev stage prod).each do |env|
	    define_method "test_#{env}" do |reset_db|
	      if reset_db && env != "prod"
	        puts "Resetting db project_#{env}"
	      end
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

	@@@ ruby
	%w(length split reverse).each do |meth|
	  "James Miller".send(meth)
	end

	# 12
	# ["James", "Miller"]
	# "relliM semaJ"

!SLIDE

# Metaprogramming #

!SLIDE

# Mix-In Conventions #

!SLIDE

# Mix-In Conventions #

	@@@ ruby
	module M
	  def self.included(base)
	    base.extend ClassMethods
	    base.send :include, InstanceMethods
	    base.some_class_method
	  end

	  module ClassMethods
	    # ...
	  end

	  module InstanceMethods
	    # ...
	  end
	end

!SLIDE

# ActiveSupport::Concern #

	@@@ ruby
	module M
	  extend ActiveSupport::Concern

	  included do
	    some_class_method
	  end

	  module ClassMethods
	    # ...
	  end

	  module InstanceMethods
	    # ...
	  end
	end

