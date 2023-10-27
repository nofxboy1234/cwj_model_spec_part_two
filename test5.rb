class User
  def create_method(method_name, &block)
    puts 'creating method'

    method_definition = proc do |*_args, &value_block|
      puts "\ncalling #{method_name}"

      if value_block
        puts 'with a block'
        instance_variable_set("@#{method_name}", value_block.call)
      else
        puts 'without a block'
        instance_variable_get("@#{method_name}")
      end
    end

    self.class.define_method(method_name, method_definition)
    # send(method_name, &block)
  end

  def method_missing(method_name, *_args, &block)
    create_method(method_name, &block)
  end
end

user1 = User.new
user1.first_name

user1.first_name
user1.first_name { 'a' }
