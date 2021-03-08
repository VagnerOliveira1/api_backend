require 'rails_helper'

RSpec.describe "Admin::V1::SystemRequirements", type: :request do
  let(:user) {create(:user) }

  context "GET /system_requirements" do
    let(:url) {"/admin/v1/system_requirements"}
    let!(:system_requirements) {create_list(:system_requirement, 5)}

    it "return all System Requirements" do
      get url, headers: auth_header(user)
      p body_json
      expect(body_json['system_requirements']).to contain_exactly *system_requirements.as_json(only: %i(id name))
    end

    it "returns success status" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end

  end

end
