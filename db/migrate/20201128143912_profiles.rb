class Profiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :profession
      t.string :qualification
      t.integer :experience
      t.integer :salary
      t.string :address
      t.string :city
      t.string :country
      t.string :personal_info
      t.string :experience_detail
      t.string :interests
      t.string :working_at
      t.string :skills
      t.timestamps
    end
  end
end
