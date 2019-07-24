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

     
        # Criar uma nova vaga

        def create
            vaga = Vaga.new(vaga_params)
            if ('A'..'E').include?(vaga.localizacao)
                if vaga.nivel < 6
                    if vaga.save
                        render json: {status: 'SUCCESSO', message:'Vaga adicionada com sucesso!', data:vaga},status: :ok
                    else
                        render json: {status: 'ERRO', message:'A vaga não pode ser salva. tente novamente mais tarde', data:vaga.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERRO', message:'O nível da vaga deve ser um dos seguintes valores: 1,2,3,4 ou 5', data:vaga.errors},status: :unprocessable_entity
                end
            else
                render json: {status: 'ERRO', message:'A localização da vaga deve ser um dos seguintes valores: A,B,C,D ou E', data:vaga.errors},status: :unprocessable_entity
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
        

        # Parâmetros aceitos
        private
        def vaga_params
            params.permit(:empresa, :titulo,:descricao,:localizacao,:nivel)
        end
    end
end