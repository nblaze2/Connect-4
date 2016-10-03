require 'spec_helper'
require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }
  describe "#initialize" do
    it 'can be initialized with 6 rows and 7 columns by default' do
      expect(board.rows.size).to eq(6)
      expect(board.rows[0].size).to eq(7)
    end
  end

  describe "#drop_token" do
    context "a player drops a token into an empty column on an empty board" do
      it "drops a token into the bottom most row" do
        board.drop_token('D', 'X')
        expect(board.rows.last[3]).to eq('X')
      end
    end

    context "a player drops a token into a column that already has a token present" do
      it "drops a token into the second from the bottom row" do
        board.drop_token('D', 'X')
        board.drop_token('D', 'X')
        expect(board.rows[-1][3]).to eq('X')
        expect(board.rows[-2][3]).to eq('X')
      end
    end

    context "a player drops a token into an empty column on a not empty board" do
      it "drops a token into the bottom most row" do
        board.drop_token('C', 'O')
        expect(board.rows.last[2]).to eq('O')
      end
    end
  end
end
