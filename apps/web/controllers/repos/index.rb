module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :repos

    def call(params)
      @repos = repos_list(params[:repos]) || []
    end

    private

    def repos_list(params = {})
      if language = params&.fetch(:language) { nil }
        return repository.all if language == Repo::ALL.downcase
        repository.by_language(language)
      else
        repository.all
      end
    end

    def repository
      @repository ||= RepoRepository.new
    end
  end
end
