class EnventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET / events
  # GET / events.json
  def index
    @events = Event.all
  end

  # GET / events/1
  # GET / events/1.json
  def show
    @event = Event.new
  end

  # GET / events/new
  def new
    @event = Event.new
  end

  # GET / events/1/edit
  def edit
  end

  # POST / events
  # POST / events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT / events/1
  # PATCH/PUT / events/1.json
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE / events/1
  # DELETE / events/1.json
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(  :title,
                                      :time_start,
                                      :time_end,
                                      :capacity,
                                      :picture,
                                      :description,
                                      :location_title,
                                      :address_number,
                                      :address_street,
                                      :address_postcode,
                                      :address_city,
                                      :address_contry,
                                      :distinguishing_feature,
                                      :wedding_list,
                                      :category,
                                      :keywords,
                                      :price,
                                      :user)
    end
end
