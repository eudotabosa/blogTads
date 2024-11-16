class AddArchivedToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :archived, :boolean
  end
end
