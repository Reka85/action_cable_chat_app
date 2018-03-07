class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }

  # returns the list of users @mentionned in message content
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(username: username)
    end.compact # to filter out nil values
  end
end
