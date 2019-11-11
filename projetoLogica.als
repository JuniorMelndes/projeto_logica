module projetoLogica

one abstract sig SistemaCartoes{}

sig CartaoBloqueado in SistemaCartoes {}
sig CartaoDesbloqueado in Sistema Cartoes{}
sig QuartoAlugado in SistemaCartoes{}

one sig Hotel{
	sistemaCartoes: one SistemaCartoes,
	gerente: one Gerente,
	quarto: some Quarto
}

sig Gerente{
}

sig Quarto{
	cartao: some Cartao,
	numero: Int
}

sig Cartao{
	numero: Int
}

fact{all q:Quarto | #(q.cartao) < 4}
