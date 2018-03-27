Hanami::Model.migration do
  change do
    alter_table :git_repos do
      add_foreign_key :user_id, :users, on_delete: :cascade
      add_index :user_id
    end
  end
end
