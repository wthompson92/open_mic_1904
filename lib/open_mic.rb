class OpenMic
  attr_reader :location, :date, :performers

  def initialize(hash)
    @location = hash[:location]
    @date = hash[:date]
    @performers = []
    @jokes_told = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    @performers.each do |performer|
    if performer.jokes.uniq
      return false
    else
      return true
    end
  end
end
end
