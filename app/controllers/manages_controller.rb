class ManagesController < ApplicationController
  before_action :set_manage, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /manages
  def index
    @manages = Manage.where user: @user.id

    render json: @manages
  end

  # GET /manages/1
  def show
    render json: @manage
  end

  # POST /manages
  def create
    @manage = Manage.new(manage_params)
    @manage.user = @user

    if @manage.save
      render json: @manage, status: :created, location: @manage
    else
      render json: @manage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manages/1
  def update
    if @manage.update(manage_params)
      render json: @manage
    else
      render json: @manage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manages/1
  def destroy
    @manage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage
      @manage = Manage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manage_params
      params.require(:manage).permit(:title, :description, :date, :user_id)
    end
end
