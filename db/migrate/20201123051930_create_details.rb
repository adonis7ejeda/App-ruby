class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :cantidad
      t.references :books, null: false, foreign_key: true
      t.references :loans, null: false, foreign_key: true

      t.timestamps
    end
  end
end
