module Couples
  class Reckoner
    attr_reader :users, :incomes, :full_names

    def initialize(users)
      @users = users
      @incomes = users.map(&:income_cents)
      @full_names = users.map(&:full_name)
    end

    def perform
      total_percentage = total_income_percentage + name_percentage
      message = reckon_percentage(total_percentage)
      [total_percentage, message]
    end

    private

    def reckon_percentage(total_percentage)
      Reckon.new(total_percentage).perform
    end

    def total_income_percentage
      IncomePercentage.new(incomes).perform
    end

    def name_percentage
      NamePercentage.new(full_names).perform
    end
  end
end
