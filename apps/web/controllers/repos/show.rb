module Web::Controllers::Repos
  class Show
    include Web::Action
    include Import[repository: 'repositories.repo']

    expose :repo

    def call(params)
      @repo = repository.find(params[:id])
    end
  end
end
