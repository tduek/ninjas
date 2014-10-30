class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.integer :ninja_id
      t.boolean :is_completed

      t.timestamps
    end
  end
end
