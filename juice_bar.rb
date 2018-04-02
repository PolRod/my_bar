def juicer_gimme(my_request, served_at)
  drink_name = nil
  drinks = []
  served_at.delete!(':')
  price = 0.0
  begin
    drink_name = my_request.first
    if served_at > '14:00'
      if !(served_at < '20:00')
        if served_at <= '22:00'
          if drink_name =~ /juice/i
            drinks << 'Cleansing Shot'
          end
        end
      else
        unless served_at > '16:00' && drink_name =~ /mango/
          price -= 3.5
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
    drinks << my_request.shift
  end while my_request.any?

  [drinks.sort, price]
end
