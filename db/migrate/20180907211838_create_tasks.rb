class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.string :task_completed
      t.integer :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
