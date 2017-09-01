module Menu (menu) where

import System.IO
import Control.Monad

menu :: IO()
menu = do { putStrLn "BEM-VINDO AO PRESIDENTE";
        putStrLn "1 - Numero de participantes";
        putStrLn "3 - Quero sair do jogo";
        opcao <- getLine;
        case opcao of "1" -> primeiroSubMenu;
                			"2" -> segundoSubMenu;
	}

primeiroSubMenu :: IO()
primeiroSubMenu = do { putStrLn "Informe a quantidade de pessoas que participarao do jogo";

          putStrLn "1 - 3 pessoas";
          putStrLn "2 - 4 pessoas";
  	      putStrLn "3 - 5 pessoas";
          putStrLn "4 - 6 pessoas";
          putStrLn "5 - 7 pessoas";
          putStrLn "6 - 8 pessoas";
          putStrLn "7 - Voltar ao menu";
          opcao <- getLine;
          case opcao of "1" -> putStrLn "O jogo sera com um trio";
                  			"2" -> putStrLn "O jogo sera com um quarteto";
                        "3" -> putStrLn "O jogo sera com um quinteto";
                        "4" -> putStrLn "O jogo sera com um sexteto";
                        "5" -> putStrLn "O jogo sera com um hepteto";
                        "6" -> putStrLn "O jogo sera com um octeto";
                  			"7" -> menu
  	}

segundoSubMenu :: IO()
segundoSubMenu = do { putStrLn "Voce sera desconectado ao jogo...";

              opcao <- getLine;
              case opcao of
                            "7" -> menu
        }
