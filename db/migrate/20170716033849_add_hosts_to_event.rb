class AddHostsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :host, foreign_key: true
    remove_reference :events, :user
  end
end
