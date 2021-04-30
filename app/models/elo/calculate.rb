class Elo::Calculate
  def initialize(elo1, elo2, points, k_value, percentage)
    @player = elo1
    @opponent = elo2
    @points = points
    @k_value = k_value
    @percentage = percentage
    @difference = elo1 - elo2
  end

  def self.init(elo1, elo2, points, k_value, percentage)
    data = self.new(elo1, elo2, points, k_value, percentage)
    data.rtng_change
  end

  def rtng_change
    result = Elo::RtngChange.init(@player, @opponent, @points, @k_value, @percentage)
    # (@player + result).round
    result
  end
end
