def stock_picker(stock_prices)
  raise "Invalid Argument: needs a array" unless stock_prices.is_a?(Array)
  best_days = []
  biggest_diff = 0


  stock_prices.each_index do |day1|
    (day1 + 1...stock_prices.length).each do |day2|
      differece = stock_prices[day2] - stock_prices[day1]

      if biggest_diff < differece
        biggest_diff = differece
        best_days = [day1, day2]
      end
    end
  end

  best_days

end
