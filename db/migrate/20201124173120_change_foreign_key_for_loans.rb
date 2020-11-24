class ChangeForeignKeyForLoans < ActiveRecord::Migration[6.0]
  def change
    rename_column :loans, :users_id, :user_id
  end
end
