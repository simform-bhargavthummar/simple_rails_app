class Faculty < ApplicationRecord

  @@toogle_var = false
  
  validates :first_name, :last_name, :phone_number, :email, :designation, presence: true    #all the fields must have to present
  validates :dob, comparison: { less_than: Date.today }
  validates :phone_number, numericality: { only_integer: true, message: "Only 10 digit will allow" }, length: { is: 10 }
  validates :email, uniqueness: true
  validates :designation, inclusion: { in: ["Prof.", "Ass.Prof."], message: " can't be %{value}." }
  validates :designation, exclusion: { in: ["HOD", "Sr.Prof."], message: "%{value} is not good choice." }

  after_validation :check_date
  after_validation :email_validate, on: :create
  before_create :set_faculty_names      #creating object callback
  after_update :set_message_update    #updating object callback
  before_destroy :set_toggle
  after_destroy :delete_record, if: :delete_record        #destroying object callback
  after_save :save_msg

  after_initialize do
    puts "Faculty's object is initializing..."
  end

  after_find do
    puts "We found the faculty..."
  end

  private

  def save_msg
    puts "Data Saved sucessfully."
  end

  def set_toggle
    @@toogle_var = true
  end

  def check_date
    puts "Faculty's Date checked"
  end

  def set_faculty_names
    self.first_name, self.last_name = first_name.capitalize, last_name.capitalize
  end

  def set_message_update
    puts "Faculty record is updated."
  end

  def delete_record
    puts "#{first_name} is deleted."
  end

  def email_validate
    puts "Email Validated."
  end
end
