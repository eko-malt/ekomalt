class RawProcessesController < ApplicationController
  before_action :set_process, only: %i[show edit update destroy status_update]
  before_action :merge_datetime_params, only: %i[create update]

  def new
    @process = RawProcess.create(equipment_id: params[:equipment])
    redirect_to raw_process_path(@process)
  end

  def create; end

  def show
    @movement = Movement.new
    @inputs = GrainInput.at_storage + GrainInput.full_at_storage
    @malts = Malt.by_equipment(@process.equipment.id)
  end

  def edit; end

  def update
    render :edit unless @process.update(process_params)
  end

  def status_update
    @process.update(status: params[:status])
    redirect_to old_maltose_path
  end

  def destroy
    @process.destroy
  end

  private

  def set_process
    @process = RawProcess.find(params[:id])
  end

  def process_params
    params.require(:raw_process).permit!
  end

  def merge_datetime_params
    params[:raw_process][:start_time] = params[:dates][:start_time] + ' ' + params[:dates][:start_date]
    params[:raw_process][:finish_time] = params[:dates][:finish_time] + ' ' + params[:dates][:finish_date]
  end
end
