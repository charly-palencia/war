class War
  attr_reader :finished_combats

  def initialize(red_quantity, blue_quantity)
    @red_quantity = red_quantity
    @blue_quantity = blue_quantity
    @finished_combats = []
    @combats = []
  end

  def begin!
    @red_team = generate_players(@red_quantity, 'red')
    @blue_team = generate_players(@blue_quantity, 'blue')
    @combats = interleave_players

    @combats.map do |combat_players|
      Thread.new do
        Combat.new(*combat_players.shuffle).tap do |combat|
          combat.add_observer(self)
          combat.fight!
        end
      end
    end

    while @finished_combats.count < @combats.count do
    end

    puts('')
    puts("=" * 23)
    puts(@finished_combats.max_by {|team| @finished_combats.count(team) })
  end

  def update(combat)
    print('🛡 🗡 ')
    @finished_combats.push(combat.winner)
  end

  def generate_players(qty, team_name)
    Array.new(qty) {|index| Player.new(team_name) }
  end

  def interleave_players
    total_players = [@red_team, @blue_team]
    max_list  = total_players.max_by(&:length)
    total_players -= [max_list]
    max_list.zip(*total_players)
  end
end
