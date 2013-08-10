class ChangeMessageStatusToReference < ActiveRecord::Migration
  def up
    remove_column :messages, :status
    add_column :messages, :status_id, :integer
  end

  def down
    remove_column :messages, :status
    add_column :messages, :status, :string
  end
end
