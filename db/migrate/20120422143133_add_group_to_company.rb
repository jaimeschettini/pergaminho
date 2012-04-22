class AddGroupToCompany < ActiveRecord::Migration
  class Company < ActiveRecord::Base
  end

  def change
    add_column :companies, :group_id, :integer

    Company.reset_column_information
    Company.all.each do |model|
      model.update_attributes!(:group_id => Group.first.id)
    end
  end
end
