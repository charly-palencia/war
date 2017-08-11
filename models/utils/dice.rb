module Dice
  extend self
  def roll(sides)
    rand(sides) + 1
  end
end
