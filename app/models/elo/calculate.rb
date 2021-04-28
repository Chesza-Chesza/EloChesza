class Elo::Calculate
  def initialize(elo1, elo2, points, k_value, percentage)
    @elo1 = elo1
  end

  def self.rtng_change
    self.new(elo1, elo2, points, k_value, percentage)
  end

end