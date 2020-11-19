class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nick_name, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end
  validates :birthday, presence: true

  # <<バリデーション>>
  # with_options presence: true do
  #   validates :nick_name
  #   validates :birthday
  # end
end
