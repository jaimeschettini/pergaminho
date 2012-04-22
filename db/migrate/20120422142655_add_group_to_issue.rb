class AddGroupToIssue < ActiveRecord::Migration
  class Issue < ActiveRecord::Base
  end

  def change
    add_column :issues, :group_id, :integer, :null => false

    Issue.reset_column_information
    Issue.all.each do |model|
      model.update_attributes!(:group_id => Group.first.id)
    end
  end
end
