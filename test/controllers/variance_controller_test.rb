require "test_helper"

class VarianceControllerTest < ActionDispatch::IntegrationTest
  let(:data_set) { data_sets(:one) }
  let(:token) { tokens(:one) }

  describe '#get_temperature_variance' do

    it "should get variance" do
      DateTime.stub :now, data_set.recorded_at do
        get variance_url, headers: { 'Authorization' => token.auth_token }, as: :json
        res = JSON.parse(response.body)
        # We have 4 DataSet in database
        assert_equal(4, DataSet.count)

        # But we get variance of 3 as four recorded at is less than the last minute
        assert_equal("Variance of 3 DataSets over the last minute Reference", res["message"])

        # Variance of 3 DataSets
        assert_equal(4897.333333333334, res["variance"])
      end
    end
  end
end
