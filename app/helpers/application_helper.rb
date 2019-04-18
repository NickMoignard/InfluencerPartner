module ApplicationHelper
    def flash_class(level)
        case level
            when :notice then "alert alert-info"
            when :success then "alert alert-success"
            when :error then "alert alert-error"
            when :alert then "alert alert-error"
        end
    end

    def creator_from_code(code)
        Creator.find_by(:code => code)
    end

    def current_shop
      @current_shop = Shop.find_by(:shopify_domain => session[:shopify_domain])
    end
end
