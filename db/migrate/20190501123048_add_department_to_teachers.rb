class AddDepartmentToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :faculty, :string
    add_column :teachers, :department, :string
  end
end
