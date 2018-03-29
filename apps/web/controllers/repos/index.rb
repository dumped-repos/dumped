module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :repos

    attr_reader :repository, :repos_list

    def initialize(repository: RepoRepository.new, repos_list: Services::Repos::List)
      @repository = repository
      @repos_list = repos_list.new(repository: repository)
    end

    def call(params)
      language = params[:repos]&.fetch(:language) { nil }
      @repos = repos_list.call(language) || []
    end
  end
end
