class CreateLawArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :law_articles do |t|
      t.string :law

      t.timestamps
    end
  end
end
