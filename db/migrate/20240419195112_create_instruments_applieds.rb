class CreateInstrumentsApplieds < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments_applieds do |t|
      t.integer :result
      t.string :status
      t.references :instrument, null: false, foreign_key: true
      t.references :evaluated, null: false, foreign_key: true

      t.timestamps
    end
  end
end
