require_relative '../../spec_helper'

describe GitRepoRepository do
  let(:repo) { GitRepoRepository.new }

  after { repo.clear }

  describe '#by_language' do
    before do
      repo.create(git_repo_attributes(language: 'ruby'))
      repo.create(git_repo_attributes(language: 'ruby'))
      repo.create(git_repo_attributes(language: 'javascript'))
    end

    it 'returns repos which have same language as argument' do
      expect(repo.by_language('ruby').count).to eq 2
    end
  end
end
