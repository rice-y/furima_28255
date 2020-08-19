class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :image         , null: false
      t.string     :name          , null: false
      t.text       :description   , null: false
      t.integer    :price         , null: false
      t.integer    :category      , null: false
      t.integer    :status        , null: false
      t.integer    :delivery_fee  , null: false
      t.integer    :ship_frpm     , null: false
      t.integer    :lead_time     , null: false
      t.references :user          ,foreign_key: true
      t.timestamps
    end
  end
end
