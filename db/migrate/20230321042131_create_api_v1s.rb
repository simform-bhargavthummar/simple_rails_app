class CreateApiV1s < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1s do |t|

      t.timestamps
    end
  end
end
