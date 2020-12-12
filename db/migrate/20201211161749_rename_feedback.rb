class RenameFeedback < ActiveRecord::Migration[6.0]
  def change
    rename_table :applications , :feedbacks
  end
end
