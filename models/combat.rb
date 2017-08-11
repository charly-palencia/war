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
      attack = Dice.roll(sides=6)
      defense = Dice.roll(sides=6)

      if attack > defense
        @defender.hit!
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
