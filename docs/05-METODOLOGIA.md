# Metodologia de Desenvolvimento

Adaptação **Kanban + sprints semanais** para uma equipe de uma pessoa (você) com agentes do Claude Code.

## Papéis
| Quem | Papel |
|---|---|
| **Você** | Diretor criativo e produtor executivo: decide design, aprova planos, faz o teste manual no editor, aprova commits |
| **Claude Code (sessão principal)** | Coordenador: recebe o pedido, aciona o agente certo e junta os resultados |
| **Agentes** | Especialistas por setor (ver `06-SETORES.md`) |

## Ciclo de trabalho

### Sprint (1 semana)
1. **Planejamento** (`/sprint planejar`): escolher tarefas do backlog que caibam nas suas horas da semana.
2. **Execução** (`/tarefa T-NNN`): uma tarefa por vez, do início ao fim.
3. **Playtest** (fim da semana): jogar a build por 10 a 15 minutos e anotar impressões em `docs/playtests.md`.
4. **Fechamento** (`/sprint fechar`): retrospectiva curta e ajuste do roadmap.

### Fluxo de uma tarefa
```
Backlog → Pronto para fazer → Em andamento → Revisão → Feito
              ▲                    │            │
         (Definition         produtor/      qa-tester +
          of Ready)         designer →     revisor-tecnico +
                            setor executa  SEU teste manual
```

| Etapa | Responsável | Saída |
|---|---|---|
| 1. Detalhar | `produtor` (+ `game-designer` se for mecânica nova) | Tarefa com critérios de aceite |
| 2. Planejar | agente do setor | Plano curto; você aprova se tocar mais de 3 arquivos |
| 3. Implementar | agente do setor | Código, cenas, testes |
| 4. Verificar | `qa-tester` | `./tools/check.sh` verde + roteiro de teste manual |
| 5. Revisar | `revisor-tecnico` | Veredito |
| 6. Testar no editor | **você** | OK ou relato do problema |
| 7. Commit | você (ou Claude, quando você autorizar) | `tipo: descrição` |

## Definition of Ready (tarefa pode começar)
- [ ] Título claro e setor definido
- [ ] Critérios de aceite verificáveis ("ao apertar `jump` o player sobe ~3 tiles")
- [ ] Estimativa de até 3 horas (senão, quebrar)
- [ ] Dependências concluídas
- [ ] Spec em `docs/specs/` se for mecânica nova

## Definition of Done (tarefa terminou)
- [ ] Critérios de aceite atendidos
- [ ] `./tools/check.sh` sem erros (carregamento, lint, testes)
- [ ] Testes GUT para a lógica nova
- [ ] Revisor técnico: APROVADO ou APROVADO COM RESSALVAS
- [ ] Você testou no editor e confirmou
- [ ] Documentos afetados atualizados (GDD, arquitetura, quadro)
- [ ] Commit feito

## Git
- `main` sempre jogável.
- Uma branch por tarefa: `feat/T-012-pulo-duplo`, `fix/B-003-camera-treme`.
- Commits: `feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`, `art:`, `audio:`, `level:`.
- Ao fechar cada marco: tag `v0.N` (ex.: `v0.1` = Marco 1).

## Prioridade de bugs
| Severidade | Significado | Ação |
|---|---|---|
| 🔴 Crítica | Crash, travamento, perda de progresso | Para tudo e corrige |
| 🟠 Alta | Mecânica principal quebrada | Entra na sprint atual |
| 🟡 Média | Comportamento errado com contorno | Backlog priorizado |
| 🟢 Baixa | Visual/cosmético | Backlog |

## Regras de ouro
1. **Jogável primeiro, bonito depois.** Placeholders até o core loop ser divertido.
2. **Uma tarefa por vez.** Termine antes de começar outra.
3. **Escopo é sagrado.** Ideia nova vai para "Talvez algum dia", não para a sprint atual.
4. **Se não está no `docs/`, não foi decidido.**
