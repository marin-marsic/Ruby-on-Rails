class User < ActiveRecord::Base
  attr_accessor :remember_token,:activation_token,:reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,presence:true,length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  validates :email,presence:true,length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :password,presence:true,length:{ minimum: 4 },allow_nil: true
  has_secure_password

  scope :urednici, lambda{where(:uloga => 2).order(:termin_urednika)}
  scope :administratori, lambda{where(:uloga => 1)}
  scope :vlasnik, lambda{where(:uloga => 4).first}

  def self.online_administratori(id)
    User.where("activity > ? and uloga = 1", Time.now - 15.minutes)
  end

  def self.online_korisnici
    User.where("activity > ? and uloga <> 1", Time.now - 15.minutes)
  end

  def self.search_by_name(name)
    User.where('name LIKE ?', "%#{name}%")
  end

  def self.add_editor(id)
    user = User.find(id)
    user.update_attribute(:uloga, 2)
  end

  def self.remove_editor(id)
    user = User.find(id)
    user.update_attribute(:uloga, 3)
  end

  def self.add_admin(id)
    user = User.find(id)
    user.update_attribute(:uloga, 1)
  end

  def self.remove_admin(id)
    user = User.find(id)
    user.update_attribute(:uloga, 3)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  # Remembers a users in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
