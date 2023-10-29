require 'json'
require 'sinatra'

class SearchCourses
  def initialize(data)
    @data = data
  end

  def search(filters)
    results = @data

    filters.each do |filter|
      results = results[filter] if results.key?(filter)
    end

    results = filter_results(results)

    results.map { |item| { id: item["id"] } }
  end

  def filter_results(data)
    if data.is_a?(Hash)
      data.flat_map { |_, v| v.is_a?(Hash) ? v.flat_map { |_, objects| objects } : v }
    else
      [data]
    end
  end
end

# JSON de entrada
courses = {
  "espanhol" => {
    "iniciante" => {
      "manha" => [
        {
          "id" => 1
        },
        {
          "id" => 2
        }
      ],
      "noite" => [
        {
          "id" => 3
        },
        {
          "id" => 4
        }
      ]
    },
    "avancado" => {
      "manha" => [
        {
          "id" => 5
        },
        {
          "id" => 6
        }
      ]
    }
  },
  "ingles" => {
    "avancado" => {
      "manha" => [
        {
          "id" => 11
        },
        {
          "id" => 21
        }
      ]
    }
  },
  "frances" => {
    "iniciante" => {
      "manha" => [
        {
          "id" => 31
        },
        {
          "id" => 32
        }
      ]
    },
    "avancado" => {
      "manha" => [
        {
          "id" => 41
        }
      ]
    }
  },
  "alemao" => {
    "iniciante" => {
      "manha" => [
        {
          "id" => 51
        }
      ]
    },
    "avancado" => {
      "manha" => [
        {
          "id" => 61
        },
        {
          "id" => 62
        }
      ]
    }
  },
  "italiano" => {
    "iniciante" => {
      "manha" => [
        {
          "id" => 71
        },
        {
          "id" => 72
        }
      ],
      "noite" => [
        {
          "id" => 73
        }
      ]
    }
  }
}

course_structure = SearchCourses.new(courses)

# Defina uma rota para a API REST para cenário vazio
get '/' do
  results = course_structure.search([])
  content_type :json
  results.to_json
end

# Defina uma rota para a API REST para cenário de pesquisa por curso
get '/:course' do
  filters = [params[:course]]
  results = course_structure.search(filters)
  content_type :json
  results.to_json
end

# Defina uma rota para a API REST para cenário de pesquisa por curso e nível
get '/:course/:level' do
  filters = [params[:course], params[:level]]
  results = course_structure.search(filters)
  content_type :json
  results.to_json
end

# Defina uma rota para a API REST para cenário de pesquisa por curso, nível e turno
get '/:course/:level/:shift' do
  filters = [params[:course], params[:level], params[:shift]]
  results = course_structure.search(filters)
  content_type :json
  results.to_json
end

# Inicie o servidor Sinatra
set :port, 4000
