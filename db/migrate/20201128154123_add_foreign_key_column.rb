class AddForeignKeyColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles,:user_id,:integer,foreign_key: true
  end
end
