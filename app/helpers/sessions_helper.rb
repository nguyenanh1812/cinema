module SessionsHelper

    # Đăng nhập người dùng đã cho.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Nhớ người dùng trong một phiên liên tục.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

        # Trả về người dùng đã đăng nhập hiện tại (nếu có).
    def current_user
        #if session[:user_id]
        #   @current_user ||= User.find_by(id: session[:user_id])
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])     # Trả về người dùng tương ứng với cookie nhớ mã thông báo.
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    # Trả về true nếu người dùng đã cho là người dùng hiện tại.
    def current_user?(user)
        user && user == current_user
    end

    # Trả về true nếu người dùng đã đăng nhập, trả về false nếu ngược lại.
    def logged_in?
        !current_user.nil?
    end

    # Tạo ra một phiên liên tục.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # Đăng xuất người dùng hiện tại.
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # Chuyển hướng đến vị trí được lưu trữ (hoặc về vị trí mặc định).
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    # Lưu trữ URL đang cố gắng được truy cập.
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end

    #def log_out
     #   session.delete(:user_id)
     #   @current_user = nil
   # end
end
