class NotesController < ApplicationController
  expose_decorated :note
  before_action :set_user, only: %i[index show edit update destroy]
  before_action :set_note, only: %i[show edit update destroy]

  # GET /users/:username/notes
  def index
    @notes = @user.notes
  end

  # GET /users/:username/notes/:slug
  def show
  end

  # GET /notes/new
  def new
    self.note = Note.new(user: current_user)
  end

  # GET /notes/:username/notes/edit
  def edit
  end

  # POST /notes
  def create
    result = Notes::Create.call(note_params.merge(user: current_user))
    self.note = result.note

    if result.success?
      redirect_to note, notice: "Note was successfully created."
    else
      render :new
    end
  end

  # PUT /notes/:username/notes/:slug
  def update
    if note.update(note_params)
      redirect_to note, notice: "Note was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /notes/:username/notes/:slug
  def destroy
    note.destroy
    redirect_to notes_url, notice: "Note was successfully destroyed."
  end

  private

  def set_note
    self.note = Note.find_by(user: @user, slug: params[:slug])
  end

  def set_user
    @user = User.find_by(username: params[:user_username])
  end

  def note_params
    params.require(:note).permit(:title, :content, :slug)
  end
end
