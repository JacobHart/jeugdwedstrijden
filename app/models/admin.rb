class Admin < ActiveRecord::Base
 attr_accessible :name, :password, :password_confirmation
  # validates :name, :uniqueness => { :case_sensitive => false}, presence: true

  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :name, uniqueness: true
end
