class Combat
  include Subject
  attr :attackers
  def initialize(attacker, defender)
    super()
    @attacker = attacker
    @defender = defender
  end

  def fight!
    while (@attacker.alive? && @defender.alive?) do
      attack = @attacker.roll_dice
      defense = @defender.roll_dice

      if attack > defense
        @defender.hit!
      elsif attack < defense
        @attacker.hit!
      else
        @attacker.hit!
      end
    end

    notify_observers
  end

  def winner
    @attacker.alive? ?  @attacker.team : @defender.team
  end
end
