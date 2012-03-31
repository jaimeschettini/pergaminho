class ChangeDocumentsStatusTypeToBoolean < ActiveRecord::Migration
  def change
    change_column :documents, :status, :boolean
  end

end
