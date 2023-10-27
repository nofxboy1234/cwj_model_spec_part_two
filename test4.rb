def my_method(x, &)
  my_proc = proc do |x, &block|
    puts x
    
    if block_given?
      puts block.call
    end
  end

  my_proc.call(x, &)
end

my_method('3') { '4' }
my_method('3')
# => 3
# => 4