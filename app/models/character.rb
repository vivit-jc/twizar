class Character < ActiveRecord::Base
  belongs_to :user

  def init
    self.job = Digest::MD5.new.update(self.name).to_s.hex%7
    self.physical = JOBS[self.job][:physical]
    self.mental = JOBS[self.job][:mental]
    self.sensuous = JOBS[self.job][:sensuous]
    self.social = JOBS[self.job][:social]
    self.hp = self.physical * 4 + self.mental * 2
    self.save
  end

  def maxhp
    self.physical * 4 + self.mental * 2
  end

  def statusup(st)
    return :noexp if(self.exp < req(st))
    self[st] += 1
    self.exp -= req(st)
    self.save
  end

  def req(st)
    6 - JOBS[self.job][st]
  end

  def job_j
    JOBS[self.job][:job_j]
  end

end