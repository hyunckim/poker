require 'extend_array'

describe Array do
  describe '#my_uniq' do

    let(:array) { [1, 2, 1, 3, 3] }

    it 'does not modify orginal Array' do
      array.my_uniq
      expect(array).to eq(array)
    end

    it 'returns an array' do
      expect(array.my_uniq).to be_an_instance_of(Array)
    end

    it 'there is only one of each element in the return array' do
      expect(array.my_uniq).to eq(array.uniq)
    end

    it 'does not call built in uniq' do
      expect(array.my_uniq).to_not receive(:uniq)
    end
  end

  describe "#two_sum" do

    let(:array) { [-1, 0, 2, -2, 1] }
    let(:empty_array) { [] }
    let(:no_match) { [1, 5, 8, 3, 9] }

    it 'returns an array' do
      expect(array.two_sum).to be_an_instance_of(Array)
    end

    it 'returns an empty array when an empty array is passed' do
      expect(empty_array.two_sum).to eq([])
    end

    it 'returns an empty array when there is no match' do
      expect(no_match.two_sum).to eq([])
    end

    it 'returns an array of idexies' do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'sorts the returned array' do
      expect(array.two_sum).to eq(array.two_sum.sort)
    end

    it 'does not find erroneous pairs' do
      expect([0,1,2,3,4].two_sum).to eq([])
    end

  end

  describe "#my_transpose" do

  let(:large_matrix) { [
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8]
                              ]}

  let(:small_matrix) { [
                      [0, 1],
                      [2, 3]
                            ]}

    it 'does not modify the original array' do
      large_matrix.my_transpose
      expect(large_matrix).to eq([[0, 1, 2],
                                  [3, 4, 5],
                                  [6, 7, 8]])
    end

    it 'does not call built-in #transpose' do
      expect(large_matrix.my_transpose).to_not receive(:transpose)
    end

    it 'transposes a small matrix' do
      expect(small_matrix.my_transpose).to eq([[0, 2], [1, 3]])
    end

    it 'transposes a large matrix' do
      expect(large_matrix.my_transpose).to eq([[0, 3, 6],
                                               [1, 4, 7],
                                               [2, 5, 8]])

    end
  end
end
