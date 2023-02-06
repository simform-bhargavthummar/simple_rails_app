class RenameDateOfBirth < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      change_table :authors do |t|
        direction.up { t.rename(:dob, :date_of_birth) }
        direction.down { t.rename(:date_of_birth, :dob) }
      end
    end
  end
end
