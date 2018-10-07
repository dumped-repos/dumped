Hanami::Model.migration do
  change do
    alter_table :repos do
      add_column :abandoned, TrueClass, default: true, null: false
    end
  end
end
