describe Web::Controllers::Repos::Index, type: :action do
  let(:params) { Hash[] }
  let(:repo) { double('RepoRepository') }
  let(:repos_list) { instance_double('RepoList', call: nil) }
  let(:action) { described_class.new(repository: repo, repos_list: repos_list) }

  subject { action.call(params) }

  describe '#call' do
    context 'no language params' do
      it 'calls repos_list' do
        expect(repos_list).to receive(:new).with(repository: repo).and_return(repos_list)
        expect(repos_list).to receive(:call).with(nil)
        subject
      end
    end

    context 'with language params' do
      let(:params) { Hash[repos: { language: 'ruby' }] }
      it 'calls repos_list' do
        expect(repos_list).to receive(:new).with(repository: repo).and_return(repos_list)
        expect(repos_list).to receive(:call).with('ruby')
        subject
      end
    end
  end
end
