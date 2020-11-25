class ChangeForeignKeyForDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :details, :books_id, :book_id
    rename_column :details, :loans_id, :loan_id
  end
end
