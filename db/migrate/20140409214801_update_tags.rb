class UpdateTags < ActiveRecord::Migration
  def change
    remove_column :tags, :name
    add_column :tags, :user_id, :int
    add_column :tags, :post_id, :int
  end
end
