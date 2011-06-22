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

!SLIDE

# Ruby on Rails #

!SLIDE smbullets

# ActiveSupport #

* Useful utility classes and standard library extensions
* Designed for Rails, but moved out into separate lib to so it can be included in Ruby projects

!SLIDE

# ActiveSupport #

	@@@ ruby
	class Object
	  def blank?
	    respond_to?(:empty?) ? empty? : !self
	  end

	  def present?
	    !blank?
	  end

	  def presence
	    self if present?
	  end
	end

!SLIDE smbullets

# ActiveModel #

* Allow for other Rails helpers to interact with non-ActiveRecord models
* Helps building custom ORMs

!SLIDE smbullets

# ActiveRecord #

* Connects classes to relational database tables  for a zero-configuration persistence layer
* Provides a base class that, when subclassed, sets up a mapping between the new class and an existing table in the database (models)

!SLIDE

# ActiveRecord #

	@@@ ruby
	class Product < ActiveRecord::Base
	end

!SLIDE smbullets

# ActionController #

* Provides a base controller class that can be subclassed to implement filters and actions to handle requests
* The result of an action is typically content generated from views

!SLIDE

# ActionController #

	@@@ ruby
	class ProductsController < ActionController::Base
	  before_filter :find_product

	  def index
	  end

	  def show
	  end

	  private

	  def find_product
	    @product = Product.find(params[:id])
	  end
	end

!SLIDE

# Questions? #
