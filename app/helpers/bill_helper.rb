module BillHelper
  def actions
    [ 'Amended', 'Died', 'Passed', 'Recommended Down', 'Recommended Up',
      'Referred', 'Signed', 'Studied' ]
  end

  module_function :actions
end
