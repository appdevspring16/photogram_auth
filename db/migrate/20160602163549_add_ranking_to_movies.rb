class AddRankingToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :ranking, :integer
  end
end
