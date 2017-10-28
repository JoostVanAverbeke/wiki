class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :subject
      t.string :description
      t.references :author
      t.references :descriptive, :polymorphic => true

      t.timestamps
    end
  end
end
