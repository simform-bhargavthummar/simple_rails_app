class UserLayout < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [ :merchant, :admin ]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :merchant
  end


end
