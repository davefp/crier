class AddMessageToAuditObject < ActiveRecord::Migration
  def change
    change_table :component_status_transitions do |t|
      t.text :message
    end
  end
end
