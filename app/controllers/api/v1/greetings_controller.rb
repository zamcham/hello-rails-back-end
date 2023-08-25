class Api::V1::GreetingsController < ApplicationController
  before_action :set_api_v1_greeting, only: %i[show update destroy]

  # GET /api/v1/greetings
  def index
    random_greeting = Greeting.order('RANDOM()').first
    render json: random_greeting
  end

  # GET /api/v1/greetings/1
  def show
    render json: @api_v1_greeting
  end

  # POST /api/v1/greetings
  def create
    @api_v1_greeting = Api::V1::Greeting.new(api_v1_greeting_params)

    if @api_v1_greeting.save
      render json: @api_v1_greeting, status: :created, location: @api_v1_greeting
    else
      render json: @api_v1_greeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/greetings/1
  def update
    if @api_v1_greeting.update(api_v1_greeting_params)
      render json: @api_v1_greeting
    else
      render json: @api_v1_greeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/greetings/1
  def destroy
    @api_v1_greeting.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_greeting
    @api_v1_greeting = Api::V1::Greeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_greeting_params
    params.require(:api_v1_greeting).permit(:text, :string)
  end
end
