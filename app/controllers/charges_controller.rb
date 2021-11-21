class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :set_description
  before_action :set_plan
  before_action :authenticate_user!

  def new
  end

  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    if params[:subscription].include? 'yes'
      member = StripeTool.create_membership(email: params[:stripeEmail],
                                   stripe_token: params[:stripeToken],
                                   plan: @plan)
    else
      customer = StripeTool.create_customer(email: params[:stripeEmail],
                                            stripe_token: params[:stripeToken])
      charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description)
    end

    user = User.where(email: member.email)
    @profile = Profile.find_by user_id: user.last.id
    if @profile.statut == "admin" || @profile.statut == "autor"
    else
      @profile.statut = "clientpaid"
      @profile.save
    end

    redirect_to thanks_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def thanks
  end

  private

  def set_description
    @description = "Abonnement S&C"
  end

  def amount_to_be_charged
    @amount = 1500
  end

  def set_plan
    @plan = "plan_Kbz2P4h1tUu84u"
  end

end


