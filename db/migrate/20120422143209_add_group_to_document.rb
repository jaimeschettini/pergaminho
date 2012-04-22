class AddGroupToDocument < ActiveRecord::Migration
  class Document < ActiveRecord::Base
  end

  def change
    add_column :documents, :group_id, :integer

    Document.reset_column_information
    Document.all.each do |model|
      model.update_attributes!(:group_id => Group.first.id)
    end
  end
end
