class CreateMyResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :my_resumes do |t|

      t.timestamps
    end
  end
end
