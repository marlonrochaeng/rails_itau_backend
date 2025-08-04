class RemoveUniqueIndexFromTransaction < ActiveRecord::Migration[8.0]
  def change
    remove_index :transactions, name: "index_transactions_on_valor_and_dataHora"
  end
end
