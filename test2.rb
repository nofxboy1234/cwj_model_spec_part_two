def my_method(x, &block)
  puts x
  return unless block_given?

  puts block.call
end

def create_proc
  name = 'Dylan'
  proc do |x, &block|
    puts name
    name = 'Whiskey'
    puts x
    return unless block

    puts block.call
  end
end

my_method('hello') { 'bye' }
puts "\n"
my_proc = create_proc
my_proc.call('hello') { 'bye' }
