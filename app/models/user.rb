class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_attached_file(
    :avatar,
    styles: { medium: '300x300>', thumb: '160x160>' },
    default_url: '/images/:style/missing.png'
  )

  validates_attachment_content_type :avatar, content_type: %r(\Aimage\/.*\z)

  has_paper_trail
end
