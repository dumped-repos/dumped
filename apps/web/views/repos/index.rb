module Web::Views::Repos
  class Index
    include Web::View

    def select_repos_by_language
      form_for :repos, routes.root_path, method: :get do
        select(:language, languages, id: 'git-repo-language-select')
      end
    end

    private

    def all_type
      { Repo::ALL => Repo::ALL.downcase }
    end

    def languages
      all_type.merge(Repo::LANGUAGES)
    end
  end
end
