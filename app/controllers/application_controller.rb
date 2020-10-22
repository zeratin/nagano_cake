class ApplicationController < ActionController::Base
# helper_method :current_cart

#   def current_cart
#     if session[:cart_item_id]
#       @cart_item = Cart_item.find(session[:cart_item_id])
#     end
#   end

  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin

    else
      new_admin_session_path
    end
  end

end
