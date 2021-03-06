module V1
    class PessoasController < ApplicationController
        # Listar todas as pessoas

        def index
            pessoas = Pessoa.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Lista de pessoas carregada', data:pessoas},status: :ok
        end

        # Listar uma pessoa passando ID

        def show
            pessoa = Pessoa.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded pessoa', data:pessoa},status: :ok
        end

        # Criar uma nova pessoa

        def create
            pessoa = Pessoa.new(pessoa_params)            
             
            if pessoa.save
                render json: {status: 'SUCCESSO', message:'Usuário cadastrado com sucesso!', data:pessoa},status: :ok
            else
                render json: {status: 'ERRO', message:'Usuário não pode ser cadastrado. Tente novamente mais tarde.', data:pessoa.errors},status: :unprocessable_entity
            end
        end

        # Excluir pessoa

        def destroy
            pessoa = Pessoa.find(params[:id])
            pessoa.destroy
            render json: {status: 'SUCCESS', message:'Deleted pessoa', data:pessoa},status: :ok
        end

        # Atualizar uma pessoa

        def update
            pessoa = Pessoa.find(params[:id])
            if pessoa.update_attributes(pessoa_params)
                render json: {status: 'SUCCESS', message:'Updated pessoa', data:pessoa},status: :ok
            else
                render json: {status: 'ERROR', message:'Pessoa not update', data:pessoa.errors},status: :unprocessable_entity
            end
        end



        # Parâmetros aceitos
        private
        def pessoa_params
            params.permit(:nome, :profissao,:localizacao,:nivel,:score)
        end
    end
end