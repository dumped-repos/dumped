describe Web::Controllers::Repos::Index, type: :action do
  let(:params) { Hash[] }
  let(:action) { described_class.new }
  let(:repos_list) { action.repos_list }

  subject { action.call(params) }

  describe '#call' do
    context 'no language params' do
      it 'calls repos_list' do
        expect(repos_list).to receive(:call).with(nil).and_call_original
        subject
      end
    end

    context 'with language params' do
      let(:params) { Hash[repos: { language: 'ruby' }] }
      it 'calls repos_list' do
        expect(repos_list).to receive(:call).with('ruby').and_call_original
        subject
      end
    end
  end
end
