class User < ActiveRecord::Base
  has_secure_password
  enum role: [:normal, :admin]

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
end

end
