class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :ticket_id, null: false
      t.integer :subscriber_id, null: false

      t.timestamps
    end

    add_index :subscriptions, [:ticket_id, :subscriber_id], unique: true
  end
end
