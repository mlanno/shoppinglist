class CreateListCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :list_collaborations do |t|
      t.integer :list_id
      t.integer :collab_with_user_id

      t.timestamps
    end
  end
end
