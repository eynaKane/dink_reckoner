module Couples
  class IncomePercentage
    attr_reader :incomes

    def initialize(incomes)
      @incomes = incomes
    end

    def perform
      calculate_income_percentage
    end

    private

    def total_income
      incomes.sum
    end

    def calculate_income_percentage
      case total_income
      when 0
        0
      when 1..50_000_00
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
  end
end
