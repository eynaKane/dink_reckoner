module Couples
  class Reckon
    attr_reader :total_percentage

    def initialize(total_percentage)
      @total_percentage = total_percentage
    end

    def perform
      evaluate(total_percentage)
    end

    private

    def evaluate(total_percentage)
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
        'Enjoy DINKing while you can! Live, laugh and love.'
      else
        'Maybe you should start considering having kids!'
      end
    end
  end
end
