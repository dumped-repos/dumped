RSpec.describe Workers::Auth::ImportRepos do
  let(:user_repo) { UserRepository.new }
  let(:repo_repository) { RepoRepository.new }

  let(:worker) { described_class.new }

  after do
    user_repo.clear
    repo_repository.clear
  end

  context 'import all the user repos' do
    let(:user) { user_repo.create(login: 'yoyo') }

    before do
      stub_request(:get, "https://api.github.com/users/yoyo/repos").
         with(  headers: {
       	  'Connection'=>'close',
       	  'Host'=>'api.github.com',
       	  'User-Agent'=>'http.rb/3.0.0'
           }).
         to_return(status: 200, body: http_fixture('github_repos'), headers: {'Content-Type'  => 'application/json; charset=utf-8'})
    end

    it 'creates all repos associated with the user' do
      worker.perform(user.login)
      expect(repo_repository.all.to_a.count).to eq 2
    end
  end
end
