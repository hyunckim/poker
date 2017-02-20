require 'stock_picker'

describe '#stock_picker' do

  let (:stocks) { [40, 80, 43, 62, 53, 67, 20, 1, 31, 91] }

  it 'raises an error when not given an array' do
    expect { stock_picker(3) }.to raise_error("Invalid Argument: needs a array")
  end

  context 'stock was bought before it was sold' do
    it 'returns an array with the best days to buy and sell' do
      expect(stock_picker(stocks)).to eq([7, 9])
    end

    it 'ensures stock was bought before sold' do
      days = stock_picker(stocks)
      expect(days[0]).to be < (days[1])
    end
  end

  it 'returns an empty array if stock always goes down' do
    expect(stock_picker([9, 5, 4, 3, 2, 1])).to be_empty
  end
end
