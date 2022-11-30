class ApplicationController < ActionController::API

  def authenticate_and_redirect!
    token = request.headers["Authorization"]
    if token && Token.verify(token)
      nil
    else
      render json: "You are not Authorized to access this endpoint", status: 401 and return
    end
  end
end
