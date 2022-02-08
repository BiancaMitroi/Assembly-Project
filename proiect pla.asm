.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc

;---------------------------------------------------------------------------

extern fscanf: proc
extern fopen: proc
extern fclose: proc
extern printf: proc
extern fprintf: proc

;---------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date

;______________________________________________________________________________________

;----------------------------------------

;mesaje
generate db "generarea codurilor", 10, 0
corectate db "corectarea codurilor", 10, 0
corect db "cod corect", 10, 0
incorect db "cod incorect", 10, 0

;----------------------------------------

;siruri de prelucrare fisiere
cod_de_generat db 33792 dup(0)
cod_generat db 33792 dup(0)
cod_de_corectat db 33792 dup(0)
cod_corectat db 33792 dup(0)

;----------------------------------------

;nume fisiere
cdg db "coduri_de_generat.txt", 0 ;coduri_de_generat
cdc db "coduri_de_corectat.txt", 0 ;coduri_de_corectat
cg db "coduri_generate.txt", 0 ;coduri_generate
cc db "coduri_corectate.txt", 0 ;coduri_corectate

;-----------------------------------------------

;pointeri catre fisiere
pcdg dd 0 ;coduri_de_generat
pcdc dd 0 ;coduri_de_corectat
pcg dd 0 ;coduri_generate
pcc dd 0 ;coduri_corectate

;-------------------------------

;moduri de deschidere fisiere
c_fis db "r", 0 ;deschidere in modul "citire"
s_fis db "w", 0 ;deschidere in modul "scriere"

;------------------------------------

;formate de citire/afisare
f_nr db "%c", 0 ;format caracter
f_s db "%s", 0 ;format sir de caractere

;-------------------------------------------

cont db -1

;___________________________________________________________________________________________

.code
start:
	;aici se scrie codul
	mov ebx, 0
;___________________________________________________________________________________________
	
;-----------------------------------------------------

; deschiderea fisierelor

;-----------------------------------------------------

; deschidere pt citire a fisierului ce contine codurile de generat	
	push offset c_fis
	push offset cdg
	call fopen
	add esp, 8
	mov pcdg, eax
	
; deschidere pt citire a fisierului ce contine codurile de corectat	
	push offset c_fis
	push offset cdc
	call fopen
	add esp, 8	
	mov pcdc, eax
	
; deschidere pt scriere a fisierului ce contine codurile generate	
	push offset s_fis
	push offset cg
	call fopen
	add esp, 8
	mov pcg, eax
	
; deschidere pt scriere a fisierului ce contine codurile corectate	
	push offset s_fis
	push offset cc
	call fopen
	add esp, 8	
	mov pcc, eax

;___________________________________________________________________________________________

;---------------------------------------------------

; copiere din fisierele de intrare in sirurile de intrare

;---------------------------------------------------



;citire_prelucrare_afisare_generari:	

	
	mov edi, -1
	mov esi, -33
	
citire:	
	add esi, 33
	mov edi, -1
citire1:
	inc edi
	lea ebx, [cod_de_generat + esi + edi]
	push ebx 
	push offset f_nr
	push pcdg
	call fscanf
	add esp, 12
	
	
	
	cmp esi, 33792
	je final1
	cmp edi, 32
	je citire
	cmp edi, 32
	jne citire1
	
final1:	
	mov ebx, 0
	mov edi, -1
	mov esi, -33
	
	push offset generate
	call printf
	add esp, 4
	
