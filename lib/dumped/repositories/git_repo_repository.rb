class GitRepoRepository < Hanami::Repository
  def by_language(language)
    git_repos.where(language: language).to_a
  end
end
