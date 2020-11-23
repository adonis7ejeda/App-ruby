class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nombres
      t.string :apellidos
      t.string :direccion
      t.string :telefono
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
