# Meu Jogo (nome provisório)

Projeto Godot 4 desenvolvido com auxílio do Claude Code.

## Requisitos
- Godot **4.7.2-stable** (versão padrão, não a .NET): https://godotengine.org/download
- Python + `pip install "gdtoolkit==4.*"` (lint/format, opcional)
- Claude Code

## Rodar
- Editor: Godot → *Importar* → `project.godot` → F5
- Verificação completa (erros + lint + testes): `./tools/check.sh`
  (se o Godot não estiver no PATH: `GODOT=/caminho/do/godot ./tools/check.sh`)

## Por onde começar
1. Leia `docs/00-ROTEIRO-PREPARACAO.md`: é o checklist da fase de preparação.
2. Preencha os documentos de `docs/` na ordem numérica.
3. Veja `docs/05-METODOLOGIA.md` e `docs/06-SETORES.md` para entender o fluxo com os agentes.
4. Acompanhe o andamento em `docs/QUADRO.md` (ou com `/status` no Claude Code).
5. Só passe para o desenvolvimento quando o checklist estiver completo.

## Estrutura
| Pasta | Conteúdo |
|---|---|
| `docs/` | Design, escopo, arquitetura, roadmap e decisões |
| `assets/` | Arte, áudio, fontes, shaders (arquivos brutos importados) |
| `scenes/` | Cenas `.tscn`: main, levels, ui, actors |
| `scripts/` | GDScript: autoloads, componentes, resources customizados |
| `tests/` | Testes automatizados (GUT) |
| `addons/` | Plugins do Godot (GUT 9.7.1) |
| `tools/` | Scripts de verificação |
| `.claude/agents/` | Agentes por setor (produtor, designer, programador, UI, level, arte/áudio, QA, revisor) |
| `.claude/commands/` | Comandos `/tarefa`, `/verificar`, `/status`, `/sprint` |
