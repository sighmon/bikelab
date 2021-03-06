class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  # GET /readings
  # GET /readings.json
  def index
    @readings = Reading.all.sort_by(&:timestamp).last(200)#.last(600)

    # Just showing the readings every 2.5 minutes for the MQ-7 Carbon Monoxide sensor
    # last_reading = nil
    # this_reading = nil
    # real_readings = []
    # @readings.each do |r|
    #   this_reading = r
    #   if not last_reading.nil?
    #     if last_reading.heater_on and not this_reading.heater_on
    #       real_readings << last_reading
    #     end
    #   end
    #   last_reading = this_reading
    # end
    # @readings = real_readings
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  # POST /readings.json
  def create
    # byebug
    @reading = Reading.new(reading_params)

    respond_to do |format|
      if @reading.save
        # byebug
        DataChannel.broadcast_to(
          @reading.device,
          label: @reading.timestamp.strftime("%H:%M, %d %B, %Y").to_s,
          readings: [@reading.temperature, @reading.humidity, @reading.particles, @reading.carbon_monoxide, @reading.heater_on ? 1 : 0],
          device_id: @reading.device_id,
          location: [@reading.latitude, @reading.longitude]
        )
        format.html { redirect_to @reading, notice: 'Reading was successfully created.' }
        format.json { render :show, status: :created, location: @reading }
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:temperature, :humidity, :particles, :carbon_monoxide, :heater_on, :device_id, :timestamp, :latitude, :longitude)
    end
end
