class RemoveUserIdNullConstraintFromAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column_null :albums, :user_id, null: true
  end
end
