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
* Enumerable

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

# Require #

	@@@ ruby
	# Ruby 1.9
	require_relative "my_nearby_file"

	# Ruby 1.8
	require File.expand_path(
		"../my_nearby_file", __FILE__
	)

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

!SLIDE

# Working with Files #

!SLIDE

# Working with Files #
### http://www.ruby-doc.org/core/classes/File.html ###
### http://www.ruby-doc.org/core/classes/IO.html ###
### http://www.ruby-doc.org/stdlib/libdoc/fileutils/rdoc/index.html ###

	@@@ ruby
	f = File.open("/path/to/file.txt")
	f.each_line do |line|
	  puts line
	end

!SLIDE

# Working with Files #

### http://www.ruby-doc.org/stdlib/libdoc/fileutils/rdoc/index.html ###

	@@@ ruby
	require 'fileutils'

	cd(dir, options)
	mkdir(dir, options)
	rmdir(dir, options)
	ln(old, new, options)
	ln_s(old, new, options)
	cp(src, dest, options)
	mv(src, dest, options)
	rm(list, options)
	rm_rf(list, options)
	chmod(mode, list, options)
	chown(user, group, list, options)
	touch(list, options)

!SLIDE

# Enumerable #

### http://ruby-doc.org/core/classes/Enumerable.html ###

!SLIDE

# Enumerable#map (collect) #

	@@@ ruby
	people = [
	  { name: "James", born: 1984 },
	  { name: "Joe",   born: 1975 },
	  { name: "Greg",  born: 1977 }
	]

	names = people.map do |p|
	  p[:name]
	end
	# => ["James", "Joe", "Greg"]

	names.join(", ")
	# => "James, Joe, Greg"

!SLIDE

# Enumerable#any?

	@@@ ruby
	people = [
	  { name: "James", born: 1984 },
	  { name: "Joe",   born: 1975 },
	  { name: "Greg",  born: 1977 }
	]

	people.any? do |p|
	  p[:born] > 1975
	end
	# => true

	people.any? do |p|
	  p[:name] =~ /^J/
	end
	# => true

!SLIDE

# Enumerable#select

	@@@ ruby
	people = [
	  { name: "James", born: 1984 },
	  { name: "Joe",   born: 1975 },
	  { name: "Greg",  born: 1977 }
	]

	j = people.select do |p|
	  p[:name] =~ /^J/
	end

	j = people.select {|p| p[:name] =~ /^J/ }

	j.map {|p| p[:name] }
	# => ["James", "Joe"]

!SLIDE

# Exercise #
### https://gist.github.com/1026177 ###
