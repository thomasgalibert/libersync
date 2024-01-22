require 'test_helper'

class MandatPresenterTest < Keynote::TestCase
  setup do
    @presenter = present(:mandat, :name, :address)
  end

  # test "the truth" do
  #   assert true
  # end
end
