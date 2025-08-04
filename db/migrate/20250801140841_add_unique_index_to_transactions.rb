class AddUniqueIndexToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_index :transactions, [ :valor, :dataHora ], unique: true
  end
end
