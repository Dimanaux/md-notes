class AddLocaleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :locale, :string, limit: 2, null: false, default: "en"
  end
end
