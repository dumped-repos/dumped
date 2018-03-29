module Auth::Controllers::Auth
  class Create
    include Auth::Action

    attr_reader :repository, :import_repos_worker

    def initialize(repository: UserRepository.new, import_repos_worker: Workers::Auth::ImportRepos)
      @repository = repository
      @import_repos_worker = import_repos_worker
    end

    def call(params)
      store_session(user)
      import_repos(user.login)
      redirect_to '/'
    end

    private

    def user
      @user ||= repository.by_login(user_params[:login]) || repository.create(user_params)
    end

    def import_repos(login)
      import_repos_worker.perform_async(login)
    end

    def omniauth_params
      @omniauth_params ||= params.env['omniauth.auth']
    end

    def user_params
      @user_params ||= {
        uuid: omniauth_params['uid'],
        login: omniauth_params['extra']['raw_info']['login'],
        avatar_url: omniauth_params['extra']['raw_info']['avatar_url'],
        name: omniauth_params['extra']['raw_info']['name'],
        email: omniauth_params['extra']['raw_info']['email'],
        bio: omniauth_params['extra']['raw_info']['bio'],
        token: omniauth_params['credentials']['token']
      }
    end

    def store_session(user)
      session[:current_user] = user
    end
  end
end
