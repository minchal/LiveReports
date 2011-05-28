class User < ActiveRecord::Base

attr_accessible :email, :password, :password_confirmation
attr_accessor :password
before_save :encrypt_password

validates_confirmation_of :password
validates_presence_of :password, :on => :create

#validates :encrypted_password, :presence => true
validates :email,  :presence => true,
				   :uniqueness => true,
                   :length => { :within => 5..100 },  
                   :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i } 

has_many :entry
has_many :chat_entry


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end