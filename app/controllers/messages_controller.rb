class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Votre message a été envoyé, merci !'
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = 'Une erreur est survenue, veuillez recommencer ...'
    end
  end

  def destroy
    @message = Message.find(params[:messageid])
    @message.destroy
    redirect_to pages_construction_path
  end

  def effacer_message
    @message = Message.find(params[:messageid])
    @message.destroy
    redirect_to pages_construction_path
  end

  private

  def message_params
    params.require(:message).permit(:nom, :email, :prof)
  end
end
