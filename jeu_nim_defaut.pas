{
Stéphane Wilhelm F14

ALGORITHME : jeu_nim_defaut
//BUT : Permettre à deux joueurs de jouer au jeu des allumettes, chaque joueur devra tirer
//entre 1 et 3 allumettes d'un tas de 21 allumettes. Celui qui tire la dernière a perdu
//ENTREE : Le nombre d'allumettes tirées
//SORTIE : Le nombre d'allumettes restantes, le gagnant

CONST : nbAllMax = 21
		nbAllMin = 0
		piocheMax = 3
		piocheMin = 1

VAR :
	nbAllRest, pioche, hasard : ENTIER
	nom1, nom2 : CHAINE
	tour : BOOL
DEBUT
	hasard <- random(2); //C'est pour déterminer qui commence de manière aléatoire
	ECRIRE "Entrez le nom du premier joueur."
	LIRE nom1
	ECRIRE "Entrez le nom du joueur deux."
	LIRE nom2
	nbAllRest <- nbAllMax
	REPETER
		pioche <- 0
		SI (hasard = 0) ALORS // Dans ce cas, c'est le joueur 1 qui commence
			ECRIRE "Il y a ", nbAllRest, " allumette(s), ", nom1, " c'est votre tour."
			tour <- VRAI
			//Ce booléen détermine qui est le joueur qui a joué en dernier quand la partie est fini et donc déterminé le perdant
			TANT QUE ((pioche > 3) OU (pioche < 1)) OU (pioche > nbAllRest) FAIRE
			//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
				ECRIRE "Entrez un nombre d'allumette compris entre 1 et 3 et inférieur au nombre d'allumettes restantes."
				LIRE pioche
			FINTANTQUE
			nbAllRest <- nbAllRest - pioche
			//On déduit le nombre d'allumette du tas d'allumettes restantes
			pioche <- 0
			//On reset la pioche pour le second joueur à jouer
			SI (nbAllRest > nbAllMin) ALORS
			//Ce "SI" me permet d'éviter que le joueur 2 continue de piocher en cas de défaite du joueur 1
				ECRIRE "Il y a ", nbAllRest, " allumette(s), ", nom2, " c'est votre tour."
				tour <- FAUX
				TANT QUE ((pioche > 3) OU (pioche < 1)) OU (pioche > nbAllRest) FAIRE
					ECRIRE "Entrez un nombre d'allumette compris entre 1 et 3 et inférieur au nombre d'allumettes restantes."
					LIRE pioche
				FINTANTQUE
				nbAllRest <- nbAllRest - pioche
			FINSI
		SINON
			ECRIRE "Il y a ", nbAllRest " allumette(s), ", nom2, " c'est votre tour."
			tour <- FAUX
			//Ce booléen détermine qui est le joueur qui a joué en dernier quand la partie est fini et donc déterminé le perdant
			TANT QUE ((pioche > 3) OU (pioche < 1)) OU (pioche > nbAllRest) FAIRE
			//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
				ECRIRE "Entrez un nombre d'allumette compris entre 1 et 3 et inférieur au nombre d'allumettes restantes."
				LIRE pioche
			FINTANTQUE
			nbAllRest <- nbAllRest - pioche
			//On déduit le nombre d'allumette du tas d'allumettes restantes
			pioche <- 0
			SI (nbAllRest > nbAllMin) ALORS
			//Ce "SI" me permet d'éviter que le joueur 2 continue de piocher en cas de défaite du joueur 1
				ECRIRE "Il y a ", nbAllRest, " allumette(s), ", nom1, " c'est votre tour."
				tour <- VRAI
				TANT QUE ((pioche > 3) OU (pioche < 1)) OU (pioche > nbAllRest) FAIRE
					ECRIRE "Entrez un nombre d'allumette compris entre 1 et 3 et inférieur au nombre d'allumettes restantes."
					LIRE pioche
				FINTANTQUE
				nbAllRest <- nbAllRest - pioche
			FINSI
		FINSI
	JUSQUA (nbAllRest = nbAllMin)
	SI (tour = VRAI) ALORS
		ECRIRE nom1, " vous avez perdu. Bravo ", nom2, "."
	SINON
		ECRIRE nom2, " vous avez perdu. Bravo ", nom1, "."
	FINSI
FIN}

