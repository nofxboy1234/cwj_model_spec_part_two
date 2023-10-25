class PhoneNumber < ApplicationRecord
  before_validation :strip_non_numeric_from_value

  def strip_non_numeric_from_value
    value = 19
    self.value = self.value.gsub(/\D/, '')
                     .split('')
                     .last(10)
                     .join
  end
end
