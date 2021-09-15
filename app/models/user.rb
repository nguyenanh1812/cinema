class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token, :reset_token

	before_save	:downcase_email
	before_create :create_activation_digest
	#before_save { self.email = email.downcase } # vi trong user.yml da xoa
  	validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
							format: { with: VALID_EMAIL_REGEX }, #email phai co dang kytu@.kytu
							uniqueness: { case_sensitive: false } #Tinh duy nhat cua email khong phan biet chu hoa chu thuong
							

	has_secure_password  # them mat khau bao mat la ham bam
	validates :password, presence: true, length: { minimum: 6 },  allow_nil: true # them dieu kien mat khau toi thieu 6

	class << self
	
		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
														BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end
		
		
		def new_token
			SecureRandom.urlsafe_base64
		end
	end

	# Ghi nhớ một người dùng trong cơ sở dữ liệu để sử dụng trong các phiên(sessions) liên tục.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	# Trả về true nếu mã thông báo đã cho khớp với thông báo.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	# Quên một người dùng.
	def forget
		update_attribute(:remember_digest, nil)
	end

	# Kích hoạt tài khoản
	def activate
		update_attribute(:activated,	true)
		update_attribute(:activated_at, Time.zone.now)
		
	end
	# Gửi email kích hoạt
	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	# Đặt thuộc tính đặt lại mật khẩu.
	def create_reset_digest
		self.reset_token = User.new_token
		update_attribute(:reset_digest, User.digest(reset_token))
		update_attribute(:reset_sent_at, Time.zone.now)
	end

	# Gửi email đặt lại mật khẩu.
	def send_password_reset_email
		ExampleMailer.password_reset(self).deliver
	end

	# Trả về true nếu quá trình đặt lại mật khẩu đã hết hạn.
	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end
	
	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end

	private
	#	Chuyển đổi email thành tất cả các chữ thường
	def downcase_email
		self.email = email.downcase
	end
	
	# Tạo và chỉ định mã thông báo kích hoạt và thông báo.
	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end
end
