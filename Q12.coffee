require './stdlib'

processos = load_yaml "proc.yaml"

color = (cor, texto) ->
  cores =
    red: "\x1b[31m"
    green: "\x1b[32m"
    yellow: "\x1b[33m"
    cyan: "\x1b[36m"
    reset: "\x1b[0m"
  "#{cores[cor]}#{texto}#{cores.reset}"

qnt_nucleo = 4
mostra color("cyan","---------------Affinity - Processos por Nucleo---------------")

for nucleo in [0..qnt_nucleo-1]
    mostra color("red", "Nucleo #{nucleo}:")
    for proce in processos
        if nucleo in proce.affinity
            saida = color("yellow", "PID: ") +
                    color("green", proce.pid) +
                    ", " +
                    color("yellow", "Nome: ") +
                    color("green", proce.name)
            mostra saida

        