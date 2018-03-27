RSpec.describe UserRepository, type: :repository do
  let(:repo) { UserRepository.new }
  let(:id) { 3 }
  let(:login) { 'yaay' }

  after { repo.clear }

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
end
