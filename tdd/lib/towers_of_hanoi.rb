class TowerOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(from, to)
    raise "Invalid move." unless valid_move?(from, to)
    @towers[to] << @towers[from].pop
  end

  def empty?(pos)
    @towers[pos].empty?
  end

  def valid_move?(from, to)
    return false unless in_range?(from) && in_range?(to)

    return false if empty?(from)
    return true if empty?(to)

    @towers[from].last < @towers[to].last
  end

  def in_range?(pos)
    pos >= 0 && pos <= 2
  end

  def won?
    @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end
end
