class VarianceController < ApplicationController
  before_action :authenticate_and_redirect!

  def index
    data_sets = DataSet.where("recorded_at >= ?", DateTime.now - 1.minute)
    if data_sets.present?
      @temps = data_sets.pluck(:temperature)
      render json: {message: "Variance of #{data_sets.count} DataSets over the last minute Reference", variance: variance}, status: 200
    else
      render json: {message: "No DataSet present"}
    end
  end

  private
    def mean
      @temps.sum/@temps.length.to_f
    end

    def variance
      sq_sum = @temps.inject(0){|accum, i| accum +(i-mean)**2 }
      sq_sum/(@temps.length - 1).to_f
    end
end
