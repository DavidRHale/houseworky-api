require 'rails_helper'

RSpec.describe 'CompletedTasks API', type: :request do

  let!(:completed_tasks) { create_list(:completed_task, 10) }
  let(:completed_task_id) { completed_tasks.first.id }

  describe 'GET /completed_tasks' do
    before { get '/completed_tasks' }

    it 'returns completed tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'GET /completed_tasks/:id' do
    before { get "/completed_tasks/#{completed_task_id}" }

    context 'when the record exists' do
      it 'returns the completed task' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(completed_task_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:completed_task_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find CompletedTask with 'id'=100/)
      end
    end

    describe 'POST /completed_tasks' do
      let(:valid_attributes) { { title: 'Hoover', room: 'Kitchen', created_by: '1' } }

      context 'when the request is valid' do
        before { post '/completed_tasks', params: valid_attributes }

        it 'creates a completed task' do
          expect(json['title']).to eq('Hoover')
          expect(json['room']).to eq('Kitchen')
          expect(json['created_by']).to eq('1')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'when the request has missing data' do
        before { post '/completed_tasks', params: { title: 'Hoover', created_by: '1' } }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
          expect(response.body).to match(/Validation failed: Room can't be blank/)
        end
      end
    end
  end

  describe 'PUT /completed_tasks/:id' do
    let(:valid_attributes) { { title: 'Mop' } }

    context 'when the record exists' do
      before { put "/completed_tasks/#{completed_task_id}", params: valid_attributes }

      it 'returns empty json body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end