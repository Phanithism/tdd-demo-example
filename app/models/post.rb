class Post < ActiveRecord::Base

  STATES = %w(draft published).freeze

  validates :title, :body, :state, presence: true
  validates :state, inclusion: { in: STATES }

  def self.publishes
    where(state: 'published')
  end

  def formarted_title
    title.downcase.titleize
  end

  STATES.each do |state|
    define_method "#{state}?" do
      self.state == state
    end
  end

end
