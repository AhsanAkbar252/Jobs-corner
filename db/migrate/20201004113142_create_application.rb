class CreateApplication < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :age
      t.string :qualification
      t.string :experience
      t.string :skills
      t.string :personalinfo
      t.integer :applicant_id
      t.integer :job_id
      t.timestamps
    end
  end
end
