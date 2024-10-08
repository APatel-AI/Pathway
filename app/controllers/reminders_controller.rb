# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[show edit update destroy]

  # GET /reminders or /reminders.json
  def index
    @reminders = current_user.reminders
  end

  # GET /reminders/1 or /reminders/1.json
  def show; end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit; end

  # POST /reminders or /reminders.json
  def create
    @reminder = current_user.reminders.build(reminder_params)

    respond_to do |format|
      if @reminder.save
        UserMailer.with(reminder: @reminder).send_email.deliver_later
        format.html { redirect_to reminders_path, notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1 or /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to reminder_url(@reminder), notice: 'Reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1 or /reminders/1.json
  def destroy
    @reminder.destroy!

    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'Reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reminder
    @reminder = current_user.reminders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to reminders_path, alert: 'Reminder not found.'
  end

  def reminder_params
    params.require(:reminder).permit(:send_at, :message)
  end
end
