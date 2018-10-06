module Web::Controllers::User
  class Show
    include Web::Action
    include Import[repository: 'repositories.user']

    expose :user

    def call(params)
      @user = repository.with_repos(params[:id])
      halt 404 unless @user
    end
  end
end
