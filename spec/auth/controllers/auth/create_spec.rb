RSpec.describe Auth::Controllers::Auth::Create do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }
  let(:params) { Hash['omniauth.auth' => omniauth_auth_params] }
  let(:omniauth_auth_params) do
    {
      'provider' => 'github',
      'uid' => '4672858',
      'info' =>
      {
        'nickname' => 'GustavoCaso',
        'email' => 'gustavocaso@gmail.com',
        'name' => 'Gustavo Caso',
        'image' => 'https://avatars3.githubusercontent.com/u/4672858?v=4',
        'urls' => { 'GitHub' => 'https://github.com/GustavoCaso', 'Blog' => 'http://gustavocaso.github.io/' }
      },
      'credentials' => { 'token' => 'f5022ac95ea9cbba0aa246e08d6eee338ea7a55e', 'expires' => false },
      'extra' => {
        'raw_info' =>
          {
            'login' => 'GustavoCaso',
            'id' => 4_672_858,
            'avatar_url' => 'https://avatars3.githubusercontent.com/u/4672858?v=4',
            'gravatar_id' => '',
            'url' => 'https://api.github.com/users/GustavoCaso',
            'html_url' => 'https://github.com/GustavoCaso',
            'followers_url' => 'https://api.github.com/users/GustavoCaso/followers',
            'following_url' => 'https://api.github.com/users/GustavoCaso/following{/other_user}',
            'gists_url' => 'https://api.github.com/users/GustavoCaso/gists{/gist_id}',
            'starred_url' => 'https://api.github.com/users/GustavoCaso/starred{/owner}{/repo}',
            'subscriptions_url' => 'https://api.github.com/users/GustavoCaso/subscriptions',
            'organizations_url' => 'https://api.github.com/users/GustavoCaso/orgs',
            'repos_url' => 'https://api.github.com/users/GustavoCaso/repos',
            'events_url' => 'https://api.github.com/users/GustavoCaso/events{/privacy}',
            'received_events_url' => 'https://api.github.com/users/GustavoCaso/received_events',
            'type' => 'User',
            'site_admin' => false,
            'name' => 'Gustavo Caso',
            'company' => nil,
            'blog' => 'http://gustavocaso.github.io/',
            'location' => 'Madrid',
            'email' => 'gustavocaso@gmail.com',
            'hireable' => nil,
            'bio' => 'Core team member at @dry-rb.',
            'public_repos' => 81,
            'public_gists' => 10,
            'followers' => 31,
            'following' => 31,
            'created_at' => '2013-06-11T18:21:37Z',
            'updated_at' => '2018-03-14T13:43:45Z'
          },
        'all_emails' => [
          { 'email' => 'gustavocaso@gmail.com', 'primary' => true, 'verified' => true, 'visibility' => 'public' },
          { 'email' => 'gustavo.caso@xing.com', 'primary' => false, 'verified' => true, 'visibility' => nil },
          { 'email' => 'gustavo.caso@profinda.com', 'primary' => false, 'verified' => true, 'visibility' => nil }
        ]
      }
    }
  end

  after { user_repo.clear }

  it { expect(action.call(params)).to redirect_to('/') }

  context 'when user do not exists' do
    it 'creates a new user' do
      expect { action.call(params) }.to change { user_repo.all.count }.by(1)
    end

    it 'saves all user data' do
      action.call(params)
      user = user_repo.all.last

      expect(user.uuid).to eq(omniauth_auth_params['uid'])
      expect(user.login).to eq(omniauth_auth_params['extra']['raw_info']['login'])
      expect(user.avatar_url).to eq(omniauth_auth_params['extra']['raw_info']['avatar_url'])
      expect(user.name).to eq(omniauth_auth_params['info']['name'])
      expect(user.email).to eq(omniauth_auth_params['info']['email'])
      expect(user.bio).to eq(omniauth_auth_params['extra']['raw_info']['bio'])
      expect(user.token).to eq(omniauth_auth_params['credentials']['token'])
    end

    it 'stores user in session' do
      action.call(params)

      expect(action.session[:current_user]).is_a? User
      expect(action.session[:current_user].uuid).to eq(omniauth_auth_params['uid'])
      expect(action.session[:current_user].login).to eq(omniauth_auth_params['extra']['raw_info']['login'])
      expect(action.session[:current_user].avatar_url).to eq(omniauth_auth_params['extra']['raw_info']['avatar_url'])
      expect(action.session[:current_user].name).to eq(omniauth_auth_params['info']['name'])
      expect(action.session[:current_user].email).to eq(omniauth_auth_params['info']['email'])
      expect(action.session[:current_user].bio).to eq(omniauth_auth_params['extra']['raw_info']['bio'])
      expect(action.session[:current_user].token).to eq(omniauth_auth_params['credentials']['token'])
    end
  end

  context 'when user does exists' do
    before do
      user_repo.create(login: 'GustavoCaso')
    end

    it 'do not creates a new user' do
      expect { action.call(params) }.to_not change { user_repo.all.count }
    end

    it 'stores user in session' do
      action.call(params)

      expect(action.session[:current_user]).is_a? User
    end
  end
end
