class JobTable < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :qualification
      t.string :experience
      t.string :salary
      t.integer :emp_id
      t.timestamps
    end
  end
end
