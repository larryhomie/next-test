class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  attr_accessor :login

  	def self.find_first_by_auth_conditions(warden_conditions)
  	  conditions = warden_conditions.dup
  	  if login = conditions.delete(:login)
  	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	  else
  	    where(conditions).first
  	  end
  	end


  #Create user without password / Not working yet
  after_create { |admin| admin.send_reset_password_instructions }
 
  def password_required?
    new_record? ? false : super
  end

end
