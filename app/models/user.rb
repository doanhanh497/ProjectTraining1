class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates_integrity_of :avatar
  validates_processing_of :avatar
  validate :avatar_size

  enum role: {student: 0, lecture: 1, admin: 2}

  def check_rating? course_id
    ratings.where(course_id: course_id).present?
  end

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  private

  def avatar_size
    if avatar.size > 5.megabytes
      errors.add :avatar, I18n.t("users.avatar_size_error")
    end
  end
end
