class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index show edit create update destroy]

  # GET /users/:username/notes
  def index
    @notes = @user.notes
  end

  # GET /users/:username/notes/:slug
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/:username/notes/edit
  def edit
  end

  # POST /notes/:username/notes/edit
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  # PUT /notes/:username/notes/:slug
  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notes/:username/notes/:slug
  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
