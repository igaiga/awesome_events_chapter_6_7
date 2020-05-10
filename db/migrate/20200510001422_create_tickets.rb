class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :user # ((1))
      t.references :event, null: false, foreign_key: true, index: false # ((2))
      t.string :comment
      t.timestamps
    end

    add_index :tickets, %i[event_id user_id], unique: true # ((3))
  end
end
