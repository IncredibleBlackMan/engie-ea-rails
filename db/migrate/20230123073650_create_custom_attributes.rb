# frozen_string_literal: true

class CreateCustomAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_attributes do |t|
      t.integer :extendable_id
      t.string :extendable_type
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
