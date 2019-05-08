require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

def test_it_exists
  expected = User
  actual = @sal
assert_instance_of expected, actual
end

def test_user_has_a_name
  expected = "Sal"
  actual = @sal.name
assert_equal expected, actual
end

def test_user_jokes_starts_as_empty_array
  expected = []
  actual = @sal.jokes
  assert_equal expected, actual
end

def test_user_can_learn_jokes
@sal.learn(@joke_1)
@sal.learn(@joke_2)
expected = [@joke_1, @joke_2]
actual = @sal.jokes
end

def test_user_can_tell_jokes_to_target
   @sal.tell(@ali, @joke_1)
   @sal.tell(@ali, @joke_2)
   expected = [@joke_1, @joke_2]
   actual = @ali.jokes
   assert_equal expected, actual

 end

 def test_can_get_joke_id_from_user_joke
   @sal.tell(@ali, @joke_1)
   @sal.tell(@ali, @joke_2)
   expected = [@joke_1]
   actual = @ali.joke_by_id(1)

   assert_equal expected, actual

   expected = [@joke_2]
   actual = @ali.joke_by_id(2)

   assert_equal expected, actual
 end

end
