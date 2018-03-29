module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :repos

    attr_reader :repos_list

    def initialize(repos_list: Services::Repos::List)
      @repos_list = repos_list.new
    end

    def call(params)
      language = params[:repos]&.fetch(:language) { nil }
      @repos = repos_list.call(language) || []
    end
  end
end
