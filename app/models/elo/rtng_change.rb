class Elo::RtngChange
  def initialize(player, opponent, points, k_value, percentage)
    @player = player
    @opponent = opponent
    @points = points
    @k_value = k_value
    @percentage = percentage
    @difference = player - opponent
  end

  def self.init(elo1, elo2, points, k_value, percentage)
    data = self.new(elo1, elo2, points, k_value, percentage)
    data.compute
  end

  def compute
    @difference = @difference > 400 ? 400 : @difference < -400 ? -400 : @difference
    
    if @difference < 0
      @difference = @difference.abs
      @percentage = calculateLowerPercentage
    else
      @percentage = calculateHigherPercentage
    end

    if @difference.abs < 4
      @percentage = 0.5
    end

    (@k_value.to_f * (@points.to_f - @percentage)).truncate(2)
  end

  def calculateHigherPercentage
    a = [3, 10, 17, 25, 32, 39, 46, 53, 61, 68, 76, 83, 91, 98, 106, 113, 121, 129, 137, 145, 153, 162, 170, 179, 188, 197, 206, 215, 225, 235, 245, 256, 267, 278, 290, 302, 315, 328, 344, 357, 374, 391, 411, 432, 456, 484, 517, 559, 619, 735]
    xpercentage = 0
     
    a.each_with_index do |rtng_diff, index|
      break if rtng_diff >= @difference

      number = (0.5 + ((index + 1).to_f / 100))
      xpercentage = number.truncate(2)
    end

    xpercentage
  end

  def calculateLowerPercentage
    a = [3, 10, 17, 25, 32, 39, 46, 53, 61, 68, 76, 83, 91, 98, 106, 113, 121, 129, 137, 145, 153, 162, 170, 179, 188, 197, 206, 215, 225, 235, 245, 256, 267, 278, 290, 302, 315, 328, 344, 357, 374, 391, 411, 432, 456, 484, 517, 559, 619, 735]
    xpercentage = 0
     
    a.each_with_index do |rtng_diff, index|
      break if rtng_diff >= @difference

      number = (0.5 - ((index + 1).to_f / 100))
      xpercentage = number.truncate(2)
    end

    xpercentage
  end
end