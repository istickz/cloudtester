class Question < ActiveRecord::Base
  belongs_to :test
  acts_as_list scope: :test
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, :reject_if => lambda { |a| a[:content].blank? }, allow_destroy: true
  OPTION_TYPES = %w(known_options user_option)
  end
