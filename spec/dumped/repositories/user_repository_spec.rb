RSpec.describe UserRepository, type: :repository do
  let(:repo) { UserRepository.new }
  let(:repo_repository) { RepoRepository.new }
  let(:id) { 3 }
  let(:login) { 'yaay' }

  after do
    repo.clear
    repo_repository.clear
  end

  before do
    repo.create(id: id, login: login)
  end

  describe '#by_login' do
    it 'returns user' do
      expect(repo.by_login(login)).to be_a User
    end

    context 'when no login is found' do
      it 'returns nil' do
        expect(repo.by_login('fake')).to eq nil
      end
    end
  end

  describe '#find' do
    it 'returns user' do
      expect(repo.find(id)).to be_a User
    end

    context 'when no id is found' do
      it 'returns nil' do
        expect(repo.find(1000)).to eq nil
      end
    end
  end

  describe '#with_repos' do
    before do
      repo_repository.create(repo_attributes(language: 'ruby', user_id: id))
    end
    it 'returns user' do
      user_with_repos = repo.with_repos(id)
      expect(user_with_repos).to be_a User
      expect(user_with_repos.repos).to all(be_a Repo)
    end

    context 'when no id is found' do
      it 'returns nil' do
        expect(repo.with_repos(1000)).to eq nil
      end
    end
  end
end
