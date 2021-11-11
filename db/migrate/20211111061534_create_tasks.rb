class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.datetime 'day'
      t.string 'shift'
      t.integer 'ot'
      t.datetime 'startTime'
      t.datetime 'endTime'

      t.references 'account'
      t.references 'department'
      t.timestamps
    end
  end
end
