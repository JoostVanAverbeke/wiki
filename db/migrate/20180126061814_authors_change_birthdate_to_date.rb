class AuthorsChangeBirthdateToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :authors, :birthdate, :date
  end
end
