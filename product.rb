class Product
  # This method is NOT memoized. This method will invoke the
  # expensive operation every single time it's called.
  def price
    expensive_calculation
  end

  # This method IS memoized. It will invoke the expensive
  # operation the first time it's called but never again
  # after that.
  def memoized_price
    @memoized_price ||= expensive_calculation
  end
  
  def expensive_calculation
    sleep(1)
    500
  end
end

require "benchmark"

product = Product.new
puts Benchmark.measure { 10.times { product.price } }
puts Benchmark.measure { 10.times { product.memoized_price } }
