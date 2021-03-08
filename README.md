# Gitall

Gitall is a git cli that helps when there is a need to run the same git command in multiple git repositories

## ESCRIPT

See [Elixir School](https://elixirschool.com/en/lessons/advanced/escripts) for more information about escript.

To compile the executable `mix escript.build` a file called `gitall` will appear in the  root folder.

You can call this file by `./gitall` on the root folder
You can also pass parameter to it.

If you call `./gitall --h` you will get a help on how to use it.


# TODO:

## Não precisar de aspas para mandar o comando git 

### Exemplo: 

    gitall . git reset --hard
## Aceitar diversos comandos GIT de uma só vez 

### Exemplo: 

    gitall . "git reset --hard && git pull --rebase"

## Colocar cores nos retorno. 

### Exemplo:

    Erros em vermelho e Sucessos em verde, Git repositóries em branco

    Dica: Não será possível usando escript (até onde eu sei).




