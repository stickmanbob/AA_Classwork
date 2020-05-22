# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  pw_digest     :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password 

    validates :username, :session_token, presence: true, uniqueness: true
    validates :pw_digest, presence: true

    after_initialize :ensure_session_token


    ## This validation checks pw length on save, nil is allowed so we can pull from db 
    ## without error. Requires @password to be set at same time as pw_digest
    validates :password, length:{minimum: 6}, allow_nil: true

    ####################Associations######################################
    
    has_many :subs, foreign_key: :moderator_id, class_name: :Sub 
    has_many :posts, foreign_key: :author_id, class_name: :Post 
    ####################Auth Methods##################################

    def self.find_by_credentials(username,pass)
        user = User.find_by(username: username)

        if user and user.password=(pass)
            return user 
        else
            return nil
        end

    end

    def password=(pass)
        @password = pass 
        self.pw_digest = BCrypt::Password.create(pass)
    end

    def is_password?(pass)
        BCrypt::Password.new(pw_digest).is_password?(pass)
        #create a new Bcrypt Password instance from the pw digest and call its 
        #own is_password? method to check. 
    end

    def make_session_token
        SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        #must reset session_token and save to db
        self.session_token = make_session_token
        self.save!
        #return session token so we can leverage this to set
        #session[:session_token] at the same time
        self.session_token
    end

    def ensure_session_token
        #to be called upon instantiation
        self.session_token ||= make_session_token
    end

    #######################################################################

end
