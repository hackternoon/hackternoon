# devise_customization.rb
# http://blog.devinterface.com/2011/05/two-step-signup-with-devise/
module Devise
  module Models
    module Validatable

      def password_required?
        false
      end

    end
  end
end
