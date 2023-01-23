class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :user_type
  enum user_type: { user: 'user', admin: 'admin', superadmin: 'superadmin' }

  after_initialize :init, :if => :new_record?
  def init
    self.user_type ||= 'user'
  end
end
