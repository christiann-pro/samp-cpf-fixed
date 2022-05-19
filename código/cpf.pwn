// -- includes -- //
#include <a_samp>
#include <DOF2>
#include <ZCMD>

// -- Variaveis -- //
new PlayerText:CpfTextDraw[MAX_PLAYERS][17];

// Gerar o CPF
new CPFNumber1[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber2[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber3[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber4[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber5[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber6[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber7[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber8[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber9[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber10[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new CPFNumber11[][] =
{
 {0},
 {1},
 {2},
 {3},
 {4},
 {5},
 {6},
 {7},
 {8},
 {9}
};
new Text3D:CPF[MAX_PLAYERS];

main(){}

// -- Publics -- //
public OnPlayerConnect(playerid)
{
	new pastacpf[64];
	new NomeCPF[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NomeCPF, MAX_PLAYER_NAME);
	format(pastacpf, sizeof(pastacpf), "CPF/Player/%s.ini", NomeCPF);
	if(DOF2_FileExists(pastacpf))
	{
		new string[128];
		format(string, sizeof(string), "CPF:{FFFFFF} %s", DOF2_GetString(pastacpf, "CPF"));
		SendClientMessage(playerid, 0x808080FF, string);
		CPF[playerid] = Create3DTextLabel(string, -1, 0, 0, 0, 10, 0);
    	Attach3DTextLabelToPlayer(CPF[playerid], playerid, 0.0, 0.0, 0.1);
	}
	else
	{
	    gerarcpf(playerid);
	}

	//TextDraws Players
	CpfTextDraw[playerid][0] = CreatePlayerTextDraw(playerid, 252.349975, 198.166687, "ld_beat:chit");
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][0], 30.000000, 30.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][0], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][0], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][0], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][0], 0);

	CpfTextDraw[playerid][1] = CreatePlayerTextDraw(playerid, 259.077575, 213.916656, "box");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][1], 0.000000, 8.781845);
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][1], 402.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][1], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, CpfTextDraw[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, CpfTextDraw[playerid][1], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][1], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][1], 1);

	CpfTextDraw[playerid][2] = CreatePlayerTextDraw(playerid, 270.322296, 205.166687, "box");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][2], 0.000000, 11.030746);
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][2], 392.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][2], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, CpfTextDraw[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, CpfTextDraw[playerid][2], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][2], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][2], 1);

	CpfTextDraw[playerid][3] = CreatePlayerTextDraw(playerid, 380.725708, 198.166687, "ld_beat:chit");
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][3], 28.000000, 28.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][3], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][3], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][3], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][3], 0);

	CpfTextDraw[playerid][4] = CreatePlayerTextDraw(playerid, 252.350708, 273.416503, "ld_beat:chit");
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][4], 31.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][4], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][4], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][4], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][4], 0);

	CpfTextDraw[playerid][5] = CreatePlayerTextDraw(playerid, 378.383056, 272.833099, "ld_beat:chit");
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][5], 31.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][5], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][5], 1097458175);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][5], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][5], 0);

	CpfTextDraw[playerid][6] = CreatePlayerTextDraw(playerid, 272.196014, 215.083358, "Ministerio_Da_Fazenda");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][6], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][6], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][6], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][6], 1);

	CpfTextDraw[playerid][7] = CreatePlayerTextDraw(playerid, 272.196136, 235.500000, "Cadastro_de_Pessoa_Fisica");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][7], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][7], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][7], 421097727);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][7], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][7], 1);

	CpfTextDraw[playerid][8] = CreatePlayerTextDraw(playerid, 273.133178, 265.833374, "Nome:");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][8], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][8], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][8], 421097727);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][8], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][8], 1);

	CpfTextDraw[playerid][9] = CreatePlayerTextDraw(playerid, 273.133087, 254.750015, "000.000.000-00");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][9], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][9], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][9], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][9], 1);

	CpfTextDraw[playerid][10] = CreatePlayerTextDraw(playerid, 273.133087, 271.666656, "Griff");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][10], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][10], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][10], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][10], 1);

	CpfTextDraw[playerid][11] = CreatePlayerTextDraw(playerid, 272.664672, 248.916656, "Numero_de_Inscricao:");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][11], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][11], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][11], 421097727);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][11], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][11], 1);

	CpfTextDraw[playerid][12] = CreatePlayerTextDraw(playerid, 273.601715, 282.166625, "Nascimento:");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][12], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][12], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][12], 421097727);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][12], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][12], 1);

	CpfTextDraw[playerid][13] = CreatePlayerTextDraw(playerid, 274.070159, 288.583312, "00/00/2022");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][13], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][13], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][13], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][13], 1);

	CpfTextDraw[playerid][14] = CreatePlayerTextDraw(playerid, 340.432128, 246.583251, "");
	PlayerTextDrawTextSize(playerid, CpfTextDraw[playerid][14], 55.000000, 50.000000);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][14], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][14], -5963521);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][14], -5963776);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][14], 5);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][14], 0);
	PlayerTextDrawSetPreviewModel(playerid, CpfTextDraw[playerid][14], 1247);
	PlayerTextDrawSetPreviewRot(playerid, CpfTextDraw[playerid][14], 0.000000, 0.000000, 0.000000, 1.000000);

	CpfTextDraw[playerid][15] = CreatePlayerTextDraw(playerid, 394.948822, 205.750030, "X");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][15], 0.188226, 0.672499);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][15], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][15], -16776961);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][15], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, CpfTextDraw[playerid][15], true);

	CpfTextDraw[playerid][16] = CreatePlayerTextDraw(playerid, 272.196014, 222.083389, "Secretaria_da_Receita_Federal_-_CPF");
	PlayerTextDrawLetterSize(playerid, CpfTextDraw[playerid][16], 0.122166, 0.666665);
	PlayerTextDrawAlignment(playerid, CpfTextDraw[playerid][16], 1);
	PlayerTextDrawColor(playerid, CpfTextDraw[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, CpfTextDraw[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, CpfTextDraw[playerid][16], 255);
	PlayerTextDrawFont(playerid, CpfTextDraw[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, CpfTextDraw[playerid][16], 1);
	return 1;
}

public OnGameModeExit()
{
	DOF2::Exit();
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText: playertextid)
{
	if(playertextid == CpfTextDraw[playerid][15])
    {
        RemoveTextDrawCPF(playerid);
	}  
	return 1;
}

// -- Comandos -- //
CMD:meucpf(playerid)
{
   	new pastacpf[64];
	new NomeCPF[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NomeCPF, MAX_PLAYER_NAME);
	format(pastacpf, sizeof(pastacpf), "CPF/Player/%s.ini", NomeCPF);
	if(DOF2_FileExists(pastacpf))
	{
		SelectTextDraw(playerid, 0x808080FF);
		MostrarTextDrawCPF(playerid);
	}
	else SendClientMessage(playerid, 0xFF0000FF, "| Error |{FFFFFF} Seu CPF ainda nao foi gerado aguarde ser gerado!");
	return 1;
}

// -- Stocks -- //
stock MostrarTextDrawCPF(playerid)
{
	//Name
	new string[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	format(string, sizeof(string), "%s", name);
	PlayerTextDrawSetString(playerid, CpfTextDraw[playerid][10], string);

	//CPF
	new pastacpf[64], NomeCPF[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NomeCPF, MAX_PLAYER_NAME);
	format(pastacpf, sizeof(pastacpf), "CPF/Player/%s.ini", NomeCPF);
	format(string, sizeof(string), "%s", DOF2_GetString(pastacpf, "CPF"));
	PlayerTextDrawSetString(playerid, CpfTextDraw[playerid][9], string);

	for(new i; i < sizeof(CpfTextDraw[]); i++)
    PlayerTextDrawShow(playerid, CpfTextDraw[playerid][i]);
	return 1;
} 

stock RemoveTextDrawCPF(playerid)
{
	for(new i; i < sizeof(CpfTextDraw[]); i++)
    PlayerTextDrawHide(playerid, CpfTextDraw[playerid][i]);
	CancelSelectTextDraw(playerid);
	return 1;
}

stock CriarCPF(playerid, NumerosCPF[])
{
	new pastacpf[64];
	new NomeCPF[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NomeCPF, MAX_PLAYER_NAME);
	format(pastacpf, sizeof(pastacpf), "CPF/Player/%s.ini", NomeCPF);
   	if(!DOF2_FileExists(pastacpf))
   	{
		DOF2_CreateFile(pastacpf);
  		DOF2_SetString( pastacpf, "CPF", NumerosCPF);
  		DOF2_SaveFile();
  		new string[253];
  		format(string, sizeof(string), "Server:{FFFFFF} CPF Gerado com sucesso Numero: %s", DOF2_GetString(pastacpf, "CPF"));
		SendClientMessage(playerid, 0x808080FF, string);
		CPF[playerid] = Create3DTextLabel(NumerosCPF, -1, 0, 0, 0, 10, 0);
		Attach3DTextLabelToPlayer(CPF[playerid], playerid, 0.0, 0.0, 0.1);
	}
	return 1;
}
stock gerarcpf(playerid)
{
   	new pastacpf[64];
	new NomeCPF[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NomeCPF, MAX_PLAYER_NAME);
	format(pastacpf, sizeof(pastacpf), "CPF/Player/%s.ini", NomeCPF);
	if(!DOF2_FileExists(pastacpf))
	{
		new String[100];
		format(String, sizeof(String), "%d%d%d.%d%d%d.%d%d%d-%d%d", CPFNumber1[random(sizeof(CPFNumber1))][0], CPFNumber2[random(sizeof(CPFNumber2))][0], CPFNumber3[random(sizeof(CPFNumber3))][0], CPFNumber4[random(sizeof(CPFNumber4))][0], CPFNumber5[random(sizeof(CPFNumber5))][0], CPFNumber6[random(sizeof(CPFNumber6))][0], CPFNumber7[random(sizeof(CPFNumber7))][0], CPFNumber8[random(sizeof(CPFNumber8))][0], 
		CPFNumber9[random(sizeof(CPFNumber9))][0], CPFNumber10[random(sizeof(CPFNumber10))][0], CPFNumber11[random(sizeof(CPFNumber11))][0]);
		new String2[256];
		format(String2, sizeof(String2), "CPF/Numeros/%s.ini", String);
		if(!DOF2_FileExists(String2))
		{
			DOF2_CreateFile(String2);
			DOF2_SaveFile();
			CriarCPF(playerid, String);
		}
		else
		{
			SetTimerEx("GerarNovamente", 1000, false, "i", playerid);
		}
	}
	else SendClientMessage(playerid, 0x808080FF, "CPF:{FFFFFF} Voce ja possue um CPF!");
	return 1;
}
forward GerarNovamente(playerid);
public GerarNovamente(playerid)
{
   	gerarcpf(playerid);
	return 1;
}
