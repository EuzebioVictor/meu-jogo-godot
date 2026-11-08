# Game Design Document (GDD) — versão enxuta

> Mantenha curto (1–3 páginas). É um documento vivo: atualize sempre que algo mudar.
> Fonte: visão do diretor criativo (T-001). Itens marcados como **proposta** ou **sugestão** foram escritos pelo game designer e aguardam aprovação.

## 1. Visão geral
- **Nome provisório:** a definir (ver Questões em aberto)
- **Tagline:** "Capa, espada e pólvora contra um Império que quer apagar a memória do povo."
- **Pitch:** "Num estado alegórico inspirado no Rio de Janeiro de 1850–1950, onde um Império ditatorial tenta apagar a memória do povo, você é um fora da lei da resistência que atravessa cidades vivas e estradas perigosas para investigar e derrubar os Inquisidores do regime — com sabre, pistola de pederneira e uma magia ancestral rara."
- **Gênero:** Action RPG isométrico de aventura / capa e espada, com combate em tempo real. Mundo fixo com cidades vivas + fortalezas procedurais (estrutura roguelite).
- **2D / 3D:** 2.5D isométrico, feito em **3D com câmera ortográfica fixa** (decisão `docs/decisoes/0002-2-5d-3d-ortografico.md`)
- **Plataformas:** PC (Windows, Linux, Mac)
- **Público-alvo:** a definir
- **Influências de tom (não são jogos):**
  - *7th Sea* (principal): capa e espada, intriga política.
  - *One Piece*: revolução, recompensas, alegoria social, "Século Perdido".
  - *Star Wars* e *Jogos Vorazes*: império opressor vs. rebelião.
  - *Vampiro: A Máscara*: tramas políticas.
- **Referências de jogos:** o diretor não tem referências. Abaixo, **sugestões do game-designer, aguardando aprovação** (jogo — o que pegar dele):
  1. *Hades* — combate isométrico em tempo real, responsivo, e estrutura de runs (para as fortalezas).
  2. *Middle-earth: Shadow of Mordor* — sistema Nemesis (base para a Teia de Inquisidores).
  3. *Dishonored* — cidade sob regime opressor, magia baixa, múltiplas formas de abordar e eliminar um alvo.
  4. *Disco Elysium* — cidade isométrica densa e política, investigação por diálogo e pistas.
  5. *Moonlighter* / *Children of Morta* — cidade fixa como base + masmorras procedurais.

## 2. Pilares de design (3 no máximo)
> **Proposta, aguardando aprovação.** Derivados diretamente das frases do diretor.

1. **Capa, espada e pólvora — combate de risco.** Lâmina, pederneira, luta corporal e magia baixa em tempo real; esquiva e gestão de distância decidem a luta, e o tempo de recarga da arma de fogo faz parte do risco.
2. **Investigar antes de derrubar.** Cada Inquisidor tem rotina, fraquezas e informantes; descobrir isso antes do confronto é o que abre a forma de vencê-lo.
3. **Um pária que vira símbolo.** O jogador é um fora da lei comum; a fama cresce com seus atos e pesa dos dois lados: mais repressão do regime e mais apoio do povo.

## 3. Core loop
> **Proposta, aguardando aprovação.** Montado a partir das mecânicas descritas.

```
[chegar a uma cidade viva] → [investigar o Inquisidor: rotina, fraquezas, informantes]
→ [preparar: equipamento, craft, aliados] → [invadir a fortaleza procedural e derrotar o boss]
→ [fama sobe (benefícios + repressão), competências sobem com o uso]
→ [viajar pela estrada até a próxima cidade] → (repete)
```
- **A cada 30 segundos o jogador:** luta (aproxima/afasta, esquiva, golpeia, atira e se expõe na recarga) ou interage com a cidade (conversa, observa um NPC, coleta pista).
- **A cada 5 minutos o jogador:** conclui uma missão secundária, obtém uma informação sobre um Inquisidor, cria/troca equipamento ou enfrenta um encontro/puzzle na estrada.
- **Ao longo da campanha o jogador:** derruba os Inquisidores cidade por cidade, enquanto sua fama o transforma em símbolo da resistência e em alvo do regime.

