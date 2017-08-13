class BillLegislatorRelations < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :citizen_sponsored, :boolean

    create_table :bill_sponsors do |t|
      t.integer :bill_id, null: false
      t.integer :legislator_id, null: false
    end

    create_table :bill_cosponsors do |t|
      t.integer :bill_id, null: false
      t.integer :legislator_id, null: false
    end
  end
end
