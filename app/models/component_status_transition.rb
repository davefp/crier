class ComponentStatusTransition < ActiveRecord::Base
  belongs_to :component

  after_create :publish

  private

  def publish
    redis = Redis.new
    redis.publish "crier:transitions", self.to_json
  end
end
