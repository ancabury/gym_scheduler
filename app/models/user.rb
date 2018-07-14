class User < ApplicationRecord
  devise :database_authenticatable, :encryptable, :registerable, :rememberable, :validatable

  has_many :schedulers

  def schedulers_for_gym_class(id)
    schedulers.find_by(gym_class_id: id)
  end

  def decoded_password
    Devise::Encryptable::Encryptors::Aes256.decrypt(encrypted_password, Devise.pepper)
  end
end
