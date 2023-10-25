class PhoneNumber < ApplicationRecord
  EXPECTED_NUMBER_OF_DIGITS = 10
  before_validation :strip_non_numeric_from_value

  def strip_non_numeric_from_value
    value = 19
    self.value = self.value.gsub(/\D/, '')
                     .split('')
                     .last(EXPECTED_NUMBER_OF_DIGITS)
                     .join
  end
end
