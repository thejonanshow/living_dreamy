class AddVotesToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :votes, :integer
  end
end
