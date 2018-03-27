Hanami::Model.migration do
  change do
    rename_table :git_repos, :repos
  end
end
