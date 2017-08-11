require './app'

#only for exact qty of players
war = War.new(10, 10)
war.begin

puts('')
puts("=" * 23)
puts(war.winner_team)
