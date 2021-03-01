class Agenda
    def initialize(nome, telefone, email)
      @nome = nome
      @telefone = telefone
      @email = email
    end

    def salvarContatos()
      arquivo = File.new("agenda.txt", "a")
      arquivo.puts '%s,%s,%s' % [@nome, @telefone, @email]
      arquivo.close
    end

    def self.listarContatos
      if File.exists?("agenda.txt")
        arquivo = File.new("agenda.txt", "r")
        resultado = arquivo.readlines
        resultado.each do |linha|
          linha = linha.split(",")
          puts "Contato #{linha[0]} -- Número #{linha[1]}  -- E-mail #{linha[3]}"
        end
        arquivo.close
      end
    end
end

def apresentacaoIguais()
  80.times do |cont| 
    print "="
    if cont == 79
      puts
    end
  end
end

def main()
  apresentacaoIguais()
  puts "Bem vindo ao menu da agenda escolha uma das opções abaixo de acordo com o número"
  apresentacaoIguais()

  puts "\n1 - Listar contatos salvos"
  puts "2 - Adicionar novo contato\n\n"
  
  while
    opc = gets.chomp
    if opc != "1" and opc != "2"
      puts "O número digitado não é uma opção"
      next
    elsif opc == "1"
      listarContatos()
      break
    elsif opc == "2"
      adicionarNovoContato()
      break
    else 
      break 
    end
  end
end

def adicionarNovoContato()
  print("\nDigite o nome do contato: ")
  nome = gets.chomp
  print("Digite o número do contato: ")
  numero = gets.chomp
  print("Digite um e-mail(opcional): ")
  email = gets.chomp

  puts email

  $agenda = Agenda.new(nome, numero, email)
  $agenda.salvarContatos()
end

def listarContatos()
  Agenda.listarContatos
end

main()