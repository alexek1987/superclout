class ChangeStatusFromCampaign < ActiveRecord::Migration[6.0]
  def change
    change_column :campaigns, :status, :string, :default => "Requested"
  end
end
