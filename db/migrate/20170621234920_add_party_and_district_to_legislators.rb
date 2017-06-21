class AddPartyAndDistrictToLegislators < ActiveRecord::Migration[5.0]
  def change
    add_column :legislators, :party, :string
    add_column :legislators, :district, :string
  end
end
