class User < ApplicationRecord
  devise :database_authenticatable, :encryptable, :registerable, :rememberable, :validatable

  has_many :schedulers

  def decoded_password
    Devise::Encryptable::Encryptors::Aes256.decrypt(encrypted_password, Devise.pepper)
  end
end
