require_relative '../../../spec_helper'

describe Web::Controllers::Repos::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repo) { RepoRepository.new }

  after { repo.clear }

  before do
    repo.create(repo_attributes(language: 'javascript'))
    repo.create(repo_attributes(language: 'ruby'))
  end

  describe 'expose' do
    describe '#repos' do
      context 'when db has git repositories' do
        before do
          action.call(params)
        end

        it { expect(action.repos).to be_a Array }
        it { expect(action.repos).to all(be_a Repo) }
      end

      context 'when db has git repositories and language params are present' do
        before do
          action.call({repos: { language: 'ruby' }})
        end

        it { expect(action.repos).to be_a Array }
        it { expect(action.repos).to all(be_a Repo) }
        it { expect(action.repos.first.language).to eq 'ruby' }
      end

      context 'when db has git repositories and language params are present' do
        before do
          action.call({repos: { language: 'all' }})
        end

        it { expect(action.repos).to be_a Array }
        it { expect(action.repos).to all(be_a Repo) }
        it { expect(action.repos.count).to eq 2 }
      end
    end
  end
end
