# frozen_string_literal: true

class CustomDataSchema < ApplicationRecord
  validates :data_name, :data_type, :extendable_type, presence: true
end
