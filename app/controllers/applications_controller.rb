class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]

  # GET /applications
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /applications/1
  def show
    @application = Application.find(params[:id])
    render json: @application.to_json(include: :loan)
  end

  # POST /applications
  def create
    puts 'trying to create a new item'
    ## Our UI accepts information for loan when creating the application.
    ## will need to save that information as well, once the new application is saved to the DB without errors.
    # @application = Application.new(application_params)

    puts 'Examine the input parameters'
    puts application_params.inspect
    puts 'Instantiating the new Application record'
    @application = Application.new
    @application.submit_date = Date.current
    puts "date setting completed #{@application.submit_date}"
    @application.status = 'pending'
    puts "status set: #{@application.status}"
    
    @application.borrower_id = params[:application][:borrower_id]
    
    puts 'Instantiation completed'
    
    

    if @application.save
      puts 'DB Save success'
      
      # now it is safe to instantiate and store the new underlying loan information.
      # puts 'Application POST route - creating underlying loan record'
      @loan = Loan.new
      @loan.principal_amount = params[:application][:principal_amount]
      @loan.interest_rate = params[:application][:interest_rate]
      @loan.maturity_date = params[:application][:maturity_date]
      @loan.term = params[:application][:term]
      @loan.application_id = @application.id

      puts 'Application POST route - saving underlying loan record'

      @loan.save
puts 'created the underlying loan'
      ## now update the appsubmits table with the new record
      ## first, were there other applications made on your same date?
      ## if so, increment the existing counter
      ## otherwise, create a new record.

      @appsubmit = Appsubmit.find_by submit_date: Date.current

      if @appsubmit 
        ## we found a record with the current date.  Increment the counter
        @appsubmit.count = @appsubmit.count + 1
        @appsubmit.save
      else
        @appsubmit= Appsubmit.new(submit_date: Date.current, count: 1)
        @appsubmit.save
      end

      puts 'Updated the join table so the graph will get the new data'
      render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  def update
   
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    ## before we kill the application, we need to do some clean up 
    ## since I didn't do a good job with foreign keys and whatnot.
    ## 1.  delete / revise item in the appsubmit table.
    ## 2.  update corresponding records in Borrower table
    ## 3.  delete corresponding loan records.
    ## 4.  Application.destroy.
    @application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. (AKA Strong Parameters)
    ## this indicates a request to post will require :application key in the body of the request.
    ## .require is what enforces this.
    ## .permit => specifies the list of attributes as individual symbols to ensure only those can be passed to Application.create
    ## params.require(:application).permit! => any attributes nested under the :application key to be set on the Application active record.
    def application_params
      params.require(:application).permit(:submit_date, :decision_date, :review_date, :status, :borrower_id, :principal_amount, :interest_rate, :maturity_date, :term)
    end
end

# create_table "loans", force: :cascade do |t|
#   t.decimal "principal_amount"
#   t.decimal "interest_rate"
#   t.date "maturity_date"
#   t.integer "term"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.integer "application_id"


# create_table "applications", force: :cascade do |t|
#   t.date "submit_date"
#   t.date "decision_date"
#   t.date "review_date"
#   t.string "status"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.integer "borrower_id"