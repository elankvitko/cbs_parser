class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string            :firstname, null: false
      t.string            :lastname, null: false
      t.string            :fullname, null: false
      t.string            :photo
      t.string            :eligible_for_offense_and_defense
      t.string            :position
      t.string            :icons
      t.integer           :age
      t.string            :elias_id
      t.string            :pro_status
      t.string            :jersey
      t.string            :pro_team
      t.string            :bye_week
      t.string            :bats
      t.string            :throws
      t.references        :sport, null: false, index: true

      t.timestamps
    end
  end
end
