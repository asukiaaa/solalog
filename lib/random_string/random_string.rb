module RandomString

  def random_string ( min: 40, max: 50, length: nil )
    random_string = ""
    random_string_length =
      if length.present?
        length
      else
        (min + rand(max-min))
      end

    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    random_string_length.times.map{ random_string += chars.sample }
    random_string
  end

end
