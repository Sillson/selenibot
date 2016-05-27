class HomeController < ApplicationController
  
  def index
  end

  def run_test
    test_plan = TestPlan.new(params[:browser], params[:timeout], params[:cms], params[:email], params[:password])

    if test_plan.load_cms == true
      flash[:success] = "CMS Loaded as Expected"
    else
      flash[:notice] = "CMS Did Not Load"
    end

    redirect_to root_path
  end
  
end
