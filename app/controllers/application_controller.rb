require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

	get "/" do
		erb :index
	end

	get "/signup" do
		erb :signup
	end

	post "/signup" do
		#your code here!	    user = User.new(username: params[:username], password: params[:password])
	end	    if user.save

      redirect '/login'

    else
	get "/login" do	      redirect '/failure'
		erb :login	    end
	end	  end


	post "/login" do	
		#your code here!	  get "/login" do
	end	    erb :login

  end
	get "/success" do	
		if logged_in?	  post "/login" do
			erb :success	    user = User.find_by(username: params[:username])
		else	    if user && user.authenticate(params[:password])
			redirect "/login"	      session[:user_id] = user.id
		end	      redirect '/success'
	end	    else

      redirect '/failure'
	get "/failure" do	    end
		erb :failure	  end
	end	

  get "/success" do
	get "/logout" do	    if logged_in?
		session.clear	      erb :success
		redirect "/"	    else
	end	      redirect "/login"

    end
	helpers do	  end
		def logged_in?	
			!!session[:user_id]	  get "/failure" do
		end	    erb :failure

  end
		def current_user	
			User.find(session[:user_id])	  get "/logout" do
		end	    session.clear
	end	    redirect "/"

  end
end 	
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
