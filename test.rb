class User
  def hello
    puts 'hello there!'
  end

  def method_missing(method_name, *_args, &block)
    puts '**** method_missing ****'

    # class << self
    #   attr_name = 'first_name'

    #   define_method :"#{attr_name}" do
    #     instance_variable_get("@#{attr_name}")
    #   end
    # end

    attr_name = method_name.to_s

    self.class.define_method :"#{attr_name}" do
      instance_variable_get("@#{attr_name}")
      # 'Dylan'
    end

    return unless block_given?

    # puts '**** block_given ****'
    # puts block.call

    instance_variable_set("@#{attr_name}", block.call)

    # self.class.define_method :"#{attr_name}=" do |&block|
    #   instance_variable_set("@#{attr_name}", block.call)
    # end
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

# FactoryCat.factory :user do
#   first_name { 'John' }
# end

user = FactoryCat.create(:user)

puts "\n"
p user
p user.first_name
# p user.class
