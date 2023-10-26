def my_method(x, &block)
  puts x
  return unless block_given?

  puts block.call
end

name = 'Dylan'
my_proc = proc do |x, &block|
  puts name
  name = 'Whiskey'
  puts x
  return unless block

  puts block.call
end

my_method('hello') { 'bye' }
puts "\n"
my_proc.call('hello') { 'bye' }
puts name

# Refresh on closures 