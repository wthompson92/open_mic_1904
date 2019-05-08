require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

def setup
  @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

end

def test_it_exists
  expected = Joke
  actual = @joke

  assert_instance_of expected, actual
end

def test_joke_has_an_id
  expected = 1
  actual =  @joke.id

end

def test_it_has_a_setup

expected = "Why did the strawberry cross the road?"
actual = @joke.setup
end

def test_it_has_a_punchline
  expected =  "Because his mother was in a jam."
actual = @joke.punchline
end

end
