RSpec.describe Services::Users::Repos::Import do
  let(:user_repo) { UserRepository.new }
  let(:repo_repository) { RepoRepository.new }
  let(:login) { 'yoyo' }

  let(:service) { described_class.new }

  after do
    user_repo.clear
    repo_repository.clear
  end

  context 'import all the user repos' do
    let(:user) { user_repo.create(login: login) }

    before do
      stub_request(:get, "https://api.github.com/users/#{login}/repos").
         with(  headers: {
       	  'Connection'=>'close',
       	  'Host'=>'api.github.com',
       	  'User-Agent'=>'http.rb/3.0.0'
           }).
         to_return(status: 200, body: http_fixture('github_repos'), headers: {'Content-Type'  => 'application/json; charset=utf-8', 'Link' => ''})
    end

    it 'creates all repos associated with the user' do
      service.call(user.login)
      expect(repo_repository.all.to_a.count).to eq 2
      expect(repo_repository.all.first.user_id).to eq user.id
    end
  end
end
