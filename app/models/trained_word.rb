class TrainedWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :user

  def update_status!
    case self.status
    when 0
      self.status = 1
    when 1
      self.status = 3
    when 3
      self.status = 7
    when 7
      self.status = 14
    when 14
      self.status = 30
    end
    save!
    WordReminder.perform_in(self.status.to_i.days, self.word.id, self.user.id)
  end
end
