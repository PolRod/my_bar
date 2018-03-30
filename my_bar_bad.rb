class Bartender
  attr_reader :total_cost, :total_drinks

  RULES = {
    half_price: 14:00..16:00,
    free_tequila: 20:00..22:00
  }

  PRICES = {
    beer: 5.0,
    tequila: 3.0
  }

  def make_drink(drink_request, time)
    current_rule = RULES.fetch(time, NO_RULE)
    case current_rule
    when :free_tequila
      if drink_request == 'beer'
        @total_drinks += %w(beer tequila)
      else
        @total_drinks += [drink_request]
      end
      @total_cost += PRICES[drink_request]
    when :half_price
      @total_drinks += [drink_request]
      if mixed_drink?(drink_request)
        @total_cost += PRICES[drink_request]/2
      else
        @total_cost += PRICES[drink_request]
      end
    end
  end

  def take_order(drinks, time)
    drinks.each do |drink_request|
      make_drink(drink_request, time)
    end
    [@total_drinks, @total_cost]
  end
end

my_items, bill = bartender_gimme
