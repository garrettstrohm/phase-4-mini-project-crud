class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found_error
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid_error

  def rescue_from_record_invalid_error
    render json: { error: "Spice not found." }, status: :not_found
  end

  def rescue_from_record_invalid_error(invalid)
    render json: { error: invalid.records.errors.full_messages }, status: :unprocessable_entity
  end


end
