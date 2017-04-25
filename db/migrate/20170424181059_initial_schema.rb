class InitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :reintroduces # bill_id
      t.integer :session, null: false # e.g. 2016
      t.string :body, null: false
      t.string :number, null: false # e.g. HB1000
      t.string :state, null: false # enumeration
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end

    create_table :bill_actions do |t|
      t.date :action_date, null: false # date taken
      t.date :scheduled_date # date set, if relevant
      t.integer :becomes_bill # bill_id
      t.integer :bill_id, null: false
      t.string :action, null: false # enumeration

      t.timestamps
    end

    create_table :committees do |t|
      t.string :body, null: false # house, senate, both?
      t.string :name, null: false
      t.string :state, null: false # enumeration

      t.timestamps
    end

    create_table :committee_memberships do |t|
      t.date :end_date
      t.date :start_date, null: false
      t.integer :committee_id, null: false
      t.integer :legislator_id, null: false

      t.timestamps
    end

    create_table :legislators do |t|
      t.string :body, null: false # house, senate
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :state, null: false # enumeration

      t.timestamps
    end
  end
end
