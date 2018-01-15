class RawProcessesController < ApplicationController
  before_action :set_process, only: %i[show edit update destroy status_update]
  before_action :merge_datetime_params, only: %i[create update]

  def new
    @process = RawProcess.create(equipment_id: params[:equipment], start_time: Time.now, finish_time: Time.now)
    redirect_to raw_process_path(@process)
  end

  def create; end

  def show
    @movement = Movement.new
    @malts = Malt.by_equipment(@process.equipment_id)
    if @process.equipment.vat?
      # get source from grain inputs where raw not used
      @sources = GrainInput.at_storage + GrainInput.full_at_storage
    else
      # get source from processes by maltose and eqtype and finished process
      @processes = RawProcess.finished(Equipment.maltoses[@process.equipment.maltose], Equipment.eqtypes[@process.equipment.eqtype] - 1)
      @movements = Movement.where(sourceable_id: @processes.map(&:id))
      @sources = @processes.map { |p| [p.id, p.equipment.name, p.movements.sum(:amount) - @movements.select { |m| m.sourceable_id == p.id }.map { |m| m.amount }.sum ] }.delete_if { |s| s[2].zero? }
    end
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
    redirect_to old_maltose_path
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
