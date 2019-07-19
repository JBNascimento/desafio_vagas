module V1
    class CandidaturasController < ApplicationController
        # Listar todas as candidaturas

        def index
            candidaturas = Candidatura.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Lista de candidaturas carregada', data:candidaturas},status: :ok
        end

        # Listar uma candidatura passando ID

        def show
            candidatura = Candidatura.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded candidatura', data:candidatura},status: :ok
        end

        # Criar uma nova candidatura

        def create
            candidatura = Candidatura.new(candidatura_params)
            if candidatura.save
                pessoa = Pessoa.find(params[:pessoa_id])
               # pessoa.update_attributes(score: score)


                render json: {status: 'SUCCESS', message:'Saved candidatura', data:candidatura},status: :ok
            else
                render json: {status: 'ERROR', message:'Candidatura not saved', data:candidatura.errors},status: :unprocessable_entity
            end
        end

        # Excluir pessoa

        def destroy
            candidatura = Candidatura.find(params[:id])
            candidatura.destroy
            render json: {status: 'SUCCESS', message:'Deleted candidatura', data:candidatura},status: :ok
        end


        # Parametros
        private
        def candidatura_params
            params.permit(:pessoa_id, :vaga_id)
        end
    end
end