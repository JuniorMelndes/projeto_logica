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
abstract sig Quarto{
}

abstract sig Cartao{
	numero: Int
}
sig CartaoBloqueado in Cartao {}
sig CartaoDesbloqueado in Cartao{}
sig QuartoOcupado in Quarto{ cartoesValidos: some Cartao}
sig QuartoDesocupado in Quarto{}

fact {
	
	all s:SistemaCartoes | some s.quartos
	all q:Quarto | one q.~quartos
	all q:Quarto | q in QuartoDesocupado => (q not in (QuartoOcupado))
	all q:QuartoOcupado | #(q.cartoesValidos) < 4
	all q:Quarto | q in QuartoDesocupado or q in QuartoOcupado
	all c:Cartao | c in CartaoBloqueado => (c not in (CartaoDesbloqueado))
	all c:Cartao | c in CartaoBloqueado or c in CartaoDesbloqueado
}

pred show[]{
}
run show for 6
