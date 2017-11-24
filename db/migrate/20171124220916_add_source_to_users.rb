class AddSourceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :source, :integer, default: 0
  end
end
