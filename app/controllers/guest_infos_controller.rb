class GuestInfosController < ApplicationController
  before_action :set_guest_info, only: %i[ show edit update destroy ]

  # GET /guest_infos or /guest_infos.json
  def index
    @guest_infos = GuestInfo.all
  end

  # GET /guest_infos/1 or /guest_infos/1.json
  def show
  end

  # GET /guest_infos/new
  def new
    @guest_info = GuestInfo.new
  end

  # GET /guest_infos/1/edit
  def edit
  end

  # POST /guest_infos or /guest_infos.json
  def create
    @guest_info = GuestInfo.new(guest_info_params)

    respond_to do |format|
      if @guest_info.save
        format.html { redirect_to guest_info_url(@guest_info), notice: "Guest info was successfully created." }
        format.json { render :show, status: :created, location: @guest_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_infos/1 or /guest_infos/1.json
  def update
    respond_to do |format|
      if @guest_info.update(guest_info_params)
        format.html { redirect_to guest_info_url(@guest_info), notice: "Guest info was successfully updated." }
        format.json { render :show, status: :ok, location: @guest_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_infos/1 or /guest_infos/1.json
  def destroy
    @guest_info.destroy

    respond_to do |format|
      format.html { redirect_to guest_infos_url, notice: "Guest info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_info
      @guest_info = GuestInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_info_params
      params.require(:guest_info).permit(:booking_id, :name, :phone_number, :age)
    end
end