generare:
	add esi, 33
	
	mov bl, [cod_de_generat + esi]
	mov [cod_generat + esi + 2], bl
	
	mov bl, [cod_de_generat + esi + 1]
	mov [cod_generat + esi + 4], bl
	
	mov bl, [cod_de_generat + esi + 2]
	mov [cod_generat + esi + 5], bl
	
	mov bl, [cod_de_generat + esi + 3]
	mov [cod_generat + esi + 6], bl

	mov bl, [cod_de_generat + esi + 4]
	mov [cod_generat + esi + 8], bl
	
	mov bl, [cod_de_generat + esi + 5]
	mov [cod_generat + esi + 9], bl
	
	mov bl, [cod_de_generat + esi + 6]
	mov [cod_generat + esi + 10], bl
	
	mov bl, [cod_de_generat + esi + 7]
	mov [cod_generat + esi + 11], bl
	
	mov bl, [cod_de_generat + esi + 8]
	mov [cod_generat + esi + 12], bl
	
	mov bl, [cod_de_generat + esi + 9]
	mov [cod_generat + esi + 13], bl
	
	mov bl, [cod_de_generat + esi + 10]
	mov [cod_generat + esi + 14], bl
	
	mov bl, [cod_de_generat + esi + 11]
	mov [cod_generat + esi + 16], bl

	mov bl, [cod_de_generat + esi + 12]
	mov [cod_generat + esi + 17], bl
	
	mov bl, [cod_de_generat + esi + 13]
	mov [cod_generat + esi + 18], bl
	
	mov bl, [cod_de_generat + esi + 14]
	mov [cod_generat + esi + 19], bl
	
	mov bl, [cod_de_generat + esi + 15]
	mov [cod_generat + esi + 20], bl
	
	mov bl, [cod_de_generat + esi + 16]
	mov [cod_generat + esi + 21], bl
	
	mov bl, [cod_de_generat + esi + 17]
	mov [cod_generat + esi + 22], bl
	
	mov bl, [cod_de_generat + esi + 18]
	mov [cod_generat + esi + 23], bl
	
	mov bl, [cod_de_generat + esi + 19]
	mov [cod_generat + esi + 24], bl

	mov bl, [cod_de_generat + esi + 20]
	mov [cod_generat + esi + 25], bl
	
	mov bl, [cod_de_generat + esi + 21]
	mov [cod_generat + esi + 26], bl
	
	mov bl, [cod_de_generat + esi + 22]
	mov [cod_generat + esi + 27], bl
	
	mov bl, [cod_de_generat + esi + 23]
	mov [cod_generat + esi + 28], bl
	
	mov bl, [cod_de_generat + esi + 24]
	mov [cod_generat + esi + 29], bl
	
	mov bl, [cod_de_generat + esi + 25]
	mov [cod_generat + esi + 30], bl
	
	mov bl, [cod_generat + esi + 2]
	xor bl, [cod_generat + esi + 4]
	xor bl, [cod_generat + esi + 6]
	xor bl, [cod_generat + esi + 8]
	xor bl, [cod_generat + esi + 10]
	xor bl, [cod_generat + esi + 12]
	xor bl, [cod_generat + esi + 14]
	xor bl, [cod_generat + esi + 16]
	xor bl, [cod_generat + esi + 18]
	xor bl, [cod_generat + esi + 20]
	xor bl, [cod_generat + esi + 22]
	xor bl, [cod_generat + esi + 24]
	cmp bl, 0
	je generare_bit_1_0
	cmp bl, 0
	jne generare_bit_1_1
generare_bit_1_0:
	mov [cod_generat + esi], 48
	jmp urm_1
generare_bit_1_1:
	mov [cod_generat + esi], 49
urm_1:	
	
	mov bl, [cod_generat + esi + 2]
	xor bl, [cod_generat + esi + 5]
	xor bl, [cod_generat + esi + 6]
	xor bl, [cod_generat + esi + 9]
	xor bl, [cod_generat + esi + 10]
	xor bl, [cod_generat + esi + 13]
	xor bl, [cod_generat + esi + 14]
	xor bl, [cod_generat + esi + 17]
	xor bl, [cod_generat + esi + 18]
	xor bl, [cod_generat + esi + 21]
	xor bl, [cod_generat + esi + 22]
	xor bl, [cod_generat + esi + 25]
	cmp bl, 0
	je generare_bit_2_0
	cmp bl, 0
	jne generare_bit_2_1
generare_bit_2_0:
	mov [cod_generat + esi + 1], 48
	jmp urm_2
generare_bit_2_1:
	mov [cod_generat + esi + 1], 49
urm_2:	
	
	mov bl, [cod_generat + esi + 4]
	xor bl, [cod_generat + esi + 5]
	xor bl, [cod_generat + esi + 6]
	xor bl, [cod_generat + esi + 11]
	xor bl, [cod_generat + esi + 12]
	xor bl, [cod_generat + esi + 13]
	xor bl, [cod_generat + esi + 14]
	xor bl, [cod_generat + esi + 19]
	xor bl, [cod_generat + esi + 20]
	xor bl, [cod_generat + esi + 21]
	xor bl, [cod_generat + esi + 22]
	cmp bl, 0
	je generare_bit_3_0
	cmp bl, 0
	jne generare_bit_3_1
generare_bit_3_0:
	mov [cod_generat + esi + 3], 48
	jmp urm_3
generare_bit_3_1:
	mov [cod_generat + esi + 3], 49
urm_3:	
	
	mov bl, [cod_generat + esi + 8]
	xor bl, [cod_generat + esi + 9]
	xor bl, [cod_generat + esi + 10]
	xor bl, [cod_generat + esi + 11]
	xor bl, [cod_generat + esi + 12]
	xor bl, [cod_generat + esi + 13]
	xor bl, [cod_generat + esi + 14]
	xor bl, [cod_generat + esi + 23]
	xor bl, [cod_generat + esi + 24]
	xor bl, [cod_generat + esi + 25]
	cmp bl, 0
	je generare_bit_4_0
	cmp bl, 0
	jne generare_bit_4_1
