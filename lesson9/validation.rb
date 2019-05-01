module Validation

  class EmptyValue < StandardError; end
  class WrongFormat < StandardError; end
  class WrongType < StandardError; end

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *param)
      @validators ||= {}
      var_name = "@#{name}".to_sym
      @validators["#{var_name}_#{type}"] = { name: var_name, type: type, param: param }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      validators = self.class.instance_variable_get(:@validators) || []
      validators.values.each do |validator|
        value = instance_variable_get(validator[:name])
        send("validate_#{validator[:type]}", value, *validator[:param])
      end
    end

    def validate_presence(value)
      raise Validation::EmptyValue if value.nil? || value == ''
    end

    def validate_type(value, type)
      raise Validation::WrongType unless value.is_a?(type)
    end

    def validate_format(value, format)
      raise Validation::WrongFormat if value !~ format
    end

  end

end
