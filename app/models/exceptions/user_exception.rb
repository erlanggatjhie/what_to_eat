class UserException < StandardError
  def initialize(message)
    @message = message
  end
end
