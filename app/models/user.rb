class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :tests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = [['trainer', 'Тренер'],['student', 'Студент']]
  def trainer?
    role == 'trainer'
  end
  def student?
    role == 'student'
  end
end
