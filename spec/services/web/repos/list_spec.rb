describe Services::Web::Repos::List do
  let(:service) { described_class.new }
  let(:language) { nil }
  let(:repo) { RepoRepository.new }

  subject { service.call(language) }

  after { repo.clear }

  before do
    repo.create(repo_attributes(language: 'javascript'))
    repo.create(repo_attributes(language: 'ruby'))
  end

  describe '#call' do
    context 'when there repositories but no language argument' do
      it { expect(subject).to be_a Array }
      it { expect(subject).to all(be_a Repo) }
    end

    context 'when language argument is present' do
      let(:language) { 'ruby' }

      it { expect(subject).to be_a Array }
      it { expect(subject).to all(be_a Repo) }
      it { expect(subject.count).to eq 1 }
      it { expect(subject.first.language).to eq 'ruby' }
    end

    context 'when language argument is all' do
      let(:language) { 'all' }

      it { expect(subject).to be_a Array }
      it { expect(subject).to all(be_a Repo) }
      it { expect(subject.count).to eq 2 }
    end
  end
end
