class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :town, presence: true
  validates :phone_number, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :company_name, presence: true
  validates :company_name_kana, presence: true
  validates :company_postal_code, presence: true
  validates :company_city, presence: true
  validates :company_town, presence: true
  validates :company_phone_number, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code, presence: true
  end
  with_options presence: true, format: { with: /\A\d{11}\z/ } do
    validates :phone_number, presence: true
  end
end
