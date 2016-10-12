require 'spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:player) { Player.new("Nick", 'X') }
  describe "#initialize" do
    it 'can be initialized with 6 rows and 7 columns by default' do
      expect(board.rows.size).to eq(6)
      expect(board.rows[0].size).to eq(7)
    end
  end

  describe "#drop_token" do
    context "a player drops a token into an empty column on an empty board" do
      it "drops a token into the bottom most row" do
        board.drop_token('D', player)
        expect(board.rows.last[3].player.token).to eq('X')
        expect(board.rows.last[3].player.token).to_not eq('O')
      end
    end

    context "a player drops a token into a column that already has a token present" do
      it "drops a token into the second from the bottom row" do
        board.drop_token('D', player)
        board.drop_token('D', player)
        expect(board.rows[-1][3].player.token).to eq('X')
        expect(board.rows[-2][3].player.token).to eq('X')
      end
    end

    context "a player drops a token into an empty column on a not empty board" do
      it "drops a token into the bottom most row" do
        board.drop_token('C', player)
        expect(board.rows.last[2].player.token).to eq('X')
      end
    end
  end

  describe "#empty_spaces?" do
    it "checks the game board to see if there are any empty_spaces left" do
      expect(board.empty_spaces?).to eq(true)
    end
  end

  describe "#wrong_letter?" do
    context "when user chooses an incorrect column letter" do
      let(:letter) { 'Z' }
      it "returns true if the letter the user choose is not a valid column" do
        expect(board.wrong_letter?(letter)).to eq(true)
      end
    end

    context "when user chooses a correct column letter" do
      let(:letter) { 'D' }
      it "returns true if the letter the user choose is not a valid column" do
        expect(board.wrong_letter?(letter)).to eq(false)
      end
    end
  end

  describe "#horizontal_win?" do
    context "when there are 4 in a row horizontally" do
      it "returns victory = true" do
        board.drop_token('A', player)
        board.drop_token('B', player)
        board.drop_token('C', player)
        board.drop_token('D', player)
        binding.pry
        expect(board.horizontal_win?).to eq(true)
      end
    end

    context "when there are not 4 in a row horizontally" do
      it "returns victory = false" do
        board.drop_token('A', player)
        board.drop_token('B', player)
        board.drop_token('C', player)
        board.drop_token('E', player)
        # binding.pry
        expect(board.horizontal_win?).to eq(false)
      end
    end
  end
end
