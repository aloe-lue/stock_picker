# now this is so expensive there should be way better to approach this problem
def find_max_profit(index_buy, stock_prices)
  stock_values = []

  stock_prices.each_with_index do |value, index|
    # that is the hypothetical buying of stock
    if index_buy >= index
      stock_values.push(0)
    else
      buy_value = value - stock_prices[index_buy]
      stock_values.push(buy_value)
    end
  end

  # find the index of which the max value is stored in
  profit = stock_values 
  {
    indexes: [index_buy, profit.index(profit.max)],
    max_profit: profit.max
  }
end

def stock_picker(stock_prices)
  # put the hash values here
  profits = []

  stock_prices.size.times do |index|
    profits.push(find_max_profit(index, stock_prices))
  end

  # collect all the profits to find the max
  max_profit = profits.collect { |profit| profit[:max_profit] }.max

  # get the max_profit and value, index on 0 to get the indexes of which the max profit is find
  profits.select { |value| value[:max_profit] == max_profit }[0][:indexes]
end

stock_prices = [17,3,6,9,15,8,6,1,10]
p stock_picker(stock_prices)
