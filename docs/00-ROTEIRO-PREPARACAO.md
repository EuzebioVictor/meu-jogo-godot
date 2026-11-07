# Roteiro da Fase de Preparação

Marque cada item ao concluir. **Critério de saída:** todos os itens das Etapas 1–6 marcados.

---

## Etapa 1 — Conceito (você decide, o Claude ajuda a refinar)
- [ ] Definir o gênero e a ideia central em **uma frase** (o "pitch")
- [ ] Definir o **core loop**: o que o jogador faz a cada 30 segundos?
- [ ] Listar 3 jogos de referência (mecânica, sensação ou estética), anotando o que inspira em cada um
- [ ] Definir 2D ou 3D (para um primeiro projeto, 2D é muito mais rápido)
- [ ] Definir plataforma alvo (PC, web/HTML5, mobile)
- [ ] Preencher `01-GDD.md`

> Prompt útil: *"Leia docs/01-GDD.md e me faça perguntas para fechar as lacunas do design, uma seção de cada vez."*

## Etapa 2 — Escopo
- [ ] Definir o **MVP**: a menor versão jogável que prova que o core loop é divertido
- [ ] Separar as features em **MVP / Versão 1.0 / Talvez algum dia**
- [ ] Definir prazo realista e horas por semana disponíveis
- [ ] Preencher `02-ESCOPO.md`

> Regra de ouro: corte o escopo pela metade, e depois corte de novo.

## Etapa 3 — Ambiente e ferramentas
- [x] Instalar o **Godot 4.x estável** (versão padrão, GDScript; a versão .NET só se for usar C#)
- [x] Anotar a versão exata em `03-ARQUITETURA.md` e no `CLAUDE.md`
- [ ] Deixar o executável do Godot acessível no PATH como `godot` (o Claude Code usa no modo headless)
- [ ] Instalar o Claude Code e testar no terminal da pasta do projeto
- [ ] Instalar o git e criar o repositório (GitHub/GitLab) privado
- [x] (Opcional) Instalar `gdtoolkit` para lint e formatação: `pip install "gdtoolkit==4.*"`
- [ ] (Opcional) Editor externo: VS Code + extensão *godot-tools*

## Etapa 4 — Projeto base
- [ ] Abrir o Godot (4.7.2) → *Importar* → selecionar `project.godot` desta pasta
- [ ] Conferir resolução, modo de esticamento (stretch) e filtro de texturas (pixel art = `Nearest`)
- [x] Configurar o **Input Map** com as ações do GDD (nunca usar teclas fixas no código)
- [x] Instalar o addon **GUT** (AssetLib) para testes
- [x] Rodar `godot --headless --quit` sem erros
- [x] Primeiro commit: `chore: estrutura inicial do projeto`

## Etapa 5 — Arquitetura e convenções
- [x] Revisar `03-ARQUITETURA.md` (organização de cenas, autoloads, comunicação por sinais)
- [ ] Revisar e ajustar o `CLAUDE.md` (é o que o Claude Code lê em toda sessão)
- [ ] Registrar decisões importantes em `docs/decisoes/` (um arquivo por decisão)

## Etapa 6 — Planejamento do desenvolvimento
- [ ] Quebrar o MVP em marcos em `04-ROADMAP.md`
- [ ] Quebrar o primeiro marco em tarefas pequenas (1–3 horas cada)
- [ ] Definir a **primeira tarefa** a pedir ao Claude Code

## Etapa 7 — Assets (pode correr em paralelo ao desenvolvimento)
- [ ] Definir estilo visual (paleta, resolução de sprite, por exemplo 16x16 ou 32x32)
- [ ] Usar placeholders (quadrados coloridos) no início, sem esperar a arte final
- [ ] Listar fontes de assets com licença compatível (Kenney.nl, OpenGameArt, itch.io) e registrar créditos em `docs/CREDITOS.md`

---

## Como trabalhar com o Claude Code neste projeto
1. **Uma tarefa por vez**, pequena e verificável. Ex.: *"Crie o player com movimento horizontal e pulo, usando as ações `move_left`, `move_right` e `jump`."*
2. **Peça um plano antes de código** em tarefas maiores (modo plano / `shift+tab`).
3. **Teste no editor depois de cada tarefa.** O Claude não vê a tela do jogo, então descreva o que aconteceu e cole os erros do painel *Output/Debugger*.
4. **Commit a cada tarefa que funcionou.** Assim dá para desfazer facilmente quando algo der errado.
5. **Cenas complexas:** o Claude edita `.tscn` em texto, mas para layout visual (UI, tilemaps, posicionamento) costuma ser melhor você montar no editor e pedir ao Claude os scripts.
6. **Mantenha os docs atualizados:** quando uma decisão mudar, peça *"atualize o GDD e o CLAUDE.md com essa decisão"*.

## Opcional: menos pedidos de permissão no Claude Code
Crie `.claude/settings.json` na raiz do projeto com o conteúdo abaixo para liberar os comandos de verificação sem confirmação a cada uso:
```json
{
  "permissions": {
    "allow": [
      "Bash(./tools/check.sh)",
      "Bash(godot --headless:*)",
      "Bash(gdlint:*)",
      "Bash(gdformat:*)"
    ]
  }
}
```
