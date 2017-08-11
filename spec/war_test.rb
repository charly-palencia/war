require "minitest/autorun"
require_relative "../app"

describe War do
  before do
    @war = War.new(10, 10)
  end

  describe "#begin!" do
    it 'retuns a winner' do
      @war.begin!
      @war.finished_combats.count.must_equal 10
    end
  end
end
