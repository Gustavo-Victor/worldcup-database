# Worldcup Database

## Tabela de conteúdos

* [Sobre](#sobre)
* [Tecnologias e ferramentas](#tecnologias-e-ferramentas)
* [Pré-requisitos](#pré-requisitos)
* [Instalação](#instalação)
* [Licença](#licença)

<hr/>


## Sobre

O projeto consiste de dois arquivos .sh, um que serve para inserir informações no banco de dados postgreSQL partindo de um arquivo .csv chamado 'games.csv' e outro que serve para fazer consultas SELECT para trazer informações filtradas e agrupadas das tabelas do banco.

Esse projeto serve para fins didáticos e é mais um desafio de um dos módulos do curso de [bancos de dados relacional](https://www.freecodecamp.org/learn/relational-database/) da freeCodeCamp. [Link para a página do desafio](https://www.freecodecamp.org/learn/relational-database/build-a-world-cup-database-project/build-a-world-cup-database).  


## Tecnologias e ferramentas

- [Bash Scripting](https://ryanstutorials.net/bash-scripting-tutorial/)
- [PostgreSQL](https://www.postgresql.org/)
- [VSCode](https://code.visualstudio.com/)


## Pré-requisitos  

Para consequir entender os códigos do projeto você precisa ter conhecimentos básicos de shell / bash scripting e também em SQL usando o SGBDR PostgreSQL. Além disso, para conseguir fazer a instalação e execução do projeto você precisa ter o [GIT](https://git-scm.com/) e o [PostgreSQL] instalado e configurado na sua máquina. Abaixo vão alguns links que podem ajudar na instalação e configuração do PostgreSQL na sua máquina 

- [Instalação no Windows](https://www.devmedia.com.br/instalando-postgresql/23364)
- [Instalação em distros Linux .deb](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart-pt)
- [Instalação em Fedora e CentOS/RHEL ](https://pt.linux-console.net/?p=1963#gsc.tab=0)
- [Instalação no Mac](http://groselhas.maurogeorge.com.br/instalando-o-postgresql-no-mac-os-com-o-homebrew.html#sthash.tLtoK0Or.dpbs)

Para mais informações e documentação consulte sempre o [site oficial](https://www.postgresql.org/download/) 


## Instalação 

Antes de partir para a instalação, é importante saber que os passos a seguir podem não funcionar em todos os sistemas operacionais (principalmente se não for um sistema baseado em Unix). 

1. Faça download ou clone o projeto na sua máquina local.  

2. Descompacte e abra a pasta do projeto no terminal.  

3. Faça login como usuário postgres e insira a senha do seu usuário (se sua máquina for uma distro Linux ou sistema baseado em Unix).  

```bash
    sudo su postgres
```

4. Importe o banco de dados do arquivo [worldcup.sql](./worldcup.sql). Para isso, você deve estar logado como usuário postgres. 


```bash
    psql -U postgres < worldcup.sql
```

5. Como usuário postgres, execute primeiro o arquivo [insert_data.sh](./insert_data.sh) para inserir informações no banco. 

```bash
    ./insert_data.sh
```

6. Execute o arquivo [./queries.sh](./queries.sh). A saída desse comando deve ser igual ao conteúdo do arquivo [./expected_output.txt](./expected_output.txt)
 

<hr/>

## Licença 

O projeto está sob a licença do [MIT](./LICENSE)

Qualquer pessoa pode usar e contribuir com o projeto. 


