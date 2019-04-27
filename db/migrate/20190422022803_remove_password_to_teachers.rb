class RemovePasswordToTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :password, :string
  end
end
