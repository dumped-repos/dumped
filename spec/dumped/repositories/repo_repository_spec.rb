require_relative '../../spec_helper'

describe RepoRepository do
  let(:repo) { RepoRepository.new }

  after { repo.clear }

  describe '#by_language' do
    before do
      repo.create(repo_attributes(language: 'ruby'))
      repo.create(repo_attributes(language: 'ruby'))
      repo.create(repo_attributes(language: 'javascript'))
    end

    it 'returns repos which have same language as argument' do
      expect(repo.by_language('ruby').count).to eq 2
    end
  end
end
