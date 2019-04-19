module Couples
  class Reckoner
    attr_reader :user1, :user2, :user1_name, :user2_name

    def initialize(users)
      @user1 = users[0]
      @user2 = users[1]
    end

    def perform
      total_percentage = total_income_percentage + name_percentage
      [reckon(total_percentage), total_percentage]
    end

    private

    def reckon(total_percentage)
      case total_percentage
      when 0..49
        'You\'re better off with someone else!'
      when 50..59
        'I\'ll give you one year!'
      when 60..69
        'You\'ll need to work a little harder to make it work!'
      when 70..79
        'Don\'t talk about marriage just yet!'
      when 80..89
        'Okay, now you can talk about marriage!'
      when 90..99
        'Enjoy DINKing! Live, laugh and love.'
      else
        'Maybe you should start considering having kids!'
      end
    end

    def total_income_percentage
      total_income
      calculate_income_percentage
    end

    def name_percentage
      split_user_names
      calculate_name_percentage(total_chars, total_uncommon_chars)
    end

    def total_income
      user1.income_cents + user2.income_cents
    end

    def calculate_income_percentage
      case total_income
      when 0..50_000_00
        5
      when 51_000_00..60_000_00
        10
      when 61_000_00..70_000_00
        20
      when 71_000_00..80_000_00
        30
      when 81_000_00..90_000_00
        40
      when 91_000_00..100_000_00
        45
      else
        50
      end
    end

    def split_user_names
      @user1_name = user1.full_name.split('')
      @user2_name = user2.full_name.split('')
    end

    def total_chars
      user1_name.count + user2_name.count
    end

    def total_uncommon_chars
      (user1_name - user2_name).count
    end

    def calculate_name_percentage(total_chars, total_uncommon_chars)
      base = (total_chars - total_uncommon_chars) / Float(total_chars)
      (base * 50).round
    end
  end
end
