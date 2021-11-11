class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string 'name'
      t.string 'username'
      t.string 'password'
      t.string 'role'

      t.references 'department'
      t.references 'factory'

      t.timestamps
    end
  end
end
