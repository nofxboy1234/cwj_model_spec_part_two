class User
  def hello
    puts 'hello there!'
  end

  def create_method(name, &block)
    puts "\n"
    p name
    p block

    instance_variable_set("@#{name}", block.call)

    method_definition = proc do |&another_block|
      if another_block
        instance_variable_set("@#{name}", another_block.call)
      else
        instance_variable_get("@#{name}")
      end
    end

    self.class.define_method(name, method_definition)
  end

  def method_missing(method_name, *args, &block)
    puts '#method_missing'

    puts "\n"
    p method_name
    p args
    p block

    create_method(method_name, &block)
  end
end

class FactoryCat
  def self.factory(model_symbol, &block)
    user_class = model_symbol.to_s.camelize.constantize
    user = user_class.new
    user.instance_exec(&block)
    user
  end

  def self.create(model_symbol)
    factory model_symbol do
      first_name { 'John' }
    end
  end
end

puts "\n"
user1 = FactoryCat.create(:user)

puts "\n"
p user1
p user1.first_name
p(user1.first_name { 'Dylan' })
p user1.first_name

puts "\n"
user2 = FactoryCat.create(:user)
p user2
p user2.first_name
p(user2.first_name { 'Whiskey' })
p user2.first_name