program jeu_nim_defaut;

uses crt;

CONST   nbAllMax = 21;
		nbAllMin = 0;
		piocheMax = 3;
		piocheMin = 1;

VAR
	nbAllRest, pioche, hasard : integer;
	nom1, nom2 : string;
	tour : boolean;
begin
	clrscr;
	randomize;
	hasard := random(2); //C'est pour déterminer qui commence de manière aléatoire
	writeln('Entrez le nom du premier joueur.');
	readln(nom1);
	writeln('Entrez le nom du joueur deux.');
	readln(nom2);
	nbAllRest := nbAllMax;
	repeat
	begin
		pioche := 0;
		if (hasard = 0) then // Dans ce cas, c'est le joueur 1 qui commence
		begin
			writeln('Il y a ', nbAllRest, ' allumette(s), ', nom1, ' c''est votre tour.');
			tour := true;
			//Ce booléen détermine qui est le joueur qui a joué en dernier quand la partie est fini et donc déterminé le perdant
			while ((pioche > 3) or (pioche < 1)) or (pioche > nbAllRest) do
			begin
			//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
				writeln('Entrez un nombre d''allumette compris entre 1 et 3 et inférieur au nombre d''allumettes restantes.');
				readln(pioche);
			end;
			nbAllRest := nbAllRest - pioche;
			//On déduit le nombre d'allumette du tas d'allumettes restantes
			pioche := 0;
			if (nbAllRest > nbAllMin) then
			begin
			//Ce "SI" me permet d'éviter que le joueur 2 continue de piocher en cas de défaite du joueur 1
				writeln('Il y a ', nbAllRest, ' allumette(s), ', nom2, ' c''est votre tour.');
				tour := false;
				while ((pioche > 3) or (pioche < 1)) or (pioche > nbAllRest) do
				begin
				//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
					writeln('Entrez un nombre d''allumette compris entre 1 et 3 et inférieur au nombre d''allumettes restantes.');
					readln(pioche);
				end;
				nbAllRest := nbAllRest - pioche;
			end;
		end
		else
			begin
			writeln('Il y a ', nbAllRest, ' allumette(s), ', nom2, ' c''est votre tour.');
			tour := false;
			//Ce booléen détermine qui est le joueur qui a joué en dernier quand la partie est fini et donc déterminé le perdant
			while ((pioche > 3) or (pioche < 1)) or (pioche > nbAllRest) do
			begin
			//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
				writeln('Entrez un nombre d''allumette compris entre 1 et 3 et inférieur au nombre d''allumettes restantes.');
				readln(pioche);
			end;
			nbAllRest := nbAllRest - pioche;
			//On déduit le nombre d'allumette du tas d'allumettes restantes
			pioche := 0;
			if (nbAllRest > nbAllMin) then
			begin
			//Ce "SI" me permet d'éviter que le joueur 2 continue de piocher en cas de défaite du joueur 1
				writeln('Il y a ', nbAllRest, ' allumette(s), ', nom1, ' c''est votre tour.');
				tour := true;
				while ((pioche > 3) or (pioche < 1)) or (pioche > nbAllRest) do
				begin
				//C'est pour que le joueur ne tire pas plus que 3 allumettes/ moins qu'une ou plus que le nombre d'allumettes restantes
					writeln('Entrez un nombre d''allumette compris entre 1 et 3 et inférieur au nombre d''allumettes restantes.');
					readln(pioche);
				end;
				nbAllRest := nbAllRest - pioche;
			end;
		end;
	end;
	until (nbAllRest = nbAllMin);
	if (tour = true) then
		writeln(nom1, ' vous avez perdu. Bravo ', nom2, '.')
	else
	begin
		writeln(nom2, ' vous avez perdu. Bravo ', nom1, '.');
	end;
	readln;
end.