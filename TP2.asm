.data

message: .asciiz "\nValor �: "
quebra: .asciiz "\n"
traco: .asciiz "-"

.text
addi $s0, $zero, 24 #adicionando os valores ao registrador
addi $s1, $zero, 45
addi $s2, $zero, 0

for: #La�o for para realiza��o dos c�lculos
addi $t0, $zero, 0 #i = 0
beq $s0, 1, saida #$s0 == 1
addi $s4, $zero, 2 #Registrador que recebe o valor 2 para divis�o
div $s0, $s0, $s4 #Divis�o por 2
add $s1, $s1, $s1 #Multiplica��o por 2
li $v0, 4 #Codigos para formata��o do texto a ser imprimido
la $a0, quebra	
syscall
li $v0, 1
move $a0, $s0
syscall
li $v0, 4
la $a0, traco	
syscall
li $v0, 1
move $a0, $s1
syscall
verificaPar: #La�o IF para verificar o valor par
li $t2, 2
div $s0, $t2
mfhi $t1
beq $t1, 0, saidaIf
add $s2, $s2, $s1 #Soma dos valores que s�o �mpares
saidaIf:
addi $t0, $t0, 1 #i++
j for
saida:
li $v0, 4 #Imprime a mensagem
la $a0, message	
syscall 
li $v0, 1 #Imprime o valor correto
move $a0, $s2
syscall

#Primeiramente eu construi esse problema na linguagem C, e logo depois come�ei a passar para MIPS,
#assim ficou mais f�cil a compreens�o da atividade. Foi realizada consultas em outros c�digos MIPS passados pelo professor
#Edson Luiz Barbosa 21.1.8145

