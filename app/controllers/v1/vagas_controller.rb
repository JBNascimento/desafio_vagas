module V1
    class VagasController < ApplicationController
        # Listar todos os vagas
        def index
            vagas = Vaga.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Lista de vagas carregada', data:vagas},status: :ok
        end
        # Listar uma vaga passando ID
        def show
            vaga = Vaga.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded vaga', data:vaga},status: :ok
        end

        # Listar uma vaga passando ID
        def show
            vaga = Vaga.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded vaga', data:vaga},status: :ok
        end
      

        def ranking
            @vaga = Vaga.find(params[:id])
            @candidaturas = @vaga.candidaturas
            render json: {status: 'SUCCESS', message:'Lista de vagas carregada', data:@candidaturas},status: :ok
        end


        # Criar uma nova vaga
        def create
            vaga = Vaga.new(vaga_params)
            if vaga.save
                render json: {status: 'SUCCESS', message:'Saved vaga', data:vaga},status: :ok
            else
                render json: {status: 'ERROR', message:'Vaga not saved', data:vaga.errors},status: :unprocessable_entity
            end
        end
        # Excluir vaga
        def destroy
            vaga = Vaga.find(params[:id])
            vaga.destroy
            render json: {status: 'SUCCESS', message:'Deleted vaga', data:vaga},status: :ok
        end
        # Atualizar um vaga
        def update
            vaga = Vaga.find(params[:id])
            if vaga.update_attributes(vaga_params)
                render json: {status: 'SUCCESS', message:'Updated vaga', data:vaga},status: :ok
            else
                render json: {status: 'ERROR', message:'Vaga not update', data:vaga.errors},status: :unprocessable_entity
            end
        end
        # Parametros aceitos
        private
        def vaga_params
            params.permit(:empresa, :titulo,:descricao,:localizacao,:nivel)
        end
    end
end