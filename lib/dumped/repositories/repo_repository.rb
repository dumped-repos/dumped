class RepoRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def by_language(language)

  def find(id)
    repos.by_pk(id).one
  end
end
