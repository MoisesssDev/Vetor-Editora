class RemoveForeignKeyFromInstrument < ActiveRecord::Migration[7.1]
  def change
    remove_reference :instruments, :evaluated, foreign_key: true
  end
end
