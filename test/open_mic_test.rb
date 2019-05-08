require './lib/open_mic'
require './lib/user'
require './lib/joke'
require 'minitest/autorun'
require 'minitest/pride'

class OpenMicTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_it_exists
    expected = OpenMic
    actual = @open_mic

    assert_instance_of expected, actual
  end

  def test_it_has_a_location
    expected = "Comedy Works"
    actual = @open_mic.location

    assert_equal expected, actual
  end

  def test_it_has_a_date
    expected = "11-20-18"
    actual = @open_mic.date

    assert_equal actual, expected
  end

  def test_performers_starts_empty
    actual = []
    expected = @open_mic.performers
  end

  def test_welcome_method_adds_comics_to_open_mic
    open_mic.welcome(@sal)
    open_mic.welcome(@ali)
    expected = [@ali, @sal]
    actual = @open_mic.performers
    assert_equal actual, expected
  end

  def test_if_jokes_are_repeated
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    expected = false
    actual = @open_mic.repeated_jokes?
    assert_equal expected, actual

    ali.tell(@sal, @joke_1)
    expected = true
    actual = @open_mic.repeated_jokes?
    assert_equal expected, actual
  end
end
