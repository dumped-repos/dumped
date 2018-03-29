module Web::Controllers::User
  class Show
    include Web::Action

    expose :user

    attr_reader :repository

    def initialize(repository: UserRepository.new)
      @repository = repository
    end

    def call(params)
      @user = repository.find(params[:id])
      halt 404 unless @user
    end
  end
end
