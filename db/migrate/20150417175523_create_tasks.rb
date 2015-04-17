class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :difficulty, default: 0
      t.integer :project_id

      t.timestamps
    end
  end
end
