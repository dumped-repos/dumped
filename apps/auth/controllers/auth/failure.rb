module Auth::Controllers::Auth
  class Failure
    include Auth::Action

    def call(_params)
      redirect_to '/'
    end
  end
end
