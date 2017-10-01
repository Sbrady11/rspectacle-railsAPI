class CreateRubyCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :ruby_codes do |t|
      t.text :content

      t.timestamps
    end
  end
end