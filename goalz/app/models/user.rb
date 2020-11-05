class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :username, uniqueness: true
    validates :session_token, uniqueness: true

    attr_reader :password

    after_initialize :ensure_session_token

    # has_many :goals,
    #     foreign_key: :user_id,
    #     class_name: :Goal

    def self.find_by_credentials(username, password)
        # debugger        
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        else 
            nil
        end
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end
end
