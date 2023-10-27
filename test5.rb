class User
  def create_method(method_name, &block)
    method_definition = proc do |*_args, &value_block|
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
p(user1.first_name { 'a' })
p(user1.first_name { 'b' })
p user1.first_name('x', 'y', 'z') { 'c' }
p user1.first_name('x', 'y', 'z')