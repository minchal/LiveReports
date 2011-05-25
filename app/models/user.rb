class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

validates :encrypted_password, :presence => true
validates :email,  :presence => true,
				   :uniqueness => true,
                   :length => { :within => 5..100 },  
                   :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i } 

has_many :entry
has_many :chat_entry
end