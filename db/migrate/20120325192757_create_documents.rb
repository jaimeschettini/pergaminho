class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :company_id
      t.integer :issue_id
      t.integer :department_id
      t.string :description
      t.string :place
      t.string :status

      t.timestamps
    end
  end
end
