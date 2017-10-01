class CreateRspecCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :rspec_codes do |t|
      t.text :content

      t.timestamps
    end
  end
end