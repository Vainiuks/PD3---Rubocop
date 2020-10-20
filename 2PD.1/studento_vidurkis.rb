# frozen_string_literal: true

# Sioje programoje apskaiciuojamas studento vidurkis pagal duotus mokamo dalyko kreditus bei pazymius.
class StudentoVidurkis
  # Paleidus programa rankiniu budu console'je ivedame studento duomenis
  # (Varda, Pavarde, Grupe, Isklausytu dalyku/moduliu kieki)
  puts 'Iveskite studento varda: '
  # gets metodu galime nuskaityti naudotojo input'a
  # chomp metodas pasalina enter arba kitaip sakant naujos eilutes simboli
  vardas = gets.chomp

  puts 'Iveskite studento pavarde: '
  pavarde = gets.chomp
  puts 'Iveskite studento grupe: '
  grupe = gets.chomp

  puts 'Kiek studentas isklause dalyku?: '
  isklausyti_dalykai = gets.chomp

  # String kintamasis konvertuojamas i integer
  number = isklausyti_dalykai.to_i

  # Sukuriami trys masyvai i kuriuos bus rasomi -
  # Studento dalykai/moduliai, kreditai uz dalyka, bei pazymiai is to dalyko/modulio
  studento_dalykai = []
  studento_kreditai = []
  studento_pazymiai = []

  # Sukamas ciklas priklausomai nuo to, kiek studentas turejo isklausytu dalyku, -1 prie number del to,
  # nes ciklas pradedamas iteruoti nuo 0 o ne nuo 1
  (0..number - 1).each do |i|
    # Prasidejus ciklui, privalesime ivesti tiek skirtingu dalyku, kreditu bei pazymiu
    # kiek studentas bus isklauses dalyku.
    # Ivedame studentio isklausyta dalyka, bei jo modulio pavadinima patalpiname i masyva "studentoDalykai"
    puts 'Iveskite studento isklausyta dalyka: '
    dalykas = gets.chomp
    studento_dalykai.insert(i, dalykas)

    # Ivedame studento gauta kreditu skaiciu is modulio ir ji idedame i masyva "studentoKreditai" su insert funkcija
    # insert(i, numKreditas).  i - reiskia i kelinta pozicija idesime musu gauta reiksme,
    # o numKreditas - bus toji reiksme, kuria idesime i masyva
    # Taip pat string reiksme "kreditas" konvertuojamas i integer.
    puts 'Iveskite studento gauta kreditu skaiciu: '
    kreditas = gets.chomp
    num_kreditas = kreditas.to_i
    studento_kreditai.insert(i, num_kreditas)

    # Ivedame studento gauta pazymi is modulio ir ji idedame i masyva "studentoPazymiai" su insert funkcija
    # insert(i, numPazymis).  i - reiskia i kelinta pozicija idesime musu gauta reiksme,
    # o numPazymis - bus toji reiksme, kuria idesime i masyva
    # Taip pat string reiksme "pazymis" konvertuojamas i integer.
    puts 'Iveskite studento gauta pazymi: '
    pazymis = gets.chomp
    num_pazymis = pazymis.to_i
    studento_pazymiai.insert(i, num_pazymis)
  end

  # Funkcija/metodas kuri turi tris parametrus
  # (Masyva - studentoKreditai, masyva - studentoPazymiai, arraySize - masyvo dydi)
  # Sioje funkcijoje/metode apskaiciuojamas studento vidurkis pagal gautus kreditus is dalyku ir pazymius
  def get_vidurkis(studento_kreditai, studento_pazymiai, array_size)
    # Du kintamieji sk1, sk2, kadangi jie string tipo, jie bus konvertuojami
    sk1 = 0
    sk2 = 0

    # Kadangi galutinis veiksmas bus dalyba, todel as is anksto apsibreziu du kintamuosius dalmuo/daliklis,
    # kad butu paprasciau suprasti koda
    dalmuo = sk1.to_i
    daliklis = sk2.to_i

    # Siame cikle apsiskaiciuoju dalmeni
    # Siame for cikle iteravimas bus tiek kartu, koks bus masyvo dydis, taip pat privalome atimti -1.
    # Nes jei masyvo dydis yra 5, .size funkcija toki skaiciu ir nurodys,
    # bet masyvo inicializavimas prasideda nuo 0 pozicijos, todel turime atimti -1.
    (0..array_size - 1).each do |i|
      # Dalmuo sioje formuleje yra, studento pazymio bei kredito sandauga i-tojo elemento masyve bei ju visu suma kartu
      dalmuo += (studento_pazymiai[i].to_i * studento_kreditai[i].to_i)
    end

    # Siame cikle apskaiciuoju dalikli
    (0..array_size - 1).each do |i|
      # Daliklkis sioje formuleje yra, studento kreditu suma
      daliklis += studento_kreditai[i].to_i
    end

    # Galiausiai dalmuo yra padalinamas is daliklio ir taip gaunamas studento vidurkis.
    # Rezultatas yra grazinamas
    dalmuo / daliklis
  end

  # Kadangi visi masyvai vieno dydzio, pagal viena is musu sukurtu masyvu suzinome kokio dydzio tas masyvas
  # su .size funkcija.
  array_size = studento_pazymiai.size

  # Sukuriamas StudentoVidurkis klases objektas - class1, su kuriuo galesime pasiekti toje klaseje esancius
  # metodus,objektus ir kt.
  class1 = StudentoVidurkis. new

  # Su class1 sukurtu objektu paduodame StudentoVidurkis klases viduje esanciame metode "getVidurkis" kintamuosiuos
  # (masyva StudentoKreditai, masyva StudentoPazymiai, ir masyvo dydi)
  # Taip pat gautas vidurkis, jo reiksme yra grazinamas
  vidurkis = class1.get_vidurkis(studento_kreditai, studento_pazymiai, array_size)

  # Sioje vietoje atspausdinama visa informacija apie studenta - (Vardas, Pavarde, Grupe ir Vidurkis )
  # viskas atvaizduojama ekrane - konsoleje.
  printf "\n  \n \n Results: \n"
  printf "Studento vardas: #{vardas} \n"

  printf "Studento pavarde: #{pavarde} \n"

  printf "Studento grupe: #{grupe} \n"

  printf "Studento vidurkis: #{vidurkis}"
end
