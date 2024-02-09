; script basico de auto-click
; autor = lant-silva
; eu fiz isso em menos de 1 hora pesquando na documentação do autohotkey
; é bem simples pq ainda é um teste, estou aprendendo

gposx := 0 
gposy := 0
clickspeed := 0
off := false ; variavel de controle
MsgBox "Auto-Clicker - feito por lant-silva | Aperte Ctrl-C para ativar | Clique com o Control segurado para determinar um ponto na tela"

^LButton:: ; captura o ponto do mouse e a velocidade em milissegundos
{
	MouseGetPos &x, &y
	global gposx := x
	global gposy := y
	global clickspeed := InputBox("Velocidade do clique (ms)")
	MsgBox "Posição determinada" 
	
}

^c:: ; ativa o autoclick
{
	If(gposx == 0 && gposy == 0){ ; caso vc tente rodar sem ter determinado um ponto pro auto-clicker
		MsgBox "Posição não determinada!"
		return
	}
	MsgBox "Auto-click ativado, aperte C para desativar"
	Loop
	{
		If(GetKeyState("C")){
			global off := true
			break
		}
		MouseClick "left", gposx, gposy, 1
		Sleep clickspeed.Value
	}
	If(off)
		MsgBox "Auto-click desativado"
}