describe Services::Web::Repos::List do
  let(:repo) { double() }
  let(:service) { described_class.new(repository: repo) }
  let(:language) { nil }

  subject { service.call(language) }

  describe '#call' do
    context 'without language argument' do
      it 'returns all abandoned repos' do
        expect(repo).to receive(:abandoned)
        subject
      end
    end

    context 'when language argument is present' do
      let(:language) { 'ruby' }

      it 'returns all abandoned repos by language' do
        expect(repo).to receive(:abandoned_by_language).with(language)
        subject
      end
    end

    context 'when language argument is all' do
      let(:language) { 'all' }

      it 'returns all abandoned repos' do
        expect(repo).to receive(:abandoned)
        subject
      end
    end
  end
end
