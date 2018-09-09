class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.references :user
      t.text :action_type

      t.timestamps
    end
  end
end
