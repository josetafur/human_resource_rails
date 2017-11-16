class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.integer :state
      t.string :phone
      t.string :job_position
      t.string :team

      t.timestamps
    end
  end
end
