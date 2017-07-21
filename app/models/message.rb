class Message
  include ActiveModel::Model
  attr_accessor :sender_name
  attr_accessor :sender_email
  attr_accessor :body

  validates :body, presence: true
  validates :sender_name, presence: true
  validates :sender_email, presence: true

  def send
    return false unless validate
    ContactMailer.contact_email(self).deliver_now
    true
  end
end
