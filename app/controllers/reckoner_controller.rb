class ReckonerController < ApplicationController
  def create
    raise StandardError, 'Only double income is allowed!' unless couple_params.count == 2

    users = Users::FindOrCreate.new(couple_params).perform

    percentage, message = Couples::Reckoner.new(users).perform

    render json: { dink_reckoner: "#{percentage}%", message: message },
           status: :ok
  rescue StandardError, ActiveRecord::RecordInvalid => e
    render json: { message: e }, status: :unprocessable_entity
  end

  private

  def couple_params
    params.require(:couple).map do |user_params|
      user_params.permit(
        :full_name,
        :income_cents
      )
    end
  end
end
