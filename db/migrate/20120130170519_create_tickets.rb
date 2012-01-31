class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :comment, null: false
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
