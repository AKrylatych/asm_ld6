TITLE MASM Template						(main.asm)

;Įrašymas iš klaviatūros vykdomas tol, 
;kol bus paspaustas E klavišas. 
;Programa turi suskaičiuoti 
;kiek kartų buvo įvesta balsė 
;ir atsakymą pakartoti tiek kartų 
;koks vienženklis skaičius, nuradantis 
;kartojimų kiekį, buvo įrašytas 
;iš klaviatūros pagal atskirą užklausą

INCLUDE Irvine32.inc
.data

balses byte 'A','a','e','I','i','Y','y','O','o','U','u', 0
instrukcija byte 'Rasykite savo teksta.',0dh,0ah
                ,'Programa skaiciuos kiek balsiu irasete.',0dh,0ah
                ,'Norint baigti, rasykite simboli E', 0dh,0ah
                ,0
kartojimu_sakinys byte "Iveskite kiek kartu kartoti atsakyma",0dh,0ah,0
kartojimu sk byte 0


;komentaras byte "Iveskite simboli: ",0dh,0ah,0
;simbol  byte " parasytas simbolis",0dh,0ah,0
;sk byte " parasytas skaicius",0dh,0ah,0
;didz byte " parasyta didzioji raide",0dh,0ah,0
;maz byte " parasyta mazoji raide",0dh,0ah,0
;eil_pabaiga byte 0dh,0ah,0
;kiekis byte "Iveskite kartojimu kieki:",0dh,0ah,0
;tarpas byte " ",0
;smb byte 0

.code
main PROC
	call Clrscr ; Isvalo ekrana
    mov     edx, offset instrukcija
	call WriteString

	call ReadChar
	mov smb,al
	call Writechar
	;simbolio tikrinimas






	cmp	al, 47
	jle	simbolis
	cmp	al, 57
	jle	skaicius
	cmp	al, 64
	jle	simbolis
	cmp	al, 90
	jle	didzioji
	cmp	al, 96
	jle	simbolis
	cmp	al, 122
	jle	mazoji
	mov	edx, offset simbol
	call WriteString
 ;kiekis
toliau:
    mov edx, offset eil_pabaiga
	call WriteString
    mov edx, offset kiekis
    call WriteString
    ;Skaitomas skaicius
	call ReadChar
	cmp	al, 47
	jle	simbolis
	cmp	al, 57
	jle	tinka
	jmp toliau
   ;saugomas skaitliukas
tinka_toliau:
    sub al, 47
    mov cl, al
    
    mov edx, offset eil_pabaiga
	call WriteString
    
    jmp vyk_spausdinimas
    
spausdina:
    ;rasomas ivestas simbolis
	mov al, smb
	call WriteChar
    ;Dedamas tarpas
    mov edx, offset tarpas
	call WriteString
    
vyk_spausdinimas:
    dec cl
    jnz spausdina
	jmp viskas
	
;atitinkamu salygu vygdymas
simbolis:
	mov	edx, offset simbol
	call WriteString
	jmp	toliau
skaicius:
	mov	edx, offset sk
	call WriteString
	jmp	toliau
didzioji:
	mov	edx, offset didz
	call WriteString
	jmp	toliau
mazoji:
	mov	edx, offset maz
	call WriteString
	jmp	toliau
tinka:
	jmp	tinka_toliau
viskas:	ret

	exit
main ENDP




tikrinti_masyva PROC

    mov edx, offset balses
    inc edx
    cmp [edx], al




tikrinti_masyva ENDP

END main