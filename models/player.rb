class Player
  DEFAULT_LIFEPOINTS = 10
  attr :team
  def initialize(team)
    super()
    @team = team
    @life_points = DEFAULT_LIFEPOINTS
  end

  def alive?
    @life_points > 0
  end

  def hit!
    @life_points-=1
  end
end
