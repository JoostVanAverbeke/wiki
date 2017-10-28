class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.string :description
      t.text :text
      t.references :section
      
      t.timestamps
    end
  end
end
