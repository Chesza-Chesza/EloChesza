class Elo::Calculate
  def initialize(elo1, elo2, points, k_value)
    @player = elo1
    @opponent = elo2
    @points = points
    @k_value = k_value
  end

  def self.init(elo1, elo2, points, k_value)
    data = self.new(elo1, elo2, points, k_value)
    data.rtng_change
  end

  def rtng_change
    result = Elo::RtngChange.init(@player, @opponent, @points, @k_value)
    # (@player + result).round
    result
  end
end
