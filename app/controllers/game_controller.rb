class GameController < ApplicationController
    def try

        if params[:name] != ""
            cookies[:name] = params[:name]
        end

        if session[:number] == nil
            session[:number] = rand(1..100)
        end

        if session[:number].to_i > params[:number].to_i
            @result = "Too low"
        elsif session[:number].to_i < params[:number].to_i
            @result = "Too high"
        else
            @result = "Correct!"
            session[:number] = nil
        end

        if session[:number] == nil
            cookies[:counter] = 0
        else
            cookies[:counter] = cookies[:counter].to_i + 1
        end

        render "try.html.erb"
    end

    def reset
        session[:number] = nil
        cookies[:counter] = 0
        cookies[:name] = ""
        render "try.html.erb"
    end
end
