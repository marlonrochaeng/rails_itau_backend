class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.decimal :valor, null: false
      t.datetime :dataHora, null: false

      t.timestamps
    end
  end
end
