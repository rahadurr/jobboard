class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|

      t.string :title
      t.text :description
      t.integer :status
      t.references :user
      
      t.timestamps
    end
  end
end
