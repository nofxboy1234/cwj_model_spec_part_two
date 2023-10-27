class User
  def method_definition(method_name)
    proc do |*_args, &value_block|
      puts "\ncalling #{method_name}"
  
      if block_given?
        puts 'with a block'
        instance_variable_set("@#{method_name}", value_block.call)
      else
        puts 'without a block'
        instance_variable_get("@#{method_name}")
      end
    end
  end

  def create_method(method_name, &block)
    puts 'creating method'
    if block_given?
      puts 'with a block'
    else
      puts 'without a block'
    end

    self.class.define_method(method_name, method_definition(method_name))
    # send(method_name, &block)
  end

  def method_missing(method_name, *_args, &block)
    # create_method(method_name)
    create_method(method_name, &block)
  end
end

user1 = User.new
user1.first_name # <-------------

user1.first_name

user1.first_name { 'a' }
