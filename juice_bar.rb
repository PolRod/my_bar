def juicer_gimme(my_request, served_at)
  drink_name = nil
  drinks = []
  bill = 0

  begin
    drink_request = my_request.first
    drink_name = drink_request.first
    drink_count = drink_request.last
    balance = 0.0

    if served_at > '14:00'
      if !(served_at < '20:00')
        if served_at <= '22:00'
          if drink_name =~ /juice/i
            drinks += ['Cleansing Shot'] * drink_count
          end
        end
      else
        unless served_at > '16:00' || /mango/i !~ drink_name
          balance -= 3.5
        end
      end
    end
    if drink_name =~ /mango/i
      balance += 7.0
    elsif !(drink_name =~ /juice/i)
      balance += 3.0
    else
      balance += 5.0
    end
    drinks += [drink_name] * drink_count
    my_request.delete(drink_name)
    bill += balance * drink_count
  end while my_request.any?

  [drinks.sort, bill]
end
