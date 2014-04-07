class Test < ActiveRecord::Base
  belongs_to :user
  has_many :questions, -> { order("position ASC") }, dependent: :destroy
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: true) }
  scope :private, -> { where(private: true) }
  scope :public, -> { where(private: false) }
end
