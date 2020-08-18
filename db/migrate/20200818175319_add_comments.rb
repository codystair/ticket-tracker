class AddComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :creator, foreign_key: {to_table: :users}, null:false
      t.belongs_to :ticket, foreign_key: true, null: false
      t.string :body

      t.timestamps
    end
  end
end
