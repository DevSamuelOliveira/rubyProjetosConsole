class Agenda
    def initiliaze(nome, telefone, email = "")
      @nome = nome
      @telefone = telefone
      @email = email
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

def exibirMenu()
  apresentacaoIguais()
  puts "Bem vindo ao menu da agenda escolha uma das opções abaixo de acordo com o número"
  apresentacaoIguais()

  puts "\n1 - Listar contatos salvos"
  puts "2 - Adicionar novo contato\n\n"
  
  while
    opc = gets.chomp
    if opc != "1" and opc != "2"
      puts "O número digitado não é uma opção"
    else 
      break 
    end
  end
end

def verificarAgenda()
  file = File.new("agenda.txt", "r")

  rescue Exception => erro
  
  if erro.to_s == "No such file or directory @ rb_sysopen - agenda.txt"
    file = File.new("agenda.txt", "w")
  end
end

exibirMenu()