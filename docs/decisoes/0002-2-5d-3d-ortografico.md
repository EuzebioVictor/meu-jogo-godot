# 0002 — 2.5D isométrico em 3D com câmera ortográfica

- **Data:** 2026-11-08
- **Status:** aceita (decisão do diretor criativo)

## Contexto
O jogo é um Action RPG 2.5D isométrico com cidades vivas (NPCs com rotina, ciclo dia/noite), prédios em vários níveis, morros e combate em tempo real. Opções avaliadas: 2D isométrico com sprites/TileMap ou 3D com câmera ortográfica.

## Decisão
Mundo, física e navegação em **3D**, com `Camera3D` em projeção **ortográfica**, ângulo isométrico fixo.

## Consequências
- ✅ Altura (morros, sobrados, cais) e colisão naturais; ciclo dia/noite com iluminação real; oclusão de prédios tratável (fade/corte de paredes).
- ✅ Animação de personagens reaproveitável em qualquer direção (sem desenhar 4–8 direções de sprite).
- ⚠️ Pipeline de arte em 3D (low-poly ou personagens em sprite sobre cenário 3D, ainda a definir).
- ⚠️ O projeto base atual é 2D. É preciso uma tarefa para migrar: camadas `3d_physics`, fase placeholder em `Node3D`, câmera isométrica, filtro de textura.
