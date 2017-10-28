class CreateScientificArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :scientific_articles do |t|
      t.string :science

      t.timestamps
    end
  end
end
