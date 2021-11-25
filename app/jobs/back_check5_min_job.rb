class BackCheck5MinJob < ApplicationJob
  queue_as :default

  def perform(shotgun_id)
    @shotgun = Shotgun.find(shotgun_id)
    if @shotgun.user == User.find_by(username: "Guest")
      @shotgun.destroy
    end
  end
end
