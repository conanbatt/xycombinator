class Task < ApplicationRecord
  has_ancestry

  enum task_type: [ :task, :startup, :research ]

  def before_create
    self.progress = 0
  end

  after_save :update_progress!
  after_destroy :update_progress!

  def update_progress!
    if self.children.length > 0
      sum = 0
      children.map {|task| sum += task.progress}
      if(progress != sum/children.size)
        self.progress = sum/children.size
        self.save
      end
    end
    parent.try(:update_progress!)
  end

end
