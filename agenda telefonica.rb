class Agenda
    def initialize(nome, telefone, email)
      @nome = nome
      @telefone = telefone
      @email = email
    end

    def salvarContato()
      arquivo = File.new("agenda.txt", "a")
      arquivo.puts '{"nome" => "%s", "numero" => "%s", "email" => "%s"}' % [@nome, @telefone, @email]
      arquivo.close
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

  agenda = Agenda.new(nome, numero, email)
  agenda.salvarContato()
end

main()