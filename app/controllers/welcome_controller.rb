class WelcomeController < ApplicationController
    ## localhost:3000 => returns the below json
    def index
        render json: {status: 200, message: "Loan Dashboard API"}
    end
end