generare_bit_4_0:
	mov [cod_generat + esi + 7], 48
	jmp urm_4
generare_bit_4_1:
	mov [cod_generat + esi + 7], 49
urm_4:	
	
	mov bl, [cod_generat + esi + 16]
	xor bl, [cod_generat + esi + 17]
	xor bl, [cod_generat + esi + 18]
	xor bl, [cod_generat + esi + 19]
	xor bl, [cod_generat + esi + 20]
	xor bl, [cod_generat + esi + 21]
	xor bl, [cod_generat + esi + 22]
	xor bl, [cod_generat + esi + 23]
	xor bl, [cod_generat + esi + 24]
	xor bl, [cod_generat + esi + 25]
	cmp bl, 0
	je generare_bit_5_0
	cmp bl, 0
	jne generare_bit_5_1
generare_bit_5_0:
	mov [cod_generat + esi + 15], 48
	jmp urm_5
generare_bit_5_1:
	mov [cod_generat + esi + 15], 49
urm_5:	
	cmp esi, 33792
	jne generare



	mov ebx, 0
	mov edi, -1
	mov esi, -33
afisare:
	add esi, 33
	mov edi, -1
	
	push 10
	push offset f_nr
	call printf
	add esp, 8
	
	push 10
	push offset f_nr
	push pcg
	call fprintf
	add esp, 8
	
afisare1:
	inc edi
	mov bl, [cod_generat + esi + edi]
	
	push ebx
	push offset f_nr
	call printf
	add esp, 8
	
	push ebx
	push offset f_nr
	push pcg
	call fprintf
	add esp, 8
	
	
	cmp esi, 33792
	je final
	cmp edi, 32
	je afisare
	cmp edi, 32
	jne afisare1
	
final:
	

	
;___________________________________________________________________________________________

;--------------------------------------------------

; corectarea codurilor

;--------------------------------------------------
	
	mov ebx, 0
	mov edi, -1
	mov esi, -33
	
citire2:	
	add esi, 33
	mov edi, -1
	cmp esi, 33792
	je final2
citire21:
	inc edi
	lea ebx, [cod_de_corectat + esi + edi]
	push ebx 
	push offset f_nr
	push pcdc
	call fscanf
	add esp, 12
	sub [cod_de_corectat + esi + edi], 48
	
	;cmp esi, 33792
	;je final21
	cmp edi, 32
	je final21
	cmp edi, 32
	jne citire21
	
final21:	
	;mov ebx, 0
	;mov edi, -1
	;mov esi, -33
	
	; push offset corectate
	; call printf
	; add esp, 4
	
	;mov ebx, 0
	
et:
	mov edi, 1
	
corectare:
	;add esi, 33
	inc edi
	mov ebx, 0
	;mov eax, 2
	mov bl, [cod_de_corectat + esi + 2]
	xor bl, [cod_de_corectat + esi + 4]
	xor bl, [cod_de_corectat + esi + 6]
	xor bl, [cod_de_corectat + esi + 8]
	xor bl, [cod_de_corectat + esi + 10]
	xor bl, [cod_de_corectat + esi + 12]
	xor bl, [cod_de_corectat + esi + 14]
	xor bl, [cod_de_corectat + esi + 16]
	xor bl, [cod_de_corectat + esi + 18]
	xor bl, [cod_de_corectat + esi + 20]
	xor bl, [cod_de_corectat + esi + 22]
	xor bl, [cod_de_corectat + esi + 24]
	cmp bl, [cod_de_corectat + esi]
	je corectare_bit_1_0
	cmp bl, [cod_de_corectat + esi]
	jne urm_21
corectare_bit_1_0:
	inc bh
urm_21:	
	
	mov bl, [cod_de_corectat + esi + 2]
	xor bl, [cod_de_corectat + esi + 5]
	xor bl, [cod_de_corectat + esi + 6]
	xor bl, [cod_de_corectat + esi + 9]
	xor bl, [cod_de_corectat + esi + 10]
	xor bl, [cod_de_corectat + esi + 13]
	xor bl, [cod_de_corectat + esi + 14]
	xor bl, [cod_de_corectat + esi + 17]
	xor bl, [cod_de_corectat + esi + 18]
	xor bl, [cod_de_corectat + esi + 21]
	xor bl, [cod_de_corectat + esi + 22]
	xor bl, [cod_de_corectat + esi + 25]
	cmp bl, [cod_de_corectat + esi + 1]
	je corectare_bit_2_0
	cmp bl, [cod_de_corectat + esi + 1]
	jne urm_22
corectare_bit_2_0:
	inc bh

