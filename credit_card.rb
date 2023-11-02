require 'date'

class CreditCard
  def initialize(number, expiration_date, brand)
    @number = number
    @expiration_date = expiration_date
    @brand = brand
  end

  def valid?
    month, year = @expiration_date.split('/').map(&:to_i)
    year += 2000
    if DateTime.now.to_date < Date.new(year, month)
      return false
    else
      if @brand == 'American Express'
        @number.gsub(/\s+/, '').length == 15
      else
        @number.gsub(/\s+/, '').length == 16
      end
    end
  end
end