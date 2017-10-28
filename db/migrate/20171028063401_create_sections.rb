class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :label
      t.string :description
      t.references :chapter
      t.references :section

      t.timestamps
    end
  end
end
