class Import::Games
  

  def initialize(file, tournament)
    @file = file
    @tournament = tournament
  end

  def self.init(file, tournament)
    processable_file = self.new(file, tournament)
    processable_file.process_file
  end

  def process_file
    csv = CSV.read(@file, headers: true, encoding: "ISO8859-1")
    csv.each do |row|
      
      
      # en base al id del la ronda, buscarla
      # Si encuentro la ronda, la guardo en una variable, de lo contrario creo una ronda y le entrego ese id.
      # Una vez tengo en una variable la ronda/instancia nueva de ronda le asigno los valores 
      # necesario, recuerda el id del torneo se saca desde: @tournament
      # genero la instancia de game y le asigno los valores necesarios para su creación
      # En base al id del player, buscarlo y si no se encuentra se genera pero sin ranking
      # se asignan los valores correspondientes que vienen en el csv
      # una vez creadas las instancias, se guardan los elementos
      # se retorna una respuesta para entregarle al usaurio un feedback

      byebug
    end
  end
end