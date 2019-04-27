class CreateInquiryMailers < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_mailers do |t|

      t.timestamps
    end
  end
end
