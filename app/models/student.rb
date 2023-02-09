class Student < ApplicationRecord
  @@toogle_var = false
  validates :first_name, :last_name, :department, presence: true
  validates :dob, presence: true, comparison: { less_than: Date.today }
  validates :department, inclusion: { in: ["IT", "CE"], message: " can't be %{value}." }
  validates :terms_con, acceptance: { message: "You cannot proceed without accepting Terms of Usage" }

  before_validation :check_date
  before_create :set_student_names                               #creating object callback
  after_update :set_msg_update                                   #updating object callback
  after_destroy :delete_record, if: :delete_record               #destroying object callback
  before_destroy :set_toggle

  after_initialize do
    puts "Initializing object...."
  end

  after_find do
    puts "We find the object..."
  end

  private

  def check_date
    puts "Date Chacked."
  end

  def set_toggle
    @@toogle_var = true
  end

  def delete_record
    puts "#{first_name} is deleted."
  end

  def check_length
    if first_name.length > 2
      return true
    else
      errors.add(:base, "name length should be more then 2 letter.")
      puts "name length should be more then 2 letter."
    end
  end

  def set_student_names
    self.first_name, self.last_name = first_name.capitalize, last_name.capitalize
  end

  def set_msg_update
    puts "Student record is updated."
  end
end
