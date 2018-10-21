class RepoRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def abandoned
    repos.where(abandoned: true)
  end

  def by_language(language)
    repos.where(language: language)
  end

  def abandoned_by_language(language)
    repos.where(abandoned: true, language: language)
  end

  def find(id)
    repos.by_pk(id).one
  end
end
