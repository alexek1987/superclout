class AddColumnsToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
    add_column :campaigns, :amount, :string
  end
end
