module Web::Controllers::User
  class Show
    include Web::Action

    expose :user

    def call(params)
      @user = user_repository.find(params[:id])
      halt 404 unless @user
    end

    private

    def user_repository
      @user_repository ||= UserRepository.new
    end
  end
end
