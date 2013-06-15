class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :company_url
      t.string :job_title
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.text :description
      t.text :instruction
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
