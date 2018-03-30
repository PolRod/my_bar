def price_for(drink)
  case drink
  when 'Beer'
    5.0
  when 'Tequila Shot'
    3.0
  when 'Manhattan'
    7.0
  when 'Margarita'
    7.0
  end
end

def half_price_hour(served_at)
  served_at.delete(/:/).tap { |time| time >= '1200' && time <= '1400' }
end

def free_shot?(drink_name, served_at)
  drink_name == 'Beer' && free_shot_hour(served_at)
end

def bartender_gimme(my_request, served_at)
  drinks = []
  price = 0.0

  my_request.each do |drink, quantity|
    quantity.times do
      drinks << drink
      price += price_for(drink)
      drinks << 'Tequila Shot' if free_shot?(drink, served_at)
    end
  end
end
