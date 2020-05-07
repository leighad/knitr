class ChangeGaugeToStringInPatterns < ActiveRecord::Migration[6.0]
  def change
    change_column :patterns, :gauge, :string
  end
end
