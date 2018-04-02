module Web::Controllers::Repos
  class Index
    include Web::Action
    include Import[repos_list: 'services.web.repos.list']

    expose :repos

    attr_reader :repos_list

    def call(params)
      language = params[:repos]&.fetch(:language) { nil }
      @repos = repos_list.call(language) || []
    end
  end
end
