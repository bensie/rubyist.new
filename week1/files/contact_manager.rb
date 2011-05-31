require 'test/unit'

class PersonTest < Test::Unit::TestCase

  def setup
    @james = Person.new
    @james.name = "James Miller"

    @prince = Person.new
    @prince.name = "Prince"
  end

  def test_person_has_a_full_name
    assert_equal "James Miller", @james.name
    assert_equal "Prince", @prince.name
  end

  def test_james_has_a_first_name
    assert_equal "James", @james.first_name
  end

  def test_prince_has_a_first_name
    assert_equal "Prince", @prince.first_name
  end

  def test_james_has_a_last_name
    assert_equal "Miller", @james.last_name
  end

  def test_prince_does_not_have_a_last_name
    assert_nil @prince.last_name
  end

  def test_person_can_have_a_title
    @james.title = "President"
    assert_equal "President", @james.title
  end

end

class CompanyTest < Test::Unit::TestCase

  def setup
    @company = Company.new
    @company.name = "SDRuby"
  end

  def test_company_has_a_name
    assert_equal "SDRuby", @company.name
  end

  def test_company_does_not_respond_to_title
    assert !@company.respond_to?(:title)
  end

end
