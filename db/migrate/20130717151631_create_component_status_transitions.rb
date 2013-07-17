class CreateComponentStatusTransitions < ActiveRecord::Migration
  def change
    create_table :component_status_transitions do |t|
      t.references :component, index: true
      t.string :event
      t.string :from
      t.string :to
      t.timestamp :created_at
    end
  end
end
