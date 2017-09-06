class User < ApplicationRecord
  has_many :treasures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :locale, presence: true
  validates :roles_mask, numericality: { greater_than: 0 }

  has_attached_file(
    :avatar,
    styles: { medium: '300x300>', thumb: '160x160>' },
    default_url: '/images/:style/missing.png'
  )

  validates_attachment_content_type :avatar, content_type: %r(\Aimage\/.*\z)

  has_paper_trail

  ROLES = %i[admin user].freeze

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end
end
