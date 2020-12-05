class AddFile < ActiveRecord::Migration[6.0]
  def change
    change_table :job_applications do |t|
      t.binary :file  
    end
  end
end
