# frozen_string_literal: true

describe Web::Controllers::Repos::MarkAsAbandoned, type: :action do
  let(:params) { Hash[] }
  let(:mark_as_abandoned) { double() }
  let(:action) { described_class.new(mark_as_abandoned: mark_as_abandoned) }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(login: 'yaya') }

  after { user_repo.clear }

  describe '#call' do
    context 'no repo_id param' do
      it 'returns valid status code' do
        response = action.call(params)
        expect(response).to have_http_status(400)
      end
    end

    context 'with repo_id param' do
      let(:session) { { current_user: user } }
      let(:params)  { { 'rack.session' => session, id: 1 } }

      it 'redirects to user page' do
        expect(mark_as_abandoned).to receive(:call).with(instance_of(User), 1)
        response = action.call(params)
        expect(response).to have_http_status(302)
        expect(response[1]['Location']).to eq "/user/#{user.id}"
      end
    end
  end
end
