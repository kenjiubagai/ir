class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :tdid
      t.string  :time
      t.integer  :code
      t.string  :name
      t.text  :title
      t.text  :doc_url
      t.text  :xbrl_url
      t.string  :place
      t.timestamps null: false
    end
  end
end