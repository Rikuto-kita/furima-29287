class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
t.string:name,null: false
t.text:memo,null: false
t.integer:category_id,null: false
t.integer:item_status_id,null: false
t.integer:ship_method_id,null: false
t.integer:ship_city_id,null: false
t.integer:ship_date_id,null: false
t.integer:cprice,null: false
      t.timestamps
    end
  end
end