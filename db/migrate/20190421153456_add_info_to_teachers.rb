class AddInfoToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :img, :string
    add_column :teachers, :nickname, :string
    add_column :teachers, :gender, :string
    add_column :teachers, :university, :string
    add_column :teachers, :wage, :string
    add_column :teachers, :trafficwage, :string
    add_column :teachers, :time, :string
    add_column :teachers, :prefecture, :string
    add_column :teachers, :region, :string
    add_column :teachers, :profile, :string
    add_column :teachers, :message, :string
  end
end
