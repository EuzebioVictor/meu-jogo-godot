---
description: Executa uma tarefa do quadro pelo fluxo completo (planejar → implementar → testar → revisar)
argument-hint: T-NNN ou descrição da tarefa
---
Execute a tarefa **$ARGUMENTS** seguindo o fluxo de `docs/05-METODOLOGIA.md`:

1. **Preparação:** localize a tarefa em `docs/QUADRO.md`. Se ela não existir ou não atender à Definition of Ready, use o agente `produtor` para detalhá-la (e o `game-designer` se faltar spec). Mostre o plano e **aguarde minha aprovação** se a tarefa tiver mais de 3 arquivos.
2. **Implementação:** delegue ao agente do setor indicado na tarefa (`programador-gameplay`, `dev-ui`, `level-designer` ou `diretor-arte-audio`). Mova a tarefa para "Em andamento".
3. **QA:** use o agente `qa-tester` para ampliar os testes e rodar `./tools/check.sh`.
4. **Revisão:** use o agente `revisor-tecnico` no diff. Se o veredito for "MUDANÇAS NECESSÁRIAS", volte ao passo 2 (no máximo 2 ciclos e depois me consulte).
5. **Entrega:** mova a tarefa para "Revisão (aguardando teste manual)" e me mostre:
   - resumo do que foi feito
   - resultado da verificação
   - roteiro de teste manual
   - mensagem de commit sugerida

Não faça commit até eu confirmar que o teste manual passou.
