class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.belongs_to :user
      t.string :link_name
      t.string :description
      t.timestamps
    end
  end
end
