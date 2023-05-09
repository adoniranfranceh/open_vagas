class AddColumnSlugToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :slug, :string
  end
end
