class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.string :created_by
      t.references :article

      t.timestamps
    end
  end
end
