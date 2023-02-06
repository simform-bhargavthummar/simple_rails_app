class AddTermsAndCondition < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :terms_con, :boolean
  end
end
