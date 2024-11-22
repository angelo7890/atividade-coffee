require './stdlib'

processos = load_yaml "proc.yaml"

color = (cor, texto) ->
  cores =
    red: "\x1b[31m"
    green: "\x1b[32m"
    yellow: "\x1b[33m"
    blue: "\x1b[34m"
    reset: "\x1b[0m"
  "#{cores[cor]}#{texto}#{cores.reset}"

mostra color("red","Processos I/O Bound:")
for proce in processos
    if proce.io_bound == true
        saida = color("yellow", "PID: ") +
                color("green", proce.pid )+
                color("yellow", " Nome: ") +
                color("green", proce.name) 
        mostra saida 

