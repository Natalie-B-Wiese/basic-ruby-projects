# Returns a pair of days representing the best day to buy and the best day to sell. Days start at 0.
# You must buy before you can sell
# maximize profit
def stock_picker(prices)

    best_profit= 0
    best_pair = []

    # a multidimensional array
    # profit.length=prices.length
    # profit[n].length = prices.length-n-1
    profit=[]

    prices.each_with_index do |buy_price, buy_price_index|
        profit[buy_price_index] = []

        (prices[(buy_price_index+1)...prices.length]).each_with_index do |sell_price, sell_price_offset_index|            
            day_profit=sell_price-buy_price
            profit[buy_price_index][sell_price_offset_index] = day_profit

            if day_profit>best_profit
                best_profit = day_profit
                best_pair = [buy_price_index, sell_price_offset_index + buy_price_index + 1]
            end
        end
    end

    if best_profit <= 0
        return "It's a bad market don't buy"
    else
        return best_pair
    end

end


# [1,4]  for a profit of $15 - $3 == $12
p stock_picker([17,3,6,9,15,8,6,1,10])