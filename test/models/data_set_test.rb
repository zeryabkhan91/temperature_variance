require "test_helper"

class DataSetTest < ActiveSupport::TestCase
  describe '#validations' do

    it "should not create a data set; recorded_at not provided" do
      # Error from validation
      error = ["can't be blank"]
      response = nil

      # No recorded_at provided
      assert_no_difference("DataSet.count") do
        response = DataSet.create(temperature: 34.15)
      end
      response.errors.messages
      assert_equal(error, response.errors.messages[:recorded_at])
    end

    it "temperature value less than minimum" do
      # Error from validation
      error = ["must be greater than or equal to -273.15"]
      response = nil

      # temperature is less than minimum requiremeent
      assert_no_difference("DataSet.count") do
        response = DataSet.create(temperature: -274.15, recorded_at: DateTime.now)
      end

      response.errors.messages
      assert_equal(error, response.errors.messages[:temperature])
    end
  end
end
