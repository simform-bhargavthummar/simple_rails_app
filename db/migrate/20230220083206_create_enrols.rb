class CreateEnrols < ActiveRecord::Migration[7.0]
  def change
    create_table :enrols do |t|

      t.timestamps
    end
  end
end
