class RenameDescription < ActiveRecord::Migration
  def change
    rename_column :events, :description, :message
  end
end
