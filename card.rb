class Card
  attr_reader :face_value, :face_down

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

  def to_s
    @face_down ? "-" : "#{@face_value}"
  end

  def ==(previousCard)
    face_value == previousCard.face_value && previousCard.is_a?(self.class)
  end
end
