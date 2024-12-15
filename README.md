# Godot2DPlatformer Godot 4.3
## Criando o player
- Organizamos o projeto e os assets
- par ficar mais pixelado, em Projeto>project Settings>Renderizando>texturas mudamos de linear para nearest  
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
- por fim, para que a câmera acompanhe nosso playe, vamos mover ela para dentro do player da cena `Game` e ajustar o precision smoothing para 5px. Na cena `Player`fui na raiz(Charactebody2D) e  ajustei o canvasitem para o ordering z index 5, assim o personagem nao fica atrás das árvores. 

##Plataformas
-criaremos uma nova cena do tipo `AnimatedBody2d`
-adicionaremos um no do tipo Sprite2D e vamos arrastar nosso platforms.png e arrastaremos até o texture do nosso inspector
- no inspector vamos em region>enabled>edit regione vamos escolher somente a área do sprite que desejamos
-adicionaremos um no do tipo ColisionShape2D, com área retangular e habilitar one way colision para permitir que entremos por baixo da plataforma 
-vamos renomear para Platform e abrimos a cena Game 
- abrimos a cena Game e, do FileSystem, arrastamos nossa plataforma para onde quisermos
- para uma das plataformas adicionamos um AnimationPlayer para ela se mover e adicionamos uma nova animação platform_move-vertical1
- Voltamos ao nó da plataforma na cena Game (Platform2, após ter clicado em AnimationPlayer) 
- Vamos ver que na parte de baixo há um controle de animação no instante 0
- colocamos a plataforma em uma posição inicial e, no inspetor>Node2D>Transform>Position apertamos a chave(key), 
- mudamos o controle de animação para o instante 1, mudamos a posição da plataforma e também clicamos na chave
- no  controle de animação marcamos para auto-reproduzir, ajustamos o tempo e na parte ao lado do tempo colocamos para ir e voltar
- ajustamos também o temo de  movimento

## itens coletáveis
- nova cena, um novo no do tipo area2D -> usamos esse quando não queremos que colida com algo, mas detecte a colisão
- adicionamos um AnimatedSprite2d
- inspetor>animation>sprite frame> novo sprite frame
- assim como no personagem, na parte inferior da tela , em `quadros de animação`vou em `adicionar quadros de uma folha de sprite`, o simbolo de quadriculado mas edito para 12X1
- colocamos a animação para rodar automaticamente
- adicionamos um colisionshape2d circular
- arrastamos as moedas para nossa cena `Game` ctrl+d para duplicar
- para que a moeda se torne coletável devemos adicionar um script
- para esse script vamos usar o conceito de signal, ou seja, o item só executa algo quando detecta o sinalda presença do player
- mantendo o script aberto e clicando em nossa area2D (coin) encontramos todos os sinais disponíveis
- adicionaremos o sinal _on_body_entered e no nosso Player vamos mudar o Layer dele para 2 (Character body 2d, Collision, layer)
- em Coin alteramos o Mask para 2 e adicionamos a função queue_free() para remover a cena (coin) sempre que nosso personagem colidir com a moeda

## morrendo   
- Primeiramente em nossa cena `Game` vamos estabelecer um limite inferior para nossa camera
- clicando no símbolo do esquadro conseguimos ver que a distancia entre nossa linha central e o fundo é de menos de 150px
- portanto em camera2D>Limit>Bottom colocamos 150a px e smooted ativo. agora a câmera não nos acompanha ao infinito.
- agora vamos criar uma killzone. vamos criar uma Área2D chamada Killzone com Colision>Mask em 2
- nela adicionamos um colisionShape 2d do tipo worldBoundary 
- arrastamos nossa killzone para `Game`
- em killzone vamos criar um script e um novo no do tipo Timer, configurada para 0,6s e one shot
- se clicarmos em Timer, arrastarmos para o killzone.gd e soltarmos enquanto seguramos ctrl ele ja traz como varíável
- em `_on_body_entered`adicionamos um timer.start()
- clickando em timer, dentro da cena killzone, com o killzone.gd aberto, podemos ver o método `_on_timer_timeout`. Criamos ele
- quando morrer, queremos recarregar a cena que estiver rodando. Logo na função `_on_timer_timeout` adicionamos `get_tree().reload_current_scene()`


##organizando os elementos e expandindo
- Dentro da nossa cena `game` criamos um nó2d para armazenar as moedas e outro somente para as plataformas, para deixar o código mais organizado
- ajustamos nosso TileMap em dois layers (Back e mid) e colocamos o back para renderizar primeiro. assim separamos em camadas nosso mapa
- usamos a ferramenta de retêngulo par pintar múltiplos Yiles de uma vez

## Inimigo
- vamos criar uma nova cena como no2d simples e adicionar nele um aniatedSprite2d, incluindo o sprite do inimigo
- ajustamos para 4x3 e selecionamos a linha do meio para criar a animação idle
- como já temos uma killzone configurada, podemos clicar com o  direito e duplicar ela, salvando como killzone_enemy.
- na nova cena killzone_enemy apagamos o colision shape e importamos ela para dentro do enemy_slime_green
- dentro do enemy_slime_green colocamos outro colision shpe 2d, dessa vez retangular, do tamanho do slime
- adicionamos o inimigo na cena para testar e vemosque ele morre ao tocar
- vamos adicionar movmento. podemos fazer isso com animação ou com script. vamos fazer com script.
- a função _ready() roda uma única vez, quando inicia a cena. _process() roda todo frame. delta é o tempo entre o frame atual e o anterior
- usar delta é uma boa maneira de compensar o movimento com relação ao framehate
- criamos uma constante SPEED 60 (60 pixels por segundo) par usar na função de movimentação junto com delta
- criaremos uma variável para direção, que vai ser sempre 1 ou -1 (mudança de direção)
- queremos que nosso inimigo se movimente entre 2 paredes e, ao colidir, mude de direção
- para isso usaremos um detector de colisão chamado raycast2d e vamos trazer ele para o código. nossa direçao mudará de acordo com o sinal dele
- na hora de trazer os raycast pro script, nao se esquecer de segurar ctrl ao soltar, ai ja cria as variáveis
- trazer da mesma forma o AnimatedSprite2d pois ela tem a propriedade fliph, que faz com que o objeto gire no seu eixo

## ajustes no player
- de forma semelhante, pusemos no script do player adicionar o fliph para ele mudar a posição
- na cena killzone vamos ajustar o script para termos um efeito de morte. 
- quando a killzone detectar um corpo entrando ela vai alterar as propriedades de tempo, fazendo passar mais devagar. 
- vamos tb remover a colisão desse body(nosso player) para dar efeito de queda e fazer executar uma animação de morte que criamos no player

## mais ajustes
- vamos mudar um pouco algumas das ações do player. para isso godot usa o conceito de actions
- project -> project settings -> input map (mapa de entrada): aqui podemos  cadastrar as ações de personagens
- vamos adicionar 3 ações: jump, move_left e move_right
- com as ações cadastradas, ao clicar no botão de `+` de cada ação podemos atribuir uma tecla
- cadastramos a ação de pular e andar
- em nosso código, vamos substituir os argumentos dos nossos `Inputs` pelas ações cadastradas
- no nosso player, em `AnimatedSprite2D` vamos adicionar a animação de correr e pular
- dentro dos gdScript de killzone e player criamos uma forma adequada de renderizar as animações, sem sobreposição
- em killzone não mais apagamos a colisão, apenas desabilitamos ela