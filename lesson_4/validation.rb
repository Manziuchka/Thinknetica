# frozen_string_literal: true

require './accessors'

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, validation_type, *params)
      define_method("validate_#{attr_name}_#{validation_type}") do
        send(validation_type.to_sym, instance_variable_get("@#{attr_name}".to_sym), *params)
      end
    end
  end

  module InstanceMethods
    def validate!
      public_methods.each do |method|
        send(method) if method =~ /^validate_/
      end
      true
    end
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  private

  def presence(value)
    raise 'This value cannot be blank' if value.nil? || value == ''

    true
  end

  def format(value, template)
    raise 'Wrong value' unless value =~ template

    true
  end

  def type(value, class_type)
    raise 'Wrong type' unless value.instance_of?(class_type)

    true
  end
end
