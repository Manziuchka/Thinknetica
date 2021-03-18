# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) do
          instance_variable_get(var_name)
        end

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          history = instance_variable_get("@#{name}_history".to_sym) || []
          history << value
          instance_variable_set("@#{name}_history".to_sym, history)
        end

        define_method("#{name}_history".to_sym) do
          instance_variable_get("@#{name}_history") || []
        end
      end
    end

    def strong_attr_accessor(*names, class_example)
      names.each do |name|
        define_method(name) do
          instance_variable_get("@#{name}".to_sym)
        end

        define_method("#{name}=".to_sym) do |value|
          raise TypeError, 'Error. Wrong type' unless value.is_a?(class_example)

          instance_variable_set("@#{name}".to_sym, value)
        end
      end
    end
  end
end
