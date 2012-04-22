class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false

      t.timestamps
    end

    Group.new(:name => "Pergamena").save
  end
end
