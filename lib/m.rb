
require './matriznyj.rb'
include Matriznyj

consulta =  File.open("./matrices.rb").read
eval(consulta)



