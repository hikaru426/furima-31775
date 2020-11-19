class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    with_options presence: true, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/, message: '半角英数字混合で入力してください' } do
    validates :password
    end
    validates :nick_name
    validates :birthday
    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
