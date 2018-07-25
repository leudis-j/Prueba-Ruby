
#Se genera un archivo con el nombre de cada alumno y el promedio de notas
def promedio_notas(notas)
  promedio = {}
  notas.each { |key, value| promedio[key] = value.inject(0) { |acum, n| acum + n.to_f / value.length}.round(2) }
  file = File.open('promedio_notas.csv', 'w')
  promedio.each { |k,v| file.puts "#{k}: #{v}" }
  file.close
  puts " *********************"
  puts "\n*** Se genera Archivo ***"
  puts "\n *********************"
end
# Se muestra el total de inasistencias por alumno
def total_inasistencias(notas)
  inasistencias = {}
  notas.each { |key, value| inasistencias[key] = value.count('0') }
  puts "********* Inasistencias ************\n\n"
  inasistencias.each { |k,v| puts "#{k}: #{v}" }
  puts "\n*********************************"
end
# Se mustran los alumnos que aprobaron
def alumnos_aprobados(notas, nota_minima= 5)
  promedio = {}
  notas.each { |key, value| promedio[key] = value.inject(0) { |acum, n| acum + n.to_f / value.length}.round(2) }
  aprovados = {}
  aprovados = promedio.select{ |k, v| v >= nota_minima}
  puts "*********Alumnos aprobados ************\n\n"
  aprovados.each { |k,v| puts "#{k}: #{v}" }
  puts "\n********* Felicidades ************"
end

notas = {}
file = File.readlines('a_notas.csv').map { |e| e.chomp.split(', ')}
file.each { |ele| notas[ele[0].to_sym] = ele[1..5] }
notas.each { |k, v| notas[k] = v.map { |e| e.gsub(/A/, '0')  }}

#********* MENU  +++++++++++

salir = false
until salir
puts '******************** MENU *********************'
puts '1 .- Generar archivo con promedio de notas'
puts '2 .- Mostrar cantidad de inasistencia por alumno'
puts '3 .- Mostrar alumnos aprovados'
puts '4 .- Exit'
puts '****************** END MENU ********************'
option = gets.chomp.to_i

  case option
    when 1 then promedio_notas(notas)
    when 2 then total_inasistencias(notas)
    when 3 then alumnos_aprobados(notas)
    when 4 then salir = true
  end
end
