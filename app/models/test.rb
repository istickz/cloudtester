class Test < ActiveRecord::Base
  has_many :questions, -> { order("position ASC") }, dependent: :destroy
end
