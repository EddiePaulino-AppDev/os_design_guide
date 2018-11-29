class AddTabCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :tabs_count, :integer
  end
end
