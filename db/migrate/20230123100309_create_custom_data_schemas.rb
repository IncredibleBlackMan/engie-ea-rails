# frozen_string_literal: true

class CreateCustomDataSchemas < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_data_schemas do |t|
      t.string :extendable_type
      t.string :data_name
      t.string :data_type

      t.timestamps
    end
  end
end
