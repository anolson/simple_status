class CreateSystemConfigs < ActiveRecord::Migration
  def change
    create_table :system_configs do |t|
      t.string :name
      t.text :description
      t.string :api_key
      t.timestamps
    end
  end
end
