class User
  attr_reader :name, :jokes
  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

def tell(target, joke)
  target.jokes << joke
end

def joke_by_id(id_num)
  @jokes.select do |joke|
    joke.id == (id_num)
  end
  end
end
