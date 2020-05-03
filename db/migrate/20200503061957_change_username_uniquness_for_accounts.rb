class ChangeUsernameUniqunessForAccounts < ActiveRecord::Migration[6.0]
  def change
    add_index :accounts, :username, unique: true
    change_column_null :accounts, :username, to: false
  end
end
