class Elo::Calculate
  def initialize(elo1, elo2, points, k_value, percentage)
    @player = elo1
    @opponent = elo2
    @points = points
    @k_value = k_value
    @percentage = percentage
  end

  def self.rtng_change(elo1, elo2, points, k_value, percentage)
    data = self.new(elo1, elo2, points, k_value, percentage)
    data.init
  end

  def hola
    @player
  end



  def init
    rating_variation = (@k_value * (@points * @percentage))
  end

  def calculateHigherPercentage

  end

  def calculateLowerPercentage
    
  end

end