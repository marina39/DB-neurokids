> # PROJETO NEUROKIDS

> ## Descrição da empresa

Clínica de reabilitação neurofuncional para crianças e adolescentes a partir de 4 anos.
Os pacientes comparecem semanalmente à clínica para terapias previamente indicadas.
Por se tratarem de pacientes menores de idade, as decisões são tratadas com o(s) responsável(is) por esta.

> ### Demanda

Necessidade de um banco de dados para armazenar informações.

> #### Projeto via banco de dados MySQL

Entitades:

#### Pacientes

Atributos: nome, sobrenome, data de nascimento, cpf, cns, genero, cid, endereço.
> Apesar de alguns atributos não serem necessários na demanda atual, são informações importantes para a empresa em outras requisições e podem servir de demanda em breve.

> O endereço será tratado como uma entidade separada, pois posteriormente pode ser usada em análises regionais ou até mesmo transformada em um db NoSQL para maior eficiência.

> As informações dos responsáveis são essenciais para tomada de decisões como horários dos atendimentos. Um paciente pode ter vários responsáveis, e um responsável pode ter mais de um paciente na clínica, resultando em um relacionamento n-n. 

> Como um paciente pode ter várias terapias, e uma terapia pode ter vários pacientes, aqui aparece mais um relacionamento n-n.

> É necessário criar também entidades de agenda e marcações.

> Atributos finais dos pacientes:
* id
* nome
* cpf
* cns
* genero
* cid
* endereço

Aqui poderia usar o cpf como index, porém nem todos pacientes tem esse documento e o CNS também é um número único por pessoa, porém ele pode ser alterado pelo SUS, então mantenho o uso de id como index.

#### Responsáveis

Por se tratar de uma relação n-n aqui serão necessárias 2 tabelas (na prática 3): paciente - ligação - responsável.

> Responsável:
* id
* Nome
* cpf

Novamente o cpf poderia ser usado como index, mas nem todos responsáveis apresentam esse documento.

> Ligação:
* id do paciente
* id do responsável

A visualização não fica lá essas coisas com esse tipo de tabela, então a ideia é fazer uso de uma view, sendo atualizada dinamicamente com uso de triggers.

##### Contato

1 responsável pode ter vários contatos, criando um relacionamento de 1-n. 
A empresa tem preferencia por contato via WhatsApp, mas também são aceitos outros tipos, então usarei um tipo enum para isso e para exibição criarei prioridade de exibição.

> Contato:
* id
* Número de telefone
* Tipo de telefone (lista enum)
* id do responsável

>> Obs.: incluir 1 contato na view do responsável.

### Profissionais

Relacionamento n-n com pacientes, então: paciente - ligação - profissional

> Profissional:
* id
* Nome
* Sobrenome
* Tipo de terapia (id)

> Ligação:
* Paciente (id)
* Profissional (id)

> Terapias
* id
* terapia

Importante criar uma view com pacientes sem profissional vinculado, com visualização para a coordenação.

### Agenda

Cada profissional deve ter uma agenda, porém o coordenador pode criar uma agenda de uma terapia sem profissional vinculado, pois a demanda pode ser maior que a oferta.

> Agenda
* id
* Terapia (id)
* Profissional (id)
* Horários

>> ***Ideia para o futuro: gera grande repetição na tabela de terapia e profissional. Projeto futuro: trabalhar essa parte com NoSQL de Grapho.***

> Marcações
* Profissional (id)
* Horários (id)
* Paciente (id)

A partir daqui é necessário uma aplicação para gerar uma aplicação web dinâmica com senha baseado no perfil:
* Coordenação: acesso ao quadro e ao espelho
* Recepção: acesso ao quadro.
* Profissionais: acesso a sua propria agenda, de preferencia mobile.

