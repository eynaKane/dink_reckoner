module Users
  class FindOrCreate
    attr_reader :couple_params

    def initialize(couple_params)
      @couple_params = couple_params
    end

    def perform
      couple_params.map do |user_params|
        User.find_or_create_by!(user_params)
      end
    end
  end
end
