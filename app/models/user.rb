class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  def decoded_password

  end
end
