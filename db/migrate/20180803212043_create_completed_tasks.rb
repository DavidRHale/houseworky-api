class CreateCompletedTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :completed_tasks do |t|
      t.string :title
      t.string :created_by
      t.string :room

      t.timestamps
    end
  end
end
