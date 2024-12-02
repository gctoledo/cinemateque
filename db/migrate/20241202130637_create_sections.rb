class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :week_day
      t.time :time

      t.timestamps
    end
  end
end
