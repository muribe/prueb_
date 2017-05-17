def average(arr)
    sum = 0
    arr.each do |value|
        if value.downcase!='a'
           sum += value.to_i 
        end
    end
    return sum.to_f/(arr.size-1).round(2) 
end
def make_files(file)
    sum = 0
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(', ')
                File.open(words[0]+'.txt','w') do |f2|
                    f2.puts "Alumno : #{words[0]}\nPromedio: #{average(words)}"
                end                       
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def inasistencia_total(file)
     begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                word_count = 0
                words = line.split(', ').each do |word|
                    word_count += 1 if 'a' == word.downcase.chomp
                end
                if word_count > 0
                    puts "El alumno #{words[0]} tiene un total de #{word_count} inasistencias"                        
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
def alumnos_aprobados(file,nota)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                word_count = 0
                words = line.split(', ')
                if average(words) >= nota.to_i
                    puts "El alumno #{words[0]} esta aprobado con una nota #{average(words)}"
                else    
                    puts "El alumno #{words[0]} esta reprobado con una nota #{average(words)}"
                end
            end
        end        
    rescue Exception => msg
        puts msg
    end
end
file="notas.csv"
loop do
    puts "1.- Crear archivos con promedio de notas"
    puts "2.- Contar inasistencias totales"
    puts "3.- Mostrar Alumnos aprobados"
    puts "4.- Salir"
    puts "Ingrese opción:\n"
    op = gets.chomp
    case op
    when "1"
        make_files(file)
        puts "\nArchivos creados correctamente\n\n"
    when "2"
        inasistencia_total(file)
    when "3"
        puts "Ingrese nota de aprobación\n"
        nota=gets.chomp
        alumnos_aprobados(file,(nota.empty?) ? 5 : nota)
    when "4"        
        break
    else
      puts "Opción no valida!, vuelva a intentarlo"
    end        
end 