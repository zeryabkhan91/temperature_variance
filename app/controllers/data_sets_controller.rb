class DataSetsController < ApplicationController
  before_action :authenticate_and_redirect!
  before_action :set_data_set, only: %i[ show update destroy ]

  # GET /data_sets
  def index
    @data_sets = DataSet.all

    render json: @data_sets
  end

  # GET /data_sets/1
  def show
    render json: @data_set
  end

  # POST /data_sets
  def create
    @data_set = DataSet.new(data_set_params)

    if @data_set.save
      render json: @data_set, status: :created, location: @data_set
    else
      render json: @data_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_sets/1
  def update
    if @data_set.update(data_set_params)
      render json: @data_set
    else
      render json: @data_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_sets/1
  def destroy
    @data_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_set
      begin
        @data_set = DataSet.find(params[:id])
      rescue => e
        render json: {error: e.message}, status: 404
      end
    end

    # Only allow a list of trusted parameters through.
    def data_set_params
      params.require(:data_set).permit(:temperature, :recorded_at)
    end
end
