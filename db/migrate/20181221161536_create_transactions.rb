class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.decimal :amount, precision: 16, scale: 2
      t.string :currency, default: "USD"
      t.string :message

      t.timestamps
    end
  end
end
