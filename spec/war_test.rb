require "minitest/autorun"
require_relative "../app"

describe War do
  before do
    @player_count = 10
    @war = War.new(@player_count, @player_count)
  end

  describe "#begin!" do
    it 'retuns a winner' do
      @war.begin
      @war.finished_combats.count.must_equal @player_count
      @war.winner_team.wont_be_nil
    end
  end
end
