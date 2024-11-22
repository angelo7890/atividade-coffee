require './stdlib'

processos = load_yaml "proc.yaml"

color = (cor, texto) ->
  cores =
    red: "\x1b[31m"
    green: "\x1b[32m"
    yellow: "\x1b[33m"
    reset: "\x1b[0m"
    cyan: "\x1b[36m"
    pink: "\x1b[35m"
  "#{cores[cor]}#{texto}#{cores.reset}"

listarProcessosPorEstado = (estado) -> 
  processos.filter (processo) -> processo.state is estado

imprimirProcesso = (processo) -> 
  saida = color("pink", "PID: #{processo.pid}") +
            ", " +
            color("green", "Nome: #{processo.name}") +
            ", " +
            color("pink", "Estado: #{processo.state}") +
            ", " +
            color("green", "IO Bound: #{processo.io_bound}") +
            ", " +
            color("pink", "UID: #{processo.uid}") +
            ", " +
            color("green", "Affinity: #{processo.affinity}")
  mostra saida

imprimirListaProcessos = (lista) -> 
  for processo in lista
    imprimirProcesso(processo)

listarTodosProcessos = -> 
  mostra color("red","Lista completa de processos:")
  imprimirListaProcessos(processos)

mostra color("cyan", "Escolha uma opção:")
mostra color("yellow", "1: Listar processos com status 'ready'")
mostra color("yellow", "2: Listar processos com status 'running'")
mostra color("yellow", "3: Listar processos com status 'blocked'")
mostra color("yellow", "4: Listar todos os processos")

num = parseInt(recebe())

if num == 1
    mostra  color("cyan","Processos READY:")
    imprimirListaProcessos(listarProcessosPorEstado('ready'))
else if num == 2 
    mostra color("yellow","Processos RUNNING:")
    imprimirListaProcessos(listarProcessosPorEstado('running'))
else if num == 3 
    mostra color("yellow","Processos BLOCKED:")
    imprimirListaProcessos(listarProcessosPorEstado('blocked'))
else if num == 4
    mostra color("yellow","--------------TODOS OS PROCESSOS--------------")
    listarTodosProcessos()
else
    mostra color("red","Opcao invalida")