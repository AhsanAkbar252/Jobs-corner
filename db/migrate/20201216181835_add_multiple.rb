class AddMultiple < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :user_email , :string
    add_column :job_applications, :applicant_email,:string
  end
end
