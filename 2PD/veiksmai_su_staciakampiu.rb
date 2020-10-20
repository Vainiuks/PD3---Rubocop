# frozen_string_literal: true

# Sioje programoje apskaiciuojamas staciakampio plotas/perimetras ir istrizaine
class Program
  # Metodas/Funkcija i kuria paduodame staciakampio ilgi bei auksti su kuriuo galime apskaiciuoti staciakampio plota
  # bei pacioje funkcijoje atspausdinamas atsakymas
  def area_size(height, lenght)
    printf "Staciakampio plotas: #{height * lenght} \n"
  end

  # Metodas/Funkcija i kuria paduodame staciakampio ilgi bei auksti su kuriuo galime apskaiciuoti staciakampio perimetra
  # bei pacioje funkcijoje atspausdinamas atsakymas
  def perimeter(height, lenght)
    printf "Staciakampio perimetras: #{2 * (height * lenght)} \n"
  end

  # Metodas i kuri paduodame staciakampio ilgi bei auksti su kuriuo galime apskaiciuoti staciakampio istrizaine
  # bei pacioje funkcijoje atspausdinamas atsakymas
  def diagonal(height, lenght)
    printf "Staciakampio istrizaine: #{Math.sqrt((height * height) + (lenght * lenght))} \n"
  end
end

integer_height = 5
integer_lenght = 4
printf "Staciakampio aukstis: #{integer_height} \n"
printf "Staciakmpio ilgis: #{integer_lenght} \n \n"

# Sukuriamas klases Program objektas - class1
class1 = Program. new

# Su sukurtu klases objektu - class1 galime pasiekti toje klaseje esancias funkcijas/metodus ir jas iskviesti paduodami
# i jas parametrus
# Iskviesdami Area_Size metoda paduodama i ji programiskai parasytus kintamuosiuos, staciakampio ilgi bei auksti -
# kaip ir i Perimeter ar Diagonal metodus

# Area_Size metodas apskaiciuoja staciakampio plota bei isveda atsakyma ekrane
class1.area_size(integer_height, integer_lenght)
# Perimeter metodas apskaiciuoja staciakampio perimetra ir atsakyma isveda ekrane
class1.perimeter(integer_height, integer_lenght)
# Diagonal metodas apskaiciuoja staciakampio istrizaine ir atsakyma isveda ekrane
class1.diagonal(integer_height, integer_lenght)
