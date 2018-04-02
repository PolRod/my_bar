def bartender_gimme(my_request, served_at)
  drink_name = nil
  drinks = []
  served_at.delete!(':')
  price = 0.0
  begin
    drink_name = my_request.pop
    if served_at > first_happy_hour_start
      if !(served_at < free_cleansing_shot_start)
        # after start of FTT
        if served_at <= free_cleansing_shot_end
          drinks << 'cleansing_shot'
          price += 3.0
          if my_request.delete('Beet Juice')
            price -= 3.0
          end
        end
      else
        # after start of first but not in FTT
        unless served_at > first_happy_hour_end
          unless drink_name =~ /mango/
            # mango drink
            # prices here
          end
          # during first happy hour
        end
      end
    end
    if drink_name =~ /mango/i
      price += 7.0
    elsif !(drink_name =~ /juice/i)
      price += 3.0
    else
      price += 5.0
    end
    drinks << drink_name
  end while my_request.any?

  [drinks, price]
end

def first_happy_hour_start
  "14:00"
end

def first_happy_hour_end
  "16:00"
end

def free_cleansing_shot_start
  "20:00"
end

def free_cleansing_shot_end
  "22:00"
end

def handle_mango_drinks
  if !(served_at < happy_hour_start || time > happy_hour_end)
    # during happy hour
  end
end

def handle_free_cleansing_shot
end
