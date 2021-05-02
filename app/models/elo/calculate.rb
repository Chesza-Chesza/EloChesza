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

  def init
    rating_variation = (@k_value * (@points * @percentage))
  end

  def calculateHigherPercentage(difference)
    a = [3, 10, 17, 25, 32, 39, 46, 53, 61, 68, 76, 83, 91, 98, 106, 113, 121, 129, 137, 145, 153, 162, 170, 179, 188, 197, 206, 215, 225, 235, 245, 256, 267, 278, 290, 302, 315, 328, 344, 357, 374, 391, 411, 432, 456, 484, 517, 559, 619, 735]
    xpercentage = 0
     
    a.each_with_index do |rtng_diff, index|
      break if rtng_diff >= difference

      number = (0.5 + ((index + 1).to_f / 100))
      xpercentage = number.truncate(2)
    end

    xpercentage
  end

  def calculateHigherPercentage(difference)
    a = [3, 10, 17, 25, 32, 39, 46, 53, 61, 68, 76, 83, 91, 98, 106, 113, 121, 129, 137, 145, 153, 162, 170, 179, 188, 197, 206, 215, 225, 235, 245, 256, 267, 278, 290, 302, 315, 328, 344, 357, 374, 391, 411, 432, 456, 484, 517, 559, 619, 735]
    xpercentage = 0
     
    a.each_with_index do |rtng_diff, index|
      break if rtng_diff >= difference

      number = (0.5 - ((index + 1).to_f / 100))
      xpercentage = number.truncate(2)
    end

    xpercentage
  end

end
