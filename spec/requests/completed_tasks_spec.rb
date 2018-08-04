require 'rails_helper'

RSpec.describe 'CompletedTasks API', type: :request do

  let!(:completed_tasks) { create_list(:completed_task, 10) }
  let(:completed_task_id) { completed_tasks.first.id }

  describe 'GET /completed-tasks' do
    before { get '/completed-tasks' }

    it 'returns completed tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

end