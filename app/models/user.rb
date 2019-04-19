class User < ApplicationRecord
  validates :full_name,
            presence: true
  validates :income_cents,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }
end
