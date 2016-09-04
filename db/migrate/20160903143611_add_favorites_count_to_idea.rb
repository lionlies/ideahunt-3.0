class AddFavoritesCountToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :favorites_count, :integer, default: 0
  end
end
