class AddStatesToTests < ActiveRecord::Migration
  def change
    add_column :tests, :published, :boolean, default: false
    add_column :tests, :private, :boolean, default: true
  end
end
