class AddBodyToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :body, :string
    add_column :inquiries, :teacher_id, :string
    add_column :inquiries, :user_id, :string
  end
end