urm_22:	
	
	mov bl, [cod_de_corectat + esi + 4]
	xor bl, [cod_de_corectat + esi + 5]
	xor bl, [cod_de_corectat + esi + 6]
	xor bl, [cod_de_corectat + esi + 11]
	xor bl, [cod_de_corectat + esi + 12]
	xor bl, [cod_de_corectat + esi + 13]
	xor bl, [cod_de_corectat + esi + 14]
	xor bl, [cod_de_corectat + esi + 19]
	xor bl, [cod_de_corectat + esi + 20]
	xor bl, [cod_de_corectat + esi + 21]
	xor bl, [cod_de_corectat + esi + 22]
	cmp bl, [cod_de_corectat + esi + 3]
	je corectare_bit_3_0
	cmp bl, [cod_de_corectat + esi + 3]
	jne urm_23
corectare_bit_3_0:
	inc bh
urm_23:
	
	mov bl, [cod_de_corectat + esi + 8]
	xor bl, [cod_de_corectat + esi + 9]
	xor bl, [cod_de_corectat + esi + 10]
	xor bl, [cod_de_corectat + esi + 11]
	xor bl, [cod_de_corectat + esi + 12]
	xor bl, [cod_de_corectat + esi + 13]
	xor bl, [cod_de_corectat + esi + 14]
	xor bl, [cod_de_corectat + esi + 23]
	xor bl, [cod_de_corectat + esi + 24]
	xor bl, [cod_de_corectat + esi + 25]
	cmp bl, [cod_de_corectat + esi + 7]
	je corectare_bit_4_0
	cmp bl, [cod_de_corectat + esi + 7]
	jne urm_24
corectare_bit_4_0:
	inc bh	

urm_24:
	
	mov bl, [cod_de_corectat + esi + 16]
	xor bl, [cod_de_corectat + esi + 17]
	xor bl, [cod_de_corectat + esi + 18]
	xor bl, [cod_de_corectat + esi + 19]
	xor bl, [cod_de_corectat + esi + 20]
	xor bl, [cod_de_corectat + esi + 21]
	xor bl, [cod_de_corectat + esi + 22]
	xor bl, [cod_de_corectat + esi + 23]
	xor bl, [cod_de_corectat + esi + 24]
	xor bl, [cod_de_corectat + esi + 25]
	cmp bl, [cod_de_corectat + esi + 15]
	je corectare_bit_5_0
	cmp bl, [cod_de_corectat + esi + 15]
	jne urm_25
corectare_bit_5_0:
	inc bh
urm_25:	
	cmp bh, 5
	je cod_corect
	cmp bh, 5
	jne urmat
cod_corect:

	push offset corectate
	push offset f_s
	call printf
	add esp, 8
	
	mov ebx, 0
	mov edi, -1
afisare3:
	
	push 10
	push offset f_nr
	call printf
	add esp, 8
afisare13:
	inc edi
	add [cod_de_corectat + esi + edi], 48
	mov bl, [cod_de_corectat + esi + edi]
	
	push ebx
	push offset f_nr
	call printf
	add esp, 8
	
	push ebx
	push offset f_nr
	push pcc
	call fprintf
	add esp, 8
	
	cmp edi, 32
	je final3
	cmp edi, 32
	jne afisare13
	
final3:
	
	jmp comp_1
urmat:
	
	cmp edi, 3
	jne schimbare
	cmp edi, 3
	je corectare
	cmp edi, 7
	jne schimbare
	cmp edi, 7
	je corectare
	cmp edi, 15
	jne schimbare
	cmp edi, 15
	je corectare
	cmp edi, 32
	je et
	
schimbare:
	cmp [cod_de_corectat + esi + edi], 0
	je s0_1
	cmp [cod_de_corectat + esi + edi], 0
	jne s1_0
	
s0_1:
	mov [cod_de_corectat + esi + edi], 1
	jmp corectare
	
s1_0:
	mov [cod_de_corectat + esi + edi], 0
	jmp corectare
	

comp_1:	
	cmp esi, 33792
	jne citire2
	
final2:	
	
;-----------------------------------------------------
	
; inchiderea fisierelor

;-----------------------------------------------------

; inchiderea fisierului ce contine codurile de generat	

	push pcdg
	call fclose
	add esp, 4
	
; inchiderea fisierului ce contine codurile de corectat	

	push pcdc
	call fclose
	add esp, 4	
	
; inchiderea fisierului ce contine codurile generate	

	push pcg
	call fclose
	add esp, 4
	
; inchiderea fisierului ce contine codurile corectate	

	push pcc
	call fclose
	add esp, 4	
	
;___________________________________________________________________________________________
	
	;terminarea programului
	push 0
	call exit
end start