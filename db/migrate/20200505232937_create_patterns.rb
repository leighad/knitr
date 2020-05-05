class CreatePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :patterns do |t|
      t.string :pattern_name
      t.integer :gauge
      t.integer :level
      t.text :instructions
      t.string :notes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
