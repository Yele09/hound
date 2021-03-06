module ErrorMessageTranslation
  ERROR_CODE_AND_MESSAGE = /.*(\d{3})\s\-\s(.*)\s\/\/.*/
  FORBIDDEN_ERROR_CODE = "403"

  def self.from_error_response(error)
    matches = error.message.match(ERROR_CODE_AND_MESSAGE)

    if matches.present? && matches.captures[0] == FORBIDDEN_ERROR_CODE
      matches.captures[1]
    elsif error.message.include? "You must purchase at least one more seat"
      "Please add a GitHub seat to enable Hound. https://help.github.com/articles/adding-seats-to-your-organization"
    end
  end
end
