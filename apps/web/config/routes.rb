# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'repos#index'
resources :repos, only: [:index, :show, :new] do
  member do
    get 'mark_as_abandoned'
  end
end
get '/user/:id', to: 'user#show', as: :user
