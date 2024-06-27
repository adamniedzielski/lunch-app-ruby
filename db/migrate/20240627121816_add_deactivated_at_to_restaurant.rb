class AddDeactivatedAtToRestaurant < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :deactivated_at, :datetime
  end
end
