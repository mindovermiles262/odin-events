class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.datetime :starts_at
      
      t.timestamps
    end
  end
end
