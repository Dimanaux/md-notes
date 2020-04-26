module Users
  class NotesController < AuthorizedController
    skip_before_action :authenticate_user!, only: %i[index show]
    skip_verify_authorized only: %i[index show]
    skip_before_action :authorize_resource!, only: %i[index show]

    expose_decorated :notes, :filtered_notes
    expose_decorated :note, find_by: :slug, parent: :user
    expose :user, find_by: :username

    helper_method :filter_params

    def index
    end

    def show
      respond_to do |format|
        format.html { respond_with note.author, note }
        format.pdf do
          pdf_note = PdfNoteDecorator.new(HtmlNoteDecorator.new(note))
          send_data(pdf_note.content, filename: pdf_note.filename)
        end
      end
    end

    def new
    end

    def edit
    end

    def create
      Notes::Create.call(note: note, publish: params[:publish])

      respond_with note.author, note
    end

    def update
      Notes::Update.call(
        note: note, note_params: note_params, publish: params[:publish]
      )

      respond_with note.author, note
    end

    def destroy
      note.destroy

      respond_with note.author, note
    end

    private

    def filtered_notes
      FilteredNotesQuery.new(raw_notes, filter_params)
                        .all.recent.page(params[:page])
    end

    def raw_notes
      user == current_user ? user.notes : user.notes.published
    end

    def filter_params
      params.fetch(:search_form, {}).permit(:query).to_h
    end

    def authorize_resource!
      authorize! note
    end

    def note_params
      params.require(:note).permit(:title, :content, :slug)
    end
  end
end
