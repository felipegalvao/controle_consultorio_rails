module SessionsHelper
    
    # Faz o login do usuário
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Lembra do usuário na sessão
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    # Retorna o usuario logado
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    
    # Retorna se o usuário está logado ou não
    def logged_in?
        !current_user.nil?
    end
    
    # Esquece da sessão
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # Faz o logout do usuário atual
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
end
