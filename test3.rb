def my_method(x, &block)
  puts x

  if block_given?
    puts block.call
  end
end

my_proc = proc do |x, &block|
  puts x

  if block
    puts block.call
  end
end

my_method('1') { '2' }
puts "\n"
my_proc.call('3') { '4' }
puts "\n"
puts "\n"
my_method('5')
puts "\n"
my_proc.call('6')
puts "\n"
puts 'end'