## 4. Mecânicas
| Mecânica | Descrição | Prioridade |
|---|---|---|
| Combate em tempo real | Lâminas (sabre, facão, navalha), pólvora (pederneira, mosquete), luta corporal e magia baixa. | a definir no escopo |
| Esquiva e gestão de distância | Base defensiva do combate; posicionamento importa. | a definir no escopo |
| Recarga da arma de fogo | O tempo de recarga é parte do risco do combate. | a definir no escopo |
| Magia ancestral rara | Magia baixa, rara (natureza e limites a definir). | a definir no escopo |
| Progressão por competência | Sem classes; cada competência sobe com o uso e tem árvore própria. | a definir no escopo |
| Nível do personagem | Nível = soma das competências. | a definir no escopo |
| Equipamento | Itens equipáveis. | a definir no escopo |
| Craft | Criação de itens. | a definir no escopo |
| Teia de Inquisidores (estilo Nemesis) | Investigar rotina, fraquezas e informantes antes do confronto. | a definir no escopo |
| Fortalezas procedurais ("ginásios") | Cada cidade tem uma fortaleza com boss; fortaleza e boss gerados aleatoriamente, cada um com uma forma diferente de ser derrotado. | a definir no escopo |
| Fama de mão dupla | Mais fama = mais repressão (patrulhas, caçadores de recompensa) e mais benefícios com o povo e aliados (abrigo, descontos, informações). | a definir no escopo |
| Deslocamento | A pé, canoa, cavalo, trem e bonde. | a definir no escopo |
| Estradas entre cidades | Estradas fixas, cheias de segredos, puzzles e inimigos. | a definir no escopo |
| Cidades vivas | NPCs com rotina. | a definir no escopo |
| Ciclo dia/noite | Afeta as cidades vivas. | a definir no escopo |
| Missões | Principais e secundárias. | a definir no escopo |
| Conteúdo variável | Fortalezas, bosses, masmorras e encontros variam a cada jogo; história e cidades são fixas. | a definir no escopo |

## 5. Controles
> Ainda não definido se o jogo usa teclado+mouse, gamepad ou ambos. As ações abaixo são do modelo; o combate (ataque, tiro/recarga, esquiva, magia) ainda não tem ações no Input Map, e não está decidido se há pulo.

| Ação (nome no Input Map) | Teclado | Gamepad | Toque |
|---|---|---|---|
| `move_left` | A / ← | Analógico esq. | |
| `move_right` | D / → | Analógico esq. | |
| `jump` | Espaço | A | |
| `pause` | Esc | Start | |

## 6. Condições de vitória e derrota
- **Vitória:** (já se sabe: o objetivo da campanha é investigar e derrubar os Inquisidores do regime; condição final a definir)
- **Derrota:**
- **O que acontece ao perder:** (a definir, especialmente o que se perde ao morrer numa fortaleza — estrutura roguelite)

## 7. Progressão e conteúdo
- **Estrutura:** mundo fixo (história, cidades e estradas fixas) + conteúdo procedural (fortalezas, bosses, masmorras e encontros). Não é mundo aberto infinito nem totalmente procedural. Cada cidade tem uma fortaleza com boss.
- **Progressão do personagem:** por competência, sem classes e sem XP por matar. Cada competência sobe com o uso e tem árvore própria; nível do personagem = soma das competências. Complementada por equipamento e craft.
- **Progressão social:** fama de mão dupla (repressão vs. benefícios com o povo e aliados).
- **Rejogabilidade:** vem da variação das fortalezas, bosses, masmorras e encontros.
- **Quantidade de conteúdo no MVP:** a definir (ver `docs/02-ESCOPO.md`)
- **Quantidade de conteúdo na 1.0:** a definir (número de cidades em aberto)

## 8. Personagens, inimigos e objetos
> Já se sabe: protagonista (fora da lei da resistência), Inquisidores do regime, bosses de fortaleza, patrulhas, caçadores de recompensa, NPCs com rotina, informantes, grupos aliados. Nenhum personagem nomeado ainda.

