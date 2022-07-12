class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :mobile_number,   presence: true, numericality: true, length: { minimum: 10, maximum: 12  }


  belongs_to :role_user, optional: true
  after_create :set_role

  enum role: [:superadmin, :user, :admin]
  #enum role: [:superadmin]
  after_initialize :set_default_role, if: :new_record?
 

  private
  def set_default_role
      self.role ||= :user
  end

  def set_role
       if self.role_user_id.present?
            @message="Done"
        else 
        self.role_user_id = 1
        end
    end
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.name = auth.info.name 
  #   end
  # end


  # def self.from_google(email:, name:, uid:)
  #   return nil unless email =~ /@gmial.com\z/
  #   create_with(uid: uid, name: name).find_or_create_by!(email: email)
  # end
end
