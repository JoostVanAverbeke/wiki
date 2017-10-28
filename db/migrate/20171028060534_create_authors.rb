class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :surname
      t.string :firstname
      t.string :birthdate
      t.integer :sex
      t.string :title

      t.timestamps
    end
  end
end
