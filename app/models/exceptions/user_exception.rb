class UserException < Exception
  def initialize(message)
    @message = message
  end
end
