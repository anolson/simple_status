class CreateCurrentStatuses < ActiveRecord::Migration
  def change
    create_table :current_statuses do |t|
      t.string :status
      t.timestamps
    end
  end
end