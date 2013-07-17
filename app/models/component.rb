class Component < ActiveRecord::Base

  state_machine :status, :initial => :up do
    # states: up, down, faulty
    event :repair do
      transition all => :up
    end

    event :crash do
      transition all => :down
    end

    event :fault do
      transition all => :faulty
    end

  end

end
