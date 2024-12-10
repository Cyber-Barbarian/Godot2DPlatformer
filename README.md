# Godot2DPlatformer Godot 4.3
## Criando o player
- Organizamos o projeto e os assets
- Criamos uma primeira cena: um simples nó 2d chamado `Game`
- Criamos uma outra cena chamada `Player`
- Nela adicionamos um `AnimatedSprite2D`
- Na aba `inspetor` vamos em `animation>SpriteFrame>NovoSpriteframe`
- Na parte inferior da tela , em `quadros de animação`vou em `adicionar quadros de uma folha de sprite`, o simbolo de quadriculado
- Acesso a folha de sprites para knight e mudo para 8x8, escolho os 4 prmeiros
- Aumento o fps da animação, marco auto-reproduzir e ajusto o boneco com pé na posição 0,0
- Crio um ColisionShape2D ve ajusto a colisão circular um pouco menor que o boneco

## Carregando o player
- voltamos para nossa cena de `Game` e arrastamos e soltamos nosso player nela
- criamos em `Game`uma `Camera2D`e damos um zoom de 4 vezes e centralizamos ela no `player`

##Movimentos
- em player vamos criar um script baseado no Template pronto de movimento
- se rodarmos nosso player cai pois não há chão para colisã- para fins de debug, em game vamos criar um `StaticBody2D`
- em `StaticBody2D` vamos adicionar um `ColisionShape2D` do tipo `WorldBoundary2d` e colocar ele como um chão abaixo do personagem
- Já conseguimos correr e pular, mas vamos ajustar a velocidade

## Mundo
- Para criar nosso `Tile Map` precisamos de um `Tile Set`contendo as texturas do terreno
- vamos deletar o nosso `StaticBody2d` e criar um `TileMap` na cena `Game`
- No inspetor, em `Tile set` vamos colocar `Novo TileSet` eclicar nele
- Na parte inferior, vamos clicar na aba `TileSet` e arrastar nosso `World_tileset.png` e marcar a criação automática de tiles
- Nosso tilemap está tratado como uma folha 16X16. cada quadratinho será um bloco.
- para usar um bloco grande, como por exemplo o topo da palmeira por inteiro,  clicamos na borracha e selecionamos os blocos a "apagar" em todos os blocos da copa da árvore. 
- depois apertamos shift e reselecionamos os mesmos blocos e fica como um só
- agora basta mudar para a cena, clicar em pintar e montar o nível
- botao esquerd para desenhar e direito para apagar
- clique no tile desejado e clique na tela. é possível selecionar vários tiles de uma vez
- após desenhar, precisamos adicionar a física em nosso mundo
- no nosso tilemap,no inspetor, vamos em Phisics layer e criamos um novo layer
- voltamos ao `tileset`, em `pintar` colocamos o phisics layer sobre os tiles que quisermos
- se pintarmos algum errado, basta clicar nos tres pontinhos do tile e limpar. aí clica sobre o tile que se quer limpar (atalho c)
- quando o formato do objeto é bem específico, como a ponte, podemos ajustara física ao formato
- por fim, para que a câmera acompanhe nosso playe,, vamos mover ela para dentro do player da cena `Game` e ajustar o precision smoothing para 5px. no player da cena `game` ajustei o canvasitem para topLevel, assim o personagem nao fica atrás das árvores. 
