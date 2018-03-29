RSpec.describe Workers::Auth::ImportRepos do
  let(:user_repos_import) { double('UserReposImport') }
  let(:login) { 'yoyo' }

  let(:worker) { described_class.new(user_repos_import: user_repos_import) }

  it 'calls user_repos_import' do
    expect(user_repos_import).to receive(:call).with(login)
    worker.perform(login)
  end
end
