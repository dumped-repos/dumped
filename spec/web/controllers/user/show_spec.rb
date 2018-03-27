RSpec.describe Web::Controllers::User::Show, type: :action do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }

  after { user_repo.clear }

  context 'with valid id' do
    let(:user) { user_repo.create(login: 'yaya') }

    it 'is suceessful' do
      response = action.call(id: user.id)
      expect(response[0]).to eq 200
    end
  end

  context 'with invalid id' do
    it 'is unsuceessful' do
      response = action.call(id: 89999)
      expect(response[0]).to eq 404
    end
  end
end
