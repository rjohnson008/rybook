class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                          :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, 
  						    uniqueness: true,
  						    format: {
  						    	  # Regular expression that makes sure name is formatted correctly.
  						    	  # Allows lower case letters, upper case letters, numbers, under-
  						    	  # scores and dashes.
  						    	  with: /^[a-zA-Z0-9_-]+$/,
  						    	  message: 'Must be formatted correctly.'
                                      }

  # A user can have many statuses
  has_many :statuses

  def full_name
      return first_name + " " + last_name
  end
end
