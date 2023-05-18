class UserMail < ApplicationRecord
  after_create :send_welcome_email  
  after_update :send_update_email 

  validates :name, :email, :image, presence: true
  mount_uploader :image, ImageUploader

  private
    def send_welcome_email
      UserMailer.welcome_mail(self).deliver_now
    end

    def send_update_email
      if self.email_previously_changed?
        UserMailer.update_mail(self).deliver_now
      end
    end

end
