# frozen_string_literal: true

module ModelAttributeExtension
  extend ActiveSupport::Concern

  included do
    CustomDataSchema.where(extendable_type: name).each do |field|
      Rails.logger.info "Defining getter #{field.data_name}"

      # define getter for custom field that gets custom field value from joined custom attributes
      define_method(field.data_name) do
        value = custom_attributes.find do |custom_attribute|
          custom_attribute.name == field.data_name
        end

        value&.value
      end

      Rails.logger.info "Defining setter #{field.data_name}="
      # define setter for custom field that sets/creates custom field value in joined custom attributes
      define_method("#{field.data_name}=") do |value|
        attribute = custom_attributes.where(name: field.data_name).first
        if attribute.nil?
          custom_attributes.new name: field.data_name, value: value
        else
          attribute.update(value: value)
        end
      end

      validates field.data_name.to_sym, presence: true
    end

    has_many :custom_attributes, as: :extendable, dependent: :destroy, class_name: 'CustomAttribute'
    accepts_nested_attributes_for :custom_attributes
  end
end
