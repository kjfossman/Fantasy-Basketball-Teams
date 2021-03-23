class User < ActiveRecord::Base
    has_many :user_teams

    has_secure_password

    validates :username, uniqueness: true
end