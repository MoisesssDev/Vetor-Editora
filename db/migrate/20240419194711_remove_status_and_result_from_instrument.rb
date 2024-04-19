class RemoveStatusAndResultFromInstrument < ActiveRecord::Migration[7.1]
  def change
    remove_column :instruments, :status, :string
    remove_column :instruments, :result, :integer
  end
end
