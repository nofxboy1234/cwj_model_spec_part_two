class User
  def create_method(method_name, &block)
    method_definition = proc do |*args, &value_block|
      puts args
      if value_block
        instance_variable_set("@#{method_name}", value_block.call)
      else
        instance_variable_get("@#{method_name}")
      end
    end

    self.class.define_method(method_name, method_definition)

    send(method_name, &block)
  end

  def method_missing(method_name, *_args, &block)
    create_method(method_name, &block)
  end
end

user1 = User.new
user1.first_name { 'John' }
p user1.first_name
user1.first_name { 'Johnny' }
p user1.first_name
p user1.first_name('a', 'b', 'c') { 'Dylan' }
