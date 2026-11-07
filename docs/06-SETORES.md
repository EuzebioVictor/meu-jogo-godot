# Setores e Divisão de Trabalho

| Setor | Agente | É dono de | Não mexe em |
|---|---|---|---|
| 🎯 Produção | `produtor` | `docs/QUADRO.md`, `docs/04-ROADMAP.md`, `docs/02-ESCOPO.md`, `docs/SPRINTS.md` | Código, cenas |
| 🎲 Design | `game-designer` | `docs/01-GDD.md`, `docs/specs/` | Código, cenas |
| 💻 Programação | `programador-gameplay` | `scripts/`, cenas de `scenes/actors/`, `tests/unit/` | Docs de design (só sugere) |
| 🖥️ UI/UX | `dev-ui` | `scenes/ui/`, temas de interface | Regras de gameplay |
| 🗺️ Level Design | `level-designer` | `scenes/levels/`, `docs/fases/` | Lógica de gameplay |
| 🎨 Arte e Áudio | `diretor-arte-audio` | `assets/`, `docs/GUIA-DE-ARTE.md`, `docs/LISTA-DE-ASSETS.md`, `docs/CREDITOS.md` | Lógica de gameplay |
| 🧪 QA | `qa-tester` | `tests/`, `docs/BUGS.md` | Código de produção (só reporta) |
| 🔍 Arquitetura | `revisor-tecnico` | Nada (somente leitura) | Tudo (só aponta) |

## Como chamar um agente
- Automático: o Claude Code escolhe pelo assunto do pedido.
- Explícito: *"Use o agente game-designer para propor 3 variações do pulo."*
- Pelo fluxo completo: `/tarefa T-005`

## Comandos disponíveis
| Comando | O que faz |
|---|---|
| `/tarefa T-NNN` | Fluxo completo de uma tarefa (detalhar → implementar → QA → revisão) |
| `/verificar` | Roda `./tools/check.sh` e resume |
| `/status` | Panorama: marco, sprint, quadro, bugs, git |
| `/sprint planejar` / `/sprint fechar` | Planejamento e retrospectiva semanal |
| `/agents` | (nativo) Lista e edita os agentes |

## O que só você faz
- Decidir o conceito, os pilares e o que é "divertido"
- Testar no editor (o Claude não vê a tela)
- Montar layout visual fino: tilemaps, posições, cores, animações no AnimationPlayer
- Criar ou escolher a arte e o áudio finais
- Aprovar commits e marcos
