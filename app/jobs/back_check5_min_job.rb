class BackCheck5MinJob < ApplicationJob
  queue_as :default

  def perform(shotgun_id)
    @shotgun = Shotgun.find(shotgun_id)
    if @shotgun.user.nil?
      @shotgun.destroy
    end
  end
end
