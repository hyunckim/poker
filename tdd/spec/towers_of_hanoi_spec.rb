require 'towers_of_hanoi'

describe TowerOfHanoi do

  subject(:hanoi) { TowerOfHanoi.new }

    describe '#initialize' do
      it 'sets towers to be an array' do
        expect(hanoi.towers).to be_an_instance_of(Array)
      end

      it 'sets the first tower correctly' do
        expect(hanoi.towers[0]).to eq([3, 2, 1])
      end

      it 'sets the other two towers to be empty' do
        expect(hanoi.towers[1]).to be_empty
        expect(hanoi.towers[2]).to be_empty
      end
    end

    describe '#move' do
      before(:each) { hanoi.move(0,1) }

      it 'moves the disc to the correct tower' do
        expect(hanoi.towers[1]).to eq([1])
      end

      it 'raises an error when you try to move a bigger disc to a smaller disc' do
        expect{ hanoi.move(0,1) }.to raise_error("Invalid move.")
      end

      it 'removes the old disc from the tower' do
        expect(hanoi.towers[0]).to_not include(1)
      end

      it 'places the disc to a new tower' do
        expect(hanoi.towers[1]).to include(1)
      end

      it 'does not affect the other tower' do
        expect(hanoi.towers[2]).to_not include(1, 2, 3)
      end

      it 'raises an error when argument is out of range' do
        expect { hanoi.move(3,1) }.to raise_error("Invalid move.")
        expect { hanoi.move(1,5) }.to raise_error("Invalid move.")
      end

      it 'raises an error when it tries to move from an empty tower' do
        expect { hanoi.move(2,1) }.to raise_error("Invalid move.")
      end

    end

    describe '#won?' do
      before(:each) {
        hanoi.move(0, 2)
        hanoi.move(0, 1)
        hanoi.move(2, 1)
        hanoi.move(0, 2)
        hanoi.move(1, 0)
        hanoi.move(1, 2)
      }
      it 'returns true when the game is won' do
        hanoi.move(0, 2)
        expect(hanoi.won?).to be_truthy
      end

      it 'returns false when the game is not over' do
        expect(hanoi.won?).to be_falsey
      end
    end
end
