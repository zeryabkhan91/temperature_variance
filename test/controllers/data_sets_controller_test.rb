require "test_helper"

class DataSetsControllerTest < ActionDispatch::IntegrationTest
  let(:data_set) { data_sets(:one) }
  let(:token) { tokens(:one) }

  describe '#crud' do

    it "should get index" do
      get data_sets_url, headers: { 'Authorization' => token.auth_token }, as: :json
      assert_response :success
    end

    it "should create data_set" do
      assert_difference("DataSet.count") do
        post data_sets_url, params: { data_set: { recorded_at: data_set.recorded_at, temperature: data_set.temperature } },
                                    headers: { 'Authorization' => token.auth_token }, as: :json
      end

      assert_response :created
    end

    it "should show data_set" do
      get data_set_url(data_set), headers: { 'Authorization' => token.auth_token }, as: :json
      assert_response :success
    end

    it "should give error for data_set not present" do
      # Destroy before calling
      data_set.destroy
      get data_set_url(data_set), headers: { 'Authorization' => token.auth_token }, as: :json
      assert_response :not_found
    end

    it "should update data_set" do
      patch data_set_url(data_set), params: { data_set: { recorded_at: data_set.recorded_at, temperature: data_set.temperature } },
                                          headers: { 'Authorization' => token.auth_token }, as: :json
      assert_response :success
    end

    it "should destroy data_set" do
      assert_difference("DataSet.count", -1) do
        delete data_set_url(data_set), headers: { 'Authorization' => token.auth_token }, as: :json
      end

      assert_response :no_content
    end

    it "should give authentication error" do
      get data_set_url(data_set), headers: { 'Authorization' => "my_token" }, as: :json
      assert_response :unauthorized
      assert_equal("You are not Authorized to access this endpoint", response.body)
    end
  end
end
