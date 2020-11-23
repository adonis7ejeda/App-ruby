class CreateFines < ActiveRecord::Migration[6.0]
  def change
    create_table :fines do |t|
      t.decimal :valor
      t.date :fecha
      t.boolean :estado
      t.references :Loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
