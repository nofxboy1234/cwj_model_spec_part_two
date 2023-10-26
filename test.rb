class User
  def hello
    puts 'hello there!'
  end

  def method_missing(method_name, *_args, &block)
    puts '**** method_missing ****'

    attr_name = method_name.to_s

    self.class.define_method :"#{attr_name}" do
      instance_variable_get("@#{attr_name}")
    end

    return unless block_given?

    instance_variable_set("@#{attr_name}", block.call)

    self.class.define_method :"#{attr_name}=" do |value|
      instance_variable_set("@#{attr_name}", value)
    end
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
p user1
p user1.first_name
user1.first_name = 'Dylan'
p user1.first_name

puts "\n"
user2 = FactoryCat.create(:user)
p user2
p user2.first_name
user2.first_name = 'Whiskey'
p user2.first_name

