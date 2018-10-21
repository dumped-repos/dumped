# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Services::Repos::UpdateAbandoned do
  let(:user_repo) { UserRepository.new }
  let(:repo_repository) { RepoRepository.new }

  let(:user) { user_repo.create(login: 'gustavo') }
  let(:user_2) { user_repo.create(login: 'evil_gustavo') }
  let(:service) { described_class.new }

  after do
    user_repo.clear
    repo_repository.clear
  end

  context 'repo does not exists' do
    let(:repo_id) { 7587  }

    it 'updates abandoned attribute for repository' do
      expect {
        service.call(user, repo_id, true)
      }.to raise_error(described_class::RepoDoesNotExistsError)
    end
  end

  context 'repo belongs to user' do
    let(:repo) { repo_repository.create(repo_attributes(language: 'ruby', user_id: user.id, abandoned: false)) }
    let(:repo_id) { repo.id  }

    it 'updates abandoned attribute for repository' do
      expect(repo.abandoned).to eq false
      service.call(user, repo_id, true)
      updated_repo = repo_repository.find(repo.id)
      expect(updated_repo.abandoned).to eq true
    end
  end

  context 'repo does not belomg to user' do
    let(:repo) { repo_repository.create(repo_attributes(language: 'ruby', user_id: user_2.id)) }
    let(:repo_id) { repo.id }

    it 'raises RepoDoesNotBelongToCurrentUserError' do
      expect {
        service.call(user, repo_id, true)
      }.to raise_error(described_class::RepoDoesNotBelongToCurrentUserError)
    end
  end
end
