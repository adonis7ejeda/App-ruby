class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.date :fecha
      t.boolean :estado
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
