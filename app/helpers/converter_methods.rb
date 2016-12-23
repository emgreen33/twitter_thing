helpers do

  def convert_to_celsius(num)
    celcius = ((num - 32.0) * (5.0/9.0)).round(2)
  end

  def convert_to_farenheit(num)
    farenheit = ((num * 1.8) + 32.0).round(2)
  end

  def find_num(tweet)
    # num = tweet[/\d+/].to_i
    num = tweet[/-?[0-9]\d*(\.\d+)?/].to_i
  end

  def temperature_question(t)
    t.include?("farenheit") || t.include?("celsius") || t.include?("°F") || t.include?("°C")
  end

  def make_tweet(tweet)
    num = find_num(tweet)
    if tweet.include?("farenheit") || tweet.include?("°F")
      new_num = convert_to_celsius(num).to_s + "°C"
    elsif tweet.include?("celsius") || tweet.include?("°C")
      new_num = convert_to_farenheit(num).to_s + "°F"
    elsif tweet.include?("-")
      new_num = "no I can't... "
    end
    tweet = "#{new_num}... obviously"
  end
end
