class UfRent < ApplicationRecord

  #validates :date, uniqueness: true

  def self.load_ufs
    require 'csv'

    csv_text = File.read('tmp/UF2020.csv') #leer el archivo y guardarlo en csv_text
    csv = CSV.parse(csv_text, headers: false, col_sep: ";") # transformar archivo a un formato más fácil de usar y almarcenar en csv

    csv.each do |months| # recorrer csv
      months.each_with_index do |uf, index| 
         #puts month[0] #imprimir cada fila del archivo
      next if index.zero? || uf.to_f.zero?#condición para saltar el cero
        date = Date.new(2020,index, months[0].to_f)
        ufnew = (uf.gsub(".","").gsub(",",".")).to_f
        UfRent.create(date: date, uf: uf)         
      end
    end
  end
end
