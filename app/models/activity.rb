class Activity < ApplicationRecord
  belongs_to :activity, polymorphic: true
  belongs_to :user
end
