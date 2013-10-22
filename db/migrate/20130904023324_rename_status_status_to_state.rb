class RenameStatusStatusToState < ActiveRecord::Migration
  def up
    rename_column :statuses, :status, :state
  end

  def down
    rename_column :statuses, :state, :status
  end
end
