class EnableUnaccentTrgmExtensions < ActiveRecord::Migration[5.2]
  def up
    enable_extension "unaccent"
    execute "create extension pg_trgm;"
  end

  def down
    execute "drop extension pg_trgm;"
    disable_extension "unaccent"
  end
end
