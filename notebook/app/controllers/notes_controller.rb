class NotesController < ApplicationController
    def index
        @notes = Note.all
        #render :index --> C'est ce qui est fait mais on ne le voit pas
    end

    def new
        @note = Note.new
        #render :new --> C'est ce qui est fait mais on ne le voit pas
    end

    def create #Méthode pour créer
        @note = Note.new(note_params)
        if @note.save
            redirect_to notes_url
        else
            render :new #on réaffiche le formulaire
        end

    end

    def edit #Méthode pour éditer
        @note = Note.find_by(id: params[:id])
        render :new
    end

    def update #Méthode pour mettre à jour
        @note = Note.find_by(id: params[:id])
        if @note.update(note_params)
            redirect_to notes_url
        else
            render :new #on réaffiche le formulaire
        end
    end

    def destroy #Méthode pour supprimer
        note = Note.find_by(id: params[:id])
        note.destroy
        redirect_to notes_url
    end

    def show
        @note = Note.find_by(id: params[:id])
    end

    private
        def note_params
            params.require(:note).permit(:title, :content)
        end
end