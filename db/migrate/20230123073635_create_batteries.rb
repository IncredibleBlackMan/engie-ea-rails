# frozen_string_literal: true

class CreateBatteries < ActiveRecord::Migration[6.1]
  def change
    create_table :batteries do |t|
      t.integer :capacity, null: false, default: 0

      t.timestamps
    end
  end
end
