class Card
  attr_accessor :face_value, :face_down

  def initialize(face_value, face_down = true)
    @face_value = face_value.to_s
    @face_down = face_down
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def readInfo
    return @face_value unless @face_down
    nil
    #
    # if @face_down
    #   " "
    # else
    #   @face_value
    # end
    #
    # @face_down ? " " : @face_value
  end

  def ==(previousCard)
    # return @face_value == previousCard.face_value
    # false
    @face_value == previousCard.face_value
  end
end
