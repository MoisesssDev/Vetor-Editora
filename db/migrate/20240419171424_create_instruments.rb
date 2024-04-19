class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.text :description
      t.integer :result
      t.string :status
      t.references :evaluated, foreign_key: true

      t.timestamps
    end
  end
end
