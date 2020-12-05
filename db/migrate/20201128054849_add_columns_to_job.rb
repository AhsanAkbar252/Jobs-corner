class AddColumnsToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs,:job_address,:string
    add_column :jobs,:job_city,:string
    add_column :jobs,:job_country,:string
    add_column :jobs,:package_detail,:string
    add_column :jobs,:employer_detail,:string
    add_column :jobs,:job_requirements,:string
    add_column :jobs,:employer_email,:string
    add_column :jobs,:job_type,:string
  end
end
