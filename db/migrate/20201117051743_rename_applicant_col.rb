class RenameApplicantCol < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_applications, :applicant_id, :user_id
  end
end
