require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions

  validates :email, presence: true,
            uniqueness: true,
            format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                     message: "format is incorrect"}

  validates :username, presence: true,
            uniqueness: true,
            length: {maximum: 40},
            format: {with: /\A\w+\z/,
                     message: "format is incorrect, only latin symbols, digits, and '_' are allowed"}

  validates :password, presence: true, on: :create
  validates_confirmation_of :password

  validates :background_color, format: { with: /\A\#([a-fA-F]|[0-9]){3,6}\z/ }

  before_validation :downcase_username
  before_save :encrypt_password

  def downcase_username
    self.username.downcase! unless username.blank?
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
          OpenSSL::PKCS5.pbkdf2_hmac(
              password, password_salt, ITERATIONS, DIGEST.length, DIGEST
          )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
            password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
    )
    return user if user.password_hash == hashed_password

    nil
  end
end
