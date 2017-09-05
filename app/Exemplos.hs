-- Bem-vindo!

-- Neste arquivo mostraremos alguns exemplos das funções desenvolvidas para o jogo Presidente, na disciplina Paradigmas de Programação.

-- Na Main, o Jogo é iniciado com 5 Jogadores: Stefânia, Thiago, Matheus, Milene e Matheus.

-- Primeiramente, vamos distribuir as cartas aos jogadores:

playersDecks = giveCardsToPlayers playerQueue getNewDeck 

-- A pilha de cartas do jogo pode ser iniciada vazia:

gameStack = createStack []

-- O primeiro jogador é selecionado:

slipPlayers = queuePop playersDecks
nextPlayer = fst (slipPlayers)
newPlayersDecks = snd slipPlayers

-- É verificado se a pilha de cartas do jogo está vazia, se sim, o jogador pode jogar qualquer carta, se não, as cartas dele serão filtradas, apenas as que podem ser jogadas serão exibidas.

-- Para usar como exemplo, vamos colocar uma carta inicial na pilha.

newCard = parseCard "3H"
newGameStack = stackPush newCard gameStack

-- Agora temos um 3 de Copas na pilha do jogo. Vamos copiá-la do topo, pegar o deck do jogador atual, e filtrar as cartas do mesmo usando a função getElegibleCards

topCard = fst (stackPop newGameStack)
actualPlayerDeck = getPlayerDeck nextPlayer
playerElegibleCards = getElegibleCards topCard actualPlayerDeck

-- O jogador escolhe a carta que deseja jogar. Digamos que no exemplo ele escolheu a carta 8S

choosedCard = parseCard "8S"
getCard = getCardFromDeck choosedCard actualPlayerDeck

-- Agora atualizamos o stack do jogo:

pushedCard = fst getCard
gameStack = stackPush pushedCard newGameStack

-- Atualizamos o deck do jogador atual, e, caso o jogador tenha cartas, o colocamos de volta na fila de jogadores. O jogo continua até que a fila exista.
