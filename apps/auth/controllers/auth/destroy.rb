module Auth::Controllers::Auth
  class Destroy
    include Auth::Action

    def call(_params)
      delete_session
      redirect_to '/'
    end

    private

    def delete_session
      session[:current_user] = nil
    end
  end
end
