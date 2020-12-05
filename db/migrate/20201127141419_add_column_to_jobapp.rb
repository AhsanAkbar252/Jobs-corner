class AddColumnToJobapp < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications,:address,:string
    add_column :job_applications,:city,:string
    add_column :job_applications,:country,:string
    add_column :job_applications,:experience_detail,:string
    add_column :job_applications,:qualification_detail,:string
    add_column :job_applications,:previous_company,:string
  end
end
