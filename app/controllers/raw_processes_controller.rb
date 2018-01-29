class RawProcessesController < ApplicationController
  before_action :set_process, only: %i[show edit update destroy status_update]
  before_action :merge_datetime_params, only: %i[create update]

  def new
    head :ok and return if Equipment.find(params[:equipment]).raw_processes.where.not('raw_processes.status = 3').count > 0
    malt = Malt.includes(:malt_settings).first
    @process = RawProcess.create(equipment_id: params[:equipment], malt: malt, start_time: Time.now, finish_time: Time.now + malt.malt_settings.where(equipment: params[:equipment]).first.duration.hours)
    redirect_to raw_process_path(@process) if @process.present?
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
      # processes - all processes, that can be source
      @processes = RawProcess.as_source(Equipment.maltoses[@process.equipment.maltose], Equipment.eqtypes[@process.equipment.eqtype] - 1)
      # movements - where source is one of the @processes
      @movements = @movements = Movement.where(sourceable_type: 'RawProcess', sourceable_id: @processes.map { |p| p.id })
      # get amount in process, subtract amount, that moved to next equipment, remove zero values, collect other to array
      @sources = @processes.map { |p| [p.id, p.equipment.name, p.movements.sum(:amount) - @movements.select { |m| m.sourceable_id == p.id }.map { |m| m.amount }.sum ] }.delete_if { |s| s[2].zero? }
      # check if process can be archived
      @empty = @process.movements.sum(&:amount) == Movement.where(sourceable_type: 'RawProcess', sourceable_id: @process.id).sum(&:amount)
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
