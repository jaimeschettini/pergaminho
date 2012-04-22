class AddGroupToDepartment < ActiveRecord::Migration
  class Department < ActiveRecord::Base
  end

  def change
    add_column :departments, :group_id, :integer

    Department.reset_column_information
    Department.all.each do |model|
      model.update_attributes!(:group_id => Group.first.id)
    end
  end
end
