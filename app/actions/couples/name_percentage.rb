module Couples
  class NamePercentage
    attr_reader :full_names, :full_name1, :full_name2

    def initialize(full_names)
      @full_names = full_names
    end

    def perform
      split_user_names
      calculate_name_percentage
    end

    private

    def split_user_names
      @full_name1 = full_names[0].split('')
      @full_name2 = full_names[1].split('')
    end

    def total_chars
      full_name1.count + full_name2.count
    end

    def total_uncommon_chars
      (full_name1 - full_name2).count
    end

    def calculate_name_percentage
      base = (total_chars - total_uncommon_chars) / Float(total_chars)
      (base * 50).round
    end
  end
end
