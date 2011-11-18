module Billing
  class PlansController < ApplicationController
    respond_to :html, :xml, :js, :json

    def create
      @plan = Plan.create!(params[:billing_plan])
      flash[:notice] = "New plan created!"
      respond_with @plan
    end

    def new
      @plan = Plan.new
      @plan.limit_fields.build
    end

    def edit
      @plan = Plan.find_by_id params[:id]
    end

    def update
      @plan = Plan.find_by_id(params[:id])
      @plan.update_attributes(params[:billing_plan])
      respond_with @plan
    end

    def destroy
      Plan.find_by_id(params[:id]).destroy
      flash[:notice] = "Plan deleted."
      redirect_to billing_plans_path  
    end

    def show
      @plan = Plan.find_by_id(params[:id])
    end

    def index
      @plans = Plan.all
      respond_with @plans
    end
  end
end
