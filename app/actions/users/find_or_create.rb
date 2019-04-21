module Users
  class FindOrCreate
    attr_reader :users_params

    def initialize(users_params)
      @users_params = users_params
    end

    def perform
      users_params.map do |user_params|
        User.find_or_create_by!(user_params)
      end
    end
  end
end
