# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(name:, url:, target: "_self")
    @name = name
    @url = url
    @target = target
  end

end
