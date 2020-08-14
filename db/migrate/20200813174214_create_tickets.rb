class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name, null: false
      t.string :body
      t.string :status, null: false, default: 'New'
      t.integer :project_id

      t.timestamps
    end
  end
end
