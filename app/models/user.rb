class User < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :password_digest

    has_many :favorites, dependent: :destroy
end
