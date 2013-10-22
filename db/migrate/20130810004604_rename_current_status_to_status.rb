class RenameCurrentStatusToStatus < ActiveRecord::Migration
  def up
    rename_table('current_statuses', 'statuses')

    add_column :statuses, :current, :boolean, default: false
  end

  def down
    remove_column :statuses, :current

    rename_table('statuses', 'current_statuses')
  end
end
