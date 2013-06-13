class AddLastUpdatedToCurrentStatuses < ActiveRecord::Migration
  def change
    add_column :current_statuses, :last_updated, :datetime
  end
end
