class AddTotalCountToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :total_count, :integer
  end
end
