class CreateEvaluateds < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluateds do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.date :birthdate
      t.references :psychologist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
