# Arquitetura e Convenções Técnicas

## Stack
- **Engine:** Godot 4.7.2-stable
- **Linguagem:** GDScript com tipagem estática
- **Visual:** 3D com `Camera3D` ortográfica isométrica (2.5D). Ver `docs/decisoes/0002-2-5d-3d-ortografico.md`. **Pendência:** o projeto base (fase placeholder, camadas de física `2d_physics`, filtro de textura `Nearest`) ainda é 2D e será migrado para 3D numa tarefa própria.
- **Testes:** GUT (Godot Unit Test)
- **Lint/format:** gdtoolkit (`gdlint`, `gdformat`)
- **Versionamento:** git (+ Git LFS se houver muitos assets binários grandes)

## Princípios
1. **Composição sobre herança:** comportamentos reutilizáveis viram nós-componente (ex.: `HealthComponent`, `HitboxComponent`).
2. **"Chame para baixo, sinalize para cima":** um nó pai chama métodos dos filhos; filhos emitem sinais para avisar o pai. Evite `get_parent()` e caminhos longos como `get_node("../../X")`.
3. **Cada cena roda sozinha:** dá para abrir e testar qualquer cena com F6.
4. **Dados em Resources:** atributos de inimigos, itens, fases etc. ficam em `.tres` baseados em classes de `scripts/resources/`, não fixos no código.
5. **Autoloads com moderação:** só para o que é realmente global.

## Autoloads previstos
| Nome | Arquivo | Responsabilidade |
|---|---|---|
| `EventBus` | `scripts/autoload/event_bus.gd` | Sinais globais (ex.: `player_died`, `level_completed`) |
| `GameState` | `scripts/autoload/game_state.gd` | Estado da partida (pontuação, fase atual) |
| `SceneManager` | `scripts/autoload/scene_manager.gd` | Troca de cenas e transições |
| `AudioManager` | `scripts/autoload/audio_manager.gd` | Música e SFX |
| `SaveManager` | `scripts/autoload/save_manager.gd` | Salvar/carregar (**ainda não criado**, só se necessário) |

## Organização de arquivos
- Cena e script principal ficam lado a lado quando o script é exclusivo da cena: `scenes/actors/player/player.tscn` + `player.gd`.
- Scripts reutilizáveis ficam em `scripts/components/`.

## Convenções de nomes
| Item | Convenção | Exemplo |
|---|---|---|
| Arquivos e pastas | snake_case | `enemy_slime.tscn` |
| `class_name` | PascalCase | `class_name EnemySlime` |
| Nós na árvore | PascalCase | `HealthComponent` |
| Variáveis e funções | snake_case | `max_speed`, `take_damage()` |
| Privadas | prefixo `_` | `_velocity_cache` |
| Constantes e enums | SCREAMING_SNAKE_CASE | `MAX_HEALTH` |
| Sinais | passado | `died`, `health_changed` |
| Ações de input | snake_case | `move_left` |

## Ordem dentro de um script
`class_name` → `extends` → docstring → sinais → enums → constantes → `@export` → variáveis públicas → privadas → `@onready` → `_ready()`/métodos built-in → métodos públicos → métodos privados.

## Configurações do projeto (atuais, ajuste quando o GDD definir)
- Resolução base: 1280x720
- Stretch mode / aspect: `canvas_items` / `keep`
- Filtro de textura padrão: `Nearest` (pixel art). Para arte HD, mude para `Linear`.
- Buses de áudio: Master → Music, SFX
- Camadas de física 2D: 1 `world`, 2 `player`, 3 `enemies`, 4 `pickups`, 5 `hitbox`, 6 `hurtbox`
- Input Map: `move_left/right/up/down` (WASD, setas, analógico, d-pad), `jump` (Espaço / A), `interact` (E / X), `pause` (Esc / Start)

## Ferramentas
- `./tools/check.sh`: importação + detecção de erros + lint + testes (o mesmo roda no GitHub Actions em `.github/workflows/ci.yml`)
- GUT 9.7.1 em `addons/gut` (painel GUT no editor, parte inferior)
