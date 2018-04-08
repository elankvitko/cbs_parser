class CreateIcons < ActiveRecord::Migration[5.1]
  def change
    create_table :icons do |t|
      t.string          :short,  null: false
      t.string          :desc,   null: false
      t.references      :player, null: false, index: true

      t.timestamps
    end
  end
end
