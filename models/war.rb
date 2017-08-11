class War
  attr_reader :finished_combats

  def initialize(red_count, blue_count)
    @finished_combats = []
    @combats = []
    @red_team = generate_players(red_count, 'red')
    @blue_team = generate_players(blue_count, 'blue')
    @combats = group_contenders
  end

  def begin
    @combats.map do |combat_players|
      Thread.new do
        combat = Combat.new(*combat_players.shuffle)
        combat.add_observer(self)
        combat.fight!
      end
    end

    loop do
      break if @finished_combats.count == @combats.count
    end
  end

  def update(combat)
    print('🛡 🗡 ')
    @finished_combats.push(combat.winner)
  end

  def winner_team
    @winner_team ||= @finished_combats.max_by {|team| @finished_combats.count(team) }
  end

  private

  def generate_players(player_count, team_name)
    Array.new(player_count) {|index| Player.new(team_name) }
  end

  def group_contenders
    total_players = [@red_team, @blue_team]
    max_list  = total_players.max_by(&:length)
    total_players -= [max_list]
    max_list.zip(*total_players)
  end
end
