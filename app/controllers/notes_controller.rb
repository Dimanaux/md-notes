class NotesController < ApplicationController
  expose :note, :note_from_context
  expose :notes, from: :user

  # GET /users/:username/notes
  def index
  end

  # GET /users/:username/notes/:slug
  def show
  end

  # GET /notes/new
  def new
  end

  # GET /notes/:username/notes/edit
  def edit
  end

  # POST /notes
  def create
    note.assign_attributes(note_params.merge(user: current_user))
    Notes::Save.call(note: note)
    respond_with note.user, note
  end

  # PUT /notes/:username/notes/:slug
  def update
    note.assign_attributes(note_params.merge(user: current_user))
    Notes::Save.call(note: note)
    respond_with note.user, note
  end

  # DELETE /notes/:username/notes/:slug
  def destroy
    note.destroy
    redirect_to user_notes_url(current_user), notice: 'Note was successfully destroyed.'
  end

  private

  def note_from_context
    if params.permit(:slug)[:slug] && user
      Note.find_by(user: user, slug: params.permit(:slug)[:slug])
    # elsif note_params[:title] && note_params[:content]
      # Note.new(note_params)
    else
      Note.new
    end
  end

  def user
    @user ||= User.find_by(username: params[:user_username])
  end

  def note_params
    if params[:note]
      params.require(:note).permit(:title, :content, :slug)
    else
      {}
    end
  end
end
