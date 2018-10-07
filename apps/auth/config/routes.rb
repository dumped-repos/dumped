# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get  '/:provider/callback', to: 'auth#create'
post '/:provider/callback', to: 'auth#create'
get  '/failure',            to: 'auth#failure'
get  '/logout',             to: 'auth#destroy'
