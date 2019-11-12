module projetoLogica
one sig Hotel{
	sistemaCartoes: one SistemaCartoes,
	gerente: one Gerente,
}
sig Gerente{
}

one sig SistemaCartoes{
	quartos: some Quarto
}
sig Quarto{
	cartoes: some Cartao
}

abstract sig Cartao{
	numero: Int
}
sig CartaoBloqueado extends Cartao {}
sig CartaoDesbloqueado extends Cartao{}










fact {
	all q:Quarto | #(q.cartoes) < 4
	all c:Cartao | one c.~cartoes
	all s:SistemaCartoes | some s.quartos
	all q:Quarto | one q.~quartos
}

pred show[]{
}
run show for 6
