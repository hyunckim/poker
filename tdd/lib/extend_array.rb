class Array
  def my_uniq
    uniq_array = []

    each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end
    uniq_array
  end

  def two_sum
    arr = []

    each_index do |i|
      (i + 1...length).each do |j|
        arr << [i, j] if (self[i] + self[j]).zero?
      end
    end

    arr
  end

  def my_transpose
    transposed_array = Array.new(count) {[]}

    i = 0
    while i < count
      j = 0
      while j < count
        transposed_array[i] << self[j][i]
        j += 1
      end
      i += 1
    end
    transposed_array
  end
end
