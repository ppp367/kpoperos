class AddCachedVotesToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :cached_votes_total, :integer, :default => 0
    add_column :groups, :cached_votes_score, :integer, :default => 0
    add_column :groups, :cached_votes_up, :integer, :default => 0
    add_column :groups, :cached_votes_down, :integer, :default => 0
    add_column :groups, :cached_weighted_score, :integer, :default => 0
    add_column :groups, :cached_weighted_total, :integer, :default => 0
    add_index  :groups, :cached_votes_total
    add_index  :groups, :cached_votes_score
    add_index  :groups, :cached_votes_up
    add_index  :groups, :cached_votes_down
    add_index  :groups, :cached_weighted_score
    add_index  :groups, :cached_weighted_total

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :groups, :cached_votes_total
    remove_column :groups, :cached_votes_score
    remove_column :groups, :cached_votes_up
    remove_column :groups, :cached_votes_down
    remove_column :groups, :cached_weighted_score
    remove_column :groups, :cached_weighted_total
  end
end