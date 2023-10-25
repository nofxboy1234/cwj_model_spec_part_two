class PhoneNumber < ApplicationRecord
  before_validation :strip_non_numeric_from_value

  def strip_non_numeric_from_value
    self.value = self.value.gsub(/\D/, '')
  end
end
