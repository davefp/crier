class Component < ActiveRecord::Base

  state_machine :status, :initial => :up do
    store_audit_trail

    # states: up, down, faulty
    event :repaired do
      transition all => :up
    end

    event :crashed do
      transition all => :down
    end

    event :fault do
      transition all => :faulty
    end

  end

end
