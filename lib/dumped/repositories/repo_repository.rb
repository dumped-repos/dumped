class RepoRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def by_language(language)
    repos.where(language: language).to_a
  end
end