| Nome | Tipo | Comportamento | Prioridade |
|---|---|---|---|
| | | | |

## 9. Interface (UI/HUD)
- Telas: menu principal, HUD, pausa, game over, opções
- Informações no HUD:
> Notas: provavelmente será preciso exibir estado da arma de fogo (carregada/recarregando), fama e informações coletadas sobre Inquisidores. A definir.

## 10. Arte e áudio
- **Estilo visual:** a definir (2.5D isométrico)
- **Resolução base:**
- **Paleta:**
- **Música/SFX:** (estilo, fontes)
> Notas: ambientação alegórica do Rio de Janeiro de 1850–1950. A música é parte da vida do bar Cabeça de Porco.

## 11. Narrativa
- **Premissa:** num estado alegórico inspirado no Rio de Janeiro de 1850–1950, um Império ditatorial tenta apagar a memória do povo. O jogador é um fora da lei da resistência que investiga e derruba os Inquisidores do regime.
- **Alegoria, não documentário:** o Rio de 1850–1950 é inspiração (história, geografia, sociedade, literatura), nunca cópia. Nomes, lugares e fatos são reinventados.
- **Protagonista:** um pária, não um escolhido. Fora da lei comum que vira símbolo pela própria fama.
- **O regime:** fusão da pompa do Império brasileiro com a repressão da ditadura militar — censura, vigilância, polícia política, reescrita da história. Os Inquisidores são seus agentes.
- **A resistência:** une movimentos contra o Império e contra a ditadura no Rio — imprensa clandestina, casas seguras, sabotagem (telégrafo, trilhos, depósitos), guerrilha urbana.
- **Literatura carioca:** *O Cortiço* (Aluísio Azevedo) inspira bairros densos e populares. **Cabeça de Porco** é um bar, nó central da resistência urbana (música, comércio clandestino, conspiração).
- **Tom:** capa e espada com intriga política (7th Sea), revolução e recompensas com alegoria social (One Piece), império opressor vs. rebelião (Star Wars, Jogos Vorazes), tramas políticas (Vampiro: A Máscara).
- **Estrutura:** história principal fixa, sem escolhas que ramifiquem a história inteira. Missões principais e secundárias.
- **Como é contada:** a definir (diálogos, textos, ambiente).

## Fora do design (decidido)
- Não é mundo aberto infinito nem totalmente procedural.
- Sem classes e sem XP por matar.
- Sem magia grandiosa estilo "mago de túnica".
- Sem escolhas que ramificam a história principal inteira (custo alto).
- Não é MMORPG.

## 12. Questões em aberto
- ~~**Técnica do 2.5D**~~ → **decidido:** 3D + câmera ortográfica (ver `docs/decisoes/0002-2-5d-3d-ortografico.md`). Em aberto: personagens em modelo 3D low-poly ou sprites sobre cenário 3D.
- **Fortalezas e morte:** o que se perde ao morrer numa fortaleza? O que persiste entre tentativas (estrutura roguelite)? Qual a condição de vitória final e de derrota?
- **Inquisidor x boss:** o boss de cada fortaleza é o Inquisidor daquela cidade? Como a investigação se traduz na "forma diferente de ser derrotado"?
- **Magia ancestral:** o que é, de onde vem, quais seus limites e como se encaixa no combate e na progressão?
- **Controles:** teclado+mouse, gamepad ou ambos? Mira da arma de fogo com mouse? Há pulo?
- **Quantidade de conteúdo:** quantas cidades (e fortalezas)? Quais competências existem?
- **Nome** do jogo, do mundo/estado alegórico e do protagonista (protagonista fixo ou criado pelo jogador?).
- **Estilo de arte** e resolução base.
- **Público-alvo.**
- **Sabotagem e ações da resistência** (telégrafo, trilhos, depósitos): são mecânicas jogáveis ou apenas contexto narrativo?
- **Deslocamento:** canoa, cavalo, trem e bonde são controláveis ou viagem rápida/transição?
- **Fama:** a fama é global ou por cidade? Pode diminuir?
- **Referências de jogos:** aprovar, cortar ou substituir as sugestões da seção 1.
