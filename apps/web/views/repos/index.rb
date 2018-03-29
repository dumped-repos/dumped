module Web::Views::Repos
  class Index
    include Web::View

    def select_repos_by_language
      form_for :repos, routes.root_path, method: :get do
        select(:language, languages, id: 'git-repo-language-select')
      end
    end

    private

    def languages
      { Repo::ALL => Repo::ALL.downcase }.merge(Repo::LANGUAGES)
    end
  end
end
