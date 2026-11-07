# CLAUDE.md

Instruções para o Claude Code neste projeto. Responda e comente em **português**.

## Projeto
Jogo em **Godot 4.7.2-stable** usando **GDScript**.
Antes de implementar algo, consulte:
- `docs/01-GDD.md`: o que é o jogo
- `docs/02-ESCOPO.md`: o que está ou não no escopo (não implemente features de fora do escopo sem perguntar)
- `docs/03-ARQUITETURA.md`: convenções obrigatórias
- `docs/04-ROADMAP.md`: marco e tarefa atuais

## Regras de código
- GDScript 4 com **tipagem estática** em variáveis, parâmetros e retornos (`var speed: float = 200.0`, `func take_damage(amount: int) -> void:`).
- Sintaxe Godot 4: `@export`, `@onready`, `signal.emit()`, `signal.connect(callable)`, `CharacterBody2D` + `velocity` + `move_and_slide()` sem argumentos. Nunca use sintaxe do Godot 3 (`export var`, `yield`, `emit_signal("x")`, `KinematicBody2D`).
- Input sempre por ações do Input Map (`Input.is_action_pressed("jump")`), nunca por teclas fixas.
- Siga "chame para baixo, sinalize para cima". Evite `get_parent()` e caminhos de nó frágeis; prefira `@export var x: Node` ou `%NomeUnico`.
- Valores ajustáveis (velocidade, vida, dano) devem ser `@export` ou ficar em Resources.
- Nomes e ordem de membros conforme `docs/03-ARQUITETURA.md`.
- Não edite arquivos `.import` nem a pasta `.godot/`.

## Arquivos de cena (.tscn)
- Pode criar e editar `.tscn`/`.tres` em texto, mas mantenha-os simples. Para layouts visuais complexos (UI, tilemaps), prefira criar a estrutura mínima e indicar ao usuário o que ajustar no editor.
- Ao referenciar recursos, use caminhos `res://` que existam de fato.

## Estrutura já existente
- Autoloads: `EventBus` (sinais globais), `GameState` (pontuação/pausa), `SceneManager.change_scene(path)` (troca com fade), `AudioManager` (música/SFX nos buses Music e SFX).
- Fluxo: `scenes/main/main.tscn` → `scenes/ui/main_menu.tscn` → `scenes/levels/level_template.tscn` (placeholder com `PauseMenu`).
- Componente de exemplo: `scripts/components/health_component.gd`.
- Ações do Input Map: `move_left`, `move_right`, `move_up`, `move_down`, `jump`, `interact`, `pause`.
- Camadas de física 2D: 1 world, 2 player, 3 enemies, 4 pickups, 5 hitbox, 6 hurtbox.

## Verificação
- **Verificação completa (rode antes de concluir qualquer tarefa):** `./tools/check.sh` (importa, procura erros, roda gdlint/gdformat e os testes GUT)
- Só testes: `godot --headless -s addons/gut/gut_cmdln.gd -gconfig=.gutconfig.json`
- Novos testes vão em `tests/unit/test_*.gd` (estendem `GutTest`). Escreva testes para lógica pura (componentes, regras, cálculos).
- Formate com `gdformat <arquivo>` depois de editar scripts.
- Você não vê o jogo rodando. Ao terminar uma tarefa, diga ao usuário **exatamente o que testar no editor** e o que deve acontecer.

## Fluxo de trabalho
- Uma tarefa pequena por vez. Para tarefas grandes, apresente um plano antes.
- Ao concluir, sugira uma mensagem de commit no formato `tipo: descrição` (feat, fix, refactor, docs, chore, test).
- Se uma decisão de design ou arquitetura mudar, atualize o documento correspondente em `docs/`.
