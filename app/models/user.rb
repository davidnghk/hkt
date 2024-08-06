require 'letter_avatar/has_avatar'

class User < ApplicationRecord
  devise :two_factor_authenticatable, :two_factor_backupable, 
    :otp_secret_encryption_key => "8568c184c97f4b84f243af3f2388268f" 

  include LetterAvatar::HasAvatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :lockable, :trackable, :masqueradable

  has_many :members
  has_many :teams, through: :members
  has_one_attached :avatar, dependent: :destroy  

  has_many :tickets
  has_many :tickets, foreign_key: :actor_id

  has_many :assignment_logs
  
  enum role: { "Operator" => 0, "Supervisor" => 1, "SysAdmin" => 2, "Engineer" => 2 }

  # validate :password_complexity
  def username
    name
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def otp_qr_code
    issuer = 'Letsapp'
    label = "#{issuer}:#{email}"
    qrcode = RQRCode::QRCode.new(otp_provisioning_uri(label, issuer: issuer))
    qrcode.as_svg(module_size: 4)
  end
end
