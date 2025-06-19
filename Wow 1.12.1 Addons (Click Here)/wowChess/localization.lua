--Localization file for wowChess

--if ( GetLocale() == "deDE" ) then
	--German?
	
--elseif ( GetLocale() == "frFR" ) then
	--French

--else
	--Displays help info
	function wowChess_displayHelp()
		ChatFrame1:AddMessage("-- Chess Help --", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("board -- Toggles chess board", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("join -- Joins wowChess channel to find other players.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("challenge <player> [time]-- Challenge player to a game of chess. time=TotalMin/BonusSec", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("draw -- Offers a draw to opponent.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("resign -- Admit defeat and resign game to opponent.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("reset -- Clears the board and ends your game.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("record -- Displays win/draw/loss record.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("mute -- Mutes sounds if included in the skin.", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("skin <standard|warcraft2> -- Changes skin to foldername", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("scale <1.0> -- Sets the scale of the board, 1.0=100%, 0.75=75%", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("rotate -- Flips board to opposing view", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("load <player> -- Restores last saved game with player", 1.0, 1.0, 0.0);
		ChatFrame1:AddMessage("copy <from> <to> -- Copies saved game from one name to another", 1.0, 1.0, 0.0);
	end

	--English (Default)
	wowChess_STR_VersionMismatch = "Version mismatch, one or both of us needs to update wowChess at www.curse-gaming.com."
	wowChess_STR_AlreadyPlaying = "Sorry, I'm already playing a game of chess.";
	wowChess_STR_CantCastleThruCheck = "Cannot castle while in check, or through check.";
	wowChess_STR_PawnPromoted = "Pawn promoted to queen.";
	wowChess_STR_CantMoveKingInCheck = "King is in Check. Cannot move unless Check is canceled.";
	wowChess_STR_CantChallengePlaying = "You cant challenge someone else until your game is over. '/ch reset' to end.";
	wowChess_STR_CopyingPlayer1 = "Copying saved game from ";
	wowChess_STR_CopyingPlayer2 = " to ";
	wowChess_STR_NoSavedData = "No saved game data for ";
	wowChess_STR_GameRestored1 = "Game against ";
	wowChess_STR_GameRestored2 = " has been restored.";
	wowChess_STR_WhiteOpening = "You are white. Make your opening move.";
	wowChess_STR_BlackOpening = "You are black.";
	wowChess_STR_GameoverDraw = "Game has ended in a draw.";
	wowChess_STR_White = "White";
	wowChess_STR_Black = "Black";
	wowChess_STR_GameOver1 = "Game Over. ";
	wowChess_STR_GameOver2 = " has defeated ";
	wowChess_STR_JoiningChannel = "Joining wowChess channel";
	wowChess_STR_SkinNotFound = "Error: Skin not found: ";
	wowChess_STR_SetScale = "Setting scale to ";
	wowChess_STR_TotalWDL = "Total Wins/Draws/Losses: ";
	wowChess_STR_Unmuted = "wowChess sounds unmuted.";
	wowChess_STR_Muted = "wowChess sounds muted.";
	
	
	
	
--end