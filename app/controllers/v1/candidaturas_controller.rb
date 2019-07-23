module V1
    class CandidaturasController < ApplicationController
     
        # Listar todas as candidaturas

        def index
            candidaturas = Candidatura.order('created_at DESC');
            render json: {status: 'SUCCESS!', message:'Lista de candidaturas carregada', data:candidaturas},status: :ok
        end


        # Listar uma candidatura passando ID

        def show
            candidatura = Candidatura.find(params[:id])
            render json: {status: 'SUCCESS!', message:'Loaded candidatura', data:candidatura},status: :ok
        end

        # Listar usuários em um ranking

        def ranking
            #@candidatura = Candidatura.where(:vaga_id => Pessoa.find(params[:vaga_id]))   
            
         
          
            #@candidatos = Pessoa.find(@candidatura.collect(&:pessoa_id))#sort_by{|p| p.score}.reverse 
            
            @response = Candidatura.select(Arel.star).joins(
              Candidatura.arel_table.join(Pessoa.arel_table).on(
              Candidatura.arel_table[:pessoa_id].eq(Pessoa.arel_table[:id])
              ).join_sources
              ).where(:vaga_id => Pessoa.find(params[:vaga_id]))
              .order(:score).reverse_order.pluck(:nome, :profissao, :localizacao, :nivel, :score)
              .map { |nome, profissao, localizacao, nivel, score| {
              nome: nome, profissao: profissao, localizacao: localizacao, nivel: nivel, score: score 
              } }
              
              
              render :json => @response
              
              
        #respond_do do |format|
       # render :json => @response.sort_by{|p| p.score}.reverse, :only =>[:nome, :profissao, :localizacao, :nivel, :score], :only =>[:nome, :profissao, :localizacao, :nivel, :score]  
           #format.json { render :json => @response.sort_by{|p| p.score}.reverse, :except =>[:id, :pessoa_id, :vaga_id, :created_at, :updated_at] }
       # end
            #@saida =  @candidatos.pluck(:nome, :profissao, :localizacao, :nivel, :score)
            

          #  @saida1 = [:nome => "Teste", :profissao => "TesteS"]


           # render :json => @teste, :except =>[:id, :created_at, :updated_at]
        end

        # Criar uma nova candidatura

        def create
           
            
            candidatura = Candidatura.new(candidatura_params)
            if candidatura.save
                pessoa = Pessoa.find(params[:pessoa_id])

        # Adiciona o score em pessoa
              #  pessoa.update_attributes(score: score)
                candidatura.update_attributes(score: score)



                render json: {status: 'SUCCESS!', message:'Saved candidatura', data:candidatura},status: :ok
            else
                render json: {status: 'ERROR!', message:'Candidatura not saved', data:candidatura.errors},status: :unprocessable_entity
            end
        end

        # Excluir pessoa

        def destroy
            candidatura = Candidatura.find(params[:id])
            candidatura.destroy
            render json: {status: 'SUCCESS!', message:'Deleted candidatura', data:candidatura},status: :ok
        end

     
        
        # Algorítmo de Dijkstra para calcular a menor distância entre as localizações
        
        class Graph
                Vertex = Struct.new(:name, :neighbours, :dist, :prev)
               
                def initialize(graph)
                  @vertices = Hash.new{|h,k| h[k]=Vertex.new(k,[],Float::INFINITY)}
                  @edges = {}
                  graph.each do |(v1, v2, dist)|
                    @vertices[v1].neighbours << v2
                    @vertices[v2].neighbours << v1
                    @edges[[v1, v2]] = @edges[[v2, v1]] = dist
                  end
                  @dijkstra_source = nil
                end
               
                def dijkstra(source)
                  return  if @dijkstra_source == source
                  q = @vertices.values
                  q.each do |v|
                    v.dist = Float::INFINITY
                    v.prev = nil
                  end
                  @vertices[source].dist = 0
                  until q.empty?
                    u = q.min_by {|vertex| vertex.dist}
                    break if u.dist == Float::INFINITY
                    q.delete(u)
                    u.neighbours.each do |v|
                      vv = @vertices[v]
                      if q.include?(vv)
                        alt = u.dist + @edges[[u.name, v]]
                        if alt < vv.dist
                          vv.dist = alt
                          vv.prev = u.name
                        end
                      end
                    end
                  end
                  @dijkstra_source = source
                end
               
                def shortest_path(source, target)
                  dijkstra(source)
                  path = []
                  u = target
                  while u
                    path.unshift(u)
                    u = @vertices[u].prev
                  end
                  return path, @vertices[target].dist
                end
               
                def to_s
                  "#<%s vertices=%p edges=%p>" % [self.class.name, @vertices.values, @edges] 
                end
        end
               
               
        # Calculando o score do candidato

        def score
            pessoa = Pessoa.find(params[:pessoa_id])
            vaga = Vaga.find(params[:vaga_id])
                       
        # Distância entre as localizações e aplicando Dijkstra
            g = Graph.new([ [:a, :b, 5],
                            [:b, :c, 7],
                            [:b, :d, 3],
                            [:c, :e, 4],
                            [:d, :e, 10],
                            [:d, :f, 8],                              
                          ])
 
            start = pessoa.localizacao.downcase.intern
            stop = vaga.localizacao.downcase.intern
            path, dist = g.shortest_path(start, stop)
            
            case dist
            when 0..5
                d = 100
            when 6..10
                d = 75
            when 11..15
                d = 50
            when 16..20
                d = 25
            when dist > 20
                d = 0
            end

            n = 100 - 25 * (vaga.nivel - pessoa.nivel)

            pontuacao = (n + d)/2

            return pontuacao
        end



        # Parametros
        private
        def candidatura_params         
           params.tap{ |p| p[:pessoa_id] = p[:id_pessoa] and p[:vaga_id] = p[:id_vaga]}.permit(:id_pessoa, :id_vaga)          
        end
    end
end