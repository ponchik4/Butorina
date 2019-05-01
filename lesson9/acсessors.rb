module Accessors
  attr_accessor_with_history(:name, :speed)
  args == [:name, :speed]
  args.each do |name|
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
  end
  define_method("#{name}=".to_sym) do |value|
    instance_variable_set(var_name, value)
  end
  define_method("#{name}=".to_sym) do |value|
    instance_variable_set(var_name, value)
  end

  def history_setter(name, var_name, history_var)
    define_method("#{name}_history=".to_sym) do |value|
   …
 end
end
  end

  def strong_attr_accessor
  end
end
