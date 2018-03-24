Hanami::Model.migration do
  change do
    create_table :git_repos do
      primary_key :id

      column :repo_id, Integer, null: false
      column :owner_login, String, null: false
      column :owner_avatar_url, String, default: ""
      column :name, String, null: false
      column :full_name, String, null: false
      column :html_url, String, null: false
      column :description, String, default: ""
      column :repo_created_at, DateTime, null: false
      column :homepage, String, default: ""
      column :size, Integer, null: false
      column :stargazers_count, Integer, null: false
      column :watchers_count, Integer, null: false
      column :language, String, null: false
      column :forks_count, Integer, null: false
      column :open_issues_count, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :language
      index :name
    end
  end
end
