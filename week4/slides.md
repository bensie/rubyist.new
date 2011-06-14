!SLIDE

## SDRuby ##

# Rubyist.new #

### James Miller ###

!SLIDE

# Week 4 #

!SLIDE smbullets

# Today #

* Raising Exceptions
* Unit Testing and TDD
* Using Gems
* Require
* Working With Files

!SLIDE

# Raising Exceptions #

!SLIDE

# Raising Exceptions #

	@@@ ruby
	class Photo
	  class BadJPEG < StandardError; end

	  def do_some_processing(image)
	    process_image(image)
	    do_more_dependent_processing
	  rescue BadJPEG
	    send_an_email_notification
	  end

	  def process_image(io)
	    unless io.readbyte == 0xFF
	      raise BadJPEG
	    end
	  end
	end

!SLIDE

# Unit Testing and TDD #

!SLIDE

# Unit Testing and TDD #

	@@@ ruby
	require 'test/unit'

	class Contact
	  attr_accessor :name
	end

	class ContactTest < Test::Unit::TestCase
	  def setup
	    @person = Contact.new
	  end

	  def test_contact_has_name_reader_method
	    assert_nil @person.name
	  end
	end

!SLIDE

# Unit Testing and TDD #
### ruby-doc.org/stdlib/libdoc/test/unit/rdoc/classes/Test/Unit/Assertions.html ###

	@@@ ruby
	assert
	assert_equal
	assert_not_equal
	assert_nil
	assert_not_nil
	assert_raise
	assert_nothing_raised
	assert_respond_to

!SLIDE

# Require #

!SLIDE

# Require #

	@@@ ruby
	require 'securerandom'

	SecureRandom.hex(10)
	# => "52750b30ffbc7de3b362"

!SLIDE

# Using Gems #

!SLIDE

# Using Gems #

	@@@ sh
	gem install sequel

!SLIDE

	@@@ ruby
	require 'sequel'

	DB = Sequel.sqlite # memory database

	DB.create_table :items do
	  primary_key :id
	  String :name
	  Float :price
	end

	i = DB[:items]
	i.insert(
	  name: 'abc',
	  price: rand * 100
	)

	puts "Item count: #{i.count}"
	puts "First item price: #{i.first[:price]}"
