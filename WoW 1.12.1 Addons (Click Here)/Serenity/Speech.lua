------------------------------------------------------------------------------------------------------
-- Serenity
--
-- Based on Necrosis LdC by Lomig and Nyx (http://necrosis.larmes-cenarius.net)
-- Original Necrosis Idea : Infernal (http://www.revolvus.com/games/interface/necrosis/)
-- Serenity Maintainer : Kaeldra of Aegwynn
--
-- Contact : darklyte@gmail.com
-- Send me in-game mail!  Yersinia on Aegwynn, Horde side.
-- Guild: <Working as Intended>
-- Version Date: 07.14.2006
------------------------------------------------------------------------------------------------------



-- Text for speeches by the mage
--------------------------------------
-- Here are some random speeches for your mage.  You can add more to fit your
-- magey-way-of-thinking a little more!
-- Need some help ? :)
-- Correct syntax is "Blah blah blah" SelectedPlayer "Blah blah blah"
-- If you want to write "In few seconds 'Player's name' will be able to help us"
-- The target's name is replaced by <target>, but CASE SENSITIVE!
-- you need to add before the } :
-- "In few seconds <target> will be able to help us",
-- 
-- The same thing is available for all messages.  If you need any help at all, 
-- Don't hesitate to e-mail me at darklyte@gmail.com :)


-------------------------------------
--  ENGLISH VERSION --
-------------------------------------

function Serenity_Localization_Speech_En()


	SERENITY_RES_MESSAGE = {
		[1] = "Granddaddy always said laughter was the best medicine. I guess it wasn't strong enough to keep <target> alive.",
		[2] = "Okay, <target>, nap time is over! Back to work!",
		[3] = "Ressing <target>, can I get an Amen!",
		[4] = "<target>, your subscription to Life(tm) has expired. Do you wish to renew?",
		[5] = "YAY! I always wanted my very own <target>-zombie!",
		[6] = "It just so happens that <target> is only MOSTLY dead. There's a big difference between mostly dead and all dead. Mostly dead is slightly alive.",
		[7] = "<target> has failed at life, i'm giving him a second chance. That's right, not God, ME!!",
		[8] = "Cool, I received 42 silver, 32 copper from Corpse of <target>",
		[9] = "GAME OVER, <target>. To continue press up, up, down, down, left, right, left, right, B, A, B, A, Select + Start",
		[10] = "<target>, It's more mana efficient just to resurrect you.  Haha, I'm just kidding!",
		[11] = "Well, <target>, if you had higher faction with <player>, you might have gotten a heal.  How do you raise it?  1g donation = 15 rep.",
		[12] = "Okay, <target>.  Stop being dead.",
		[13] = "If you are reading this message, <target> is already dead.",
		[14] = "Don't rush me <target>. You rush a miracle worker, you get rotten miracles.",
		[15] = "Death comes for you <target>! With large, pointy teeth!",
		[16] = "Resurrecting <target>. Side effects may include: nausea, explosive bowels, a craving for brains, and erectile dysfunction. Resurrection is not for everyone. Please consult healer before dying.",
		[17] = "Dammit <target>, I'm a doctor! Not a priest! .... Wait a second.... Nevermind. Ressing <target>",
		[18] = "Dying makes me sad, <target>.",
		[19] = "<target> stop worshipping the ground I walk on and get up." ,
		[20] = "Hey <target>, can you check to see if Elvis is really dead?...and can he fill your spot in the party?",
		[21] = "Giving <target> another chance to noob it up. ",
		[22] = "Dammit, <target>, did you get my PERMISSION before dying?!",
		[23] = "...death defying feats are clearly not your strong point, <target>",
		[24] = "Walk it off, <target>.",
		[25] = "<target>, by accepting this resurrection you hereby accept that you must forfeit your immortal soul to <player>. Please click 'Accept' to continue.",
		[26] = "<target>, this better not be another attempt to get me to give you mouth-to-mouth.",
		[27] = "Arise <target>, and fear death no more; or at least until the next pull.",
		[28] = "Stop slacking, <target>. You can sleep when you're . . . Oh. . . Um, ressing <target>",
		[29] = "We can rebuild <target>, we can make him stronger, faster, but we can't make him any smarter.",
		[30] = "<target> has fallen and can't get up!",
		[31] = "Bring out your dead! *throws <target> on the cart*",
		[32] = "Hey <target>, say hello to Feathers for me, will ya?",
		[33] = "<target>, quit hitting on the Spirit Healer and come kill something!",
		[34] = "<target> I *warned* you, but did you listen to me? Oh, no, you *knew*, didn't you? Oh, it's just a harmless little *bunny*, isn't it?",
		[35] = "<target>, please! This is supposed to be a happy occasion. Let's not bicker and argue over who killed who.",
		[36] = "Today's category on Final Jeopardy: Spells that end in 'esurrection'. <target>, ready?",
		[37] = "There are worse things then death, <target>. Have you ever grouped with... oh, wait. We aren't supposed to mention that in front of you.",
		[38] = "Did you run into some snakes on a plane or something, <target>? 'Cause you're dead.",
		[39] = "Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo... that's the best ambulance imperssion I can do, <target>.",
		[40] = "Tsk tsk, <target>. See, I told you to sacrifice that virgin to the Volcano God.",
		[41] = "<target> gets a Mulligan.",
		[42] = "Hey <target>, do you know what you call a physician that was last in his class?  Doctor.",
		[43] = "Eww!  What's that smell!  It smells like something died in here!  Hey, where is <target>?... Oh.",
		[44] = "Unfortunatly, <target>, you have to be at least Revered with Dwarven Female Priests to be rezzed. Sucks to be you.",  
		[45] = "You don't deserve a cute rez macro, <target>. You deserve to die. But you already did, so, um... yeah.",
		[46] = "<target>, you have been weighed, you have been measured, and you have been found wanting.",
		[47] = "Well <target>, you tried your best. And apparently failed miserably. Good job.", 
		[48] = "Did it hurt, <target>, when you fell from Heaven? Oh, wait. You're dead. I don't know where I was going with that. Nevermind.", 
		[49] = "Gah, <target>, dead again? You probably want a rez, don't you? What do you think I am, a prie... oh. Fair enough.",
		[50] = "<target> have you heard of Nethaera?  Yeah, she's really cool.  Why do I bring it up?  No reason.",
	};
	SERENITY_SHACKLE_MESSAGE = {
		[1] = "THE POWER OF "..string.upper(UnitName("player")).." COMPELS YOU!!",
		[2] = "Shackling <target>!  Stay away from the bling!",
		[3] = "I hope you brought the gag <target>, I got the shackles!",
		[4] = "Believe it or not, <target>, I am into bondage.",
		[5] = "Shackling <target>! Drop what you're doing and break it! ",
		[6] = "Shackling <target>. Everytime you break it, I'll kill a kitten.",
		[7] = "Shackling <target>!  You break it, you tank it.",
		[8] = "<target> is my corpse. There are many others like it but this one is mine.",
		[9] = "Shackling <target> because corpses can't say no.",
		[10] = "Go to your cage, <target>!",
		[11] = "All I ever hear from you is 'brains this' and 'brains that', <target>.  No more!",
		[12] = "You fought the law and the law won, <target>.",
		[13] = "<target>, go to jail.  Go directly to jail.  Do not pass go.  Do not collect 200g",
		[14] = "That which was never meant to move, <target>, be still once more!" ,

	};
	SERENITY_STEED_MESSAGE = {
		[1] = "If it wasn't for my <mount>, I wouldn't have spent that year in college.",
		[2] = "The directions said to just add water and... WHOA a <mount>!",
	};
	SERENITY_FREEZE_MESSAGE = {
		[1] = "I enjoy my <target>s on the rocks",
		[2] = "Looks like <target> needs to get a sweater!",
		[3] = "<3 Freezing Band",
		[4] = "Take a shadow pill, <target>",
		[5] = "That's just cold, <target>.  Just plain cold",
		[6] = "And thats how I killed the dinosaurs",
		[7] = "Why so blue, <target>?",
		[8] = "Enjoy your 'You can't do that while frozen' messages",
		[9] = "Iceberg! Dead ahead!",
		[10] = "I don't know how we're gonna get <target> thawed!",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "Resurrecting ==> <target>",
		[2] = "Shackle Undead ==> <target>",
	};

end

-------------------------------------
--  VERSION FRANCAISE --
-------------------------------------

function Serenity_Localization_Speech_Fr()

	SERENITY_TELEPORT_MESSAGE = {
    [1] = "Si vous me cherchez, je suis \195\160 <target>",
	[2] = "Bon je vous lache, on m'attend \195\160 <target>",
	}
	SERENITY_SOMETHING_MESSAGE = {
    [1] = "Passez votre permis, j'en ai marre de faire le taxi!",
	[2] = "Avec Mago Express, pas de stress, vous serez \195\160 <target> en moins de temps qu'il n'en faut pour le taper.",
	[3] = "Envie de changer d'air? go <target>",
	[4] = "Et hop, une faille spatio-temporelle vers <target>",
	[5] = "R\195\169p\195\169tez apr\195\168s moi : Mago is good :p",
	}
	SERENITY_Shackle_MESSAGE = {
		["Sheep"] = {
			[1] = "<target> va passer un quart d'heure \195\160 brouter...",
			[2] = "Proverbe ancien : Zoner un mouton, c'est devenir un mouton, compris?",
			[3] = "Je moutonne <target>, touchez y et je vous transforme en c\195\180ne glac\195\169.",
			[4] = "Par Magmadar et Lucifron, <target> est maintenant un mouton!",
			[5] = "Je moutonne <target>, PAS TOUCHE!",
			[6] = "Même un murloc est mignon une fois mouton.",
			[7] = "Quelqu'un a besoin de chaussettes en laine pour cet hiver?",
			[8] = "Ok <target> r\195\169p\195\168te apr\195\168s moi : B\195\168\195\168\195\168\195\168\195\168\195\168",
			[9] = "Moutonnage de >> <target> <<. Pour chaque mouton frapp\195\169, 10po revers\195\169es \195\160 mon humble personne.",
			[10] = "Moutonnage de <target>:  Casseurs, Tankeurs!",
			[11] = "<target> est d\195\169sormais une boule de laine sur pattes!",
			[12] = "Vous voulez voir <target> descendre tout en bas de la cha\195\174ne alimentaire?",
			[13] = "<target> est un mouton mais ne le sait pas encore...",
			[14] = "Mouton, gentil mouton, ne me dis pas non.",
			[15] = "Ce mouton sera le chef d'oeuvre de ma carri\195\168re",
		},
		["Pig"] = {
			[1] = "Dans <target> tout est bon",
			[2] = "Cochonnage de <target>.  Oink! Oink!",
			[3] = "Ce soir : jambon beurre, c'est ma tourn\195\169e!",
			[4] = "Je pose un groin sur <target> et je suis \195\160 vous",
			[5] = "<target> est d\195\169sormais un m\195\169chouis sur pattes!",
			[6] = "Merci <target>, \195\167a ira.",
		},
		["Turtle"] = {
			[1] = "Dans la s\195\169rie des m\195\169tamorphoses loufoques, je voudrais la tortue",
			[2] = "<target> est parti \195\160 point",
			[3] = "Vous voulez voir un truc vraiment effrayant?",
			[4] = "<target> va passer le mur du son!",
		},
	}
	SERENITY_STEED_MESSAGE = {
	[1] = "Bon on va pas y passer la journ\195\169e ..",
	}
	SERENITY_SHORT_MESSAGES = {
		[1] = "--> Ouverture du portail vers <target> <--",
		[2] = "Mouton ==> <target>",
	};

end


-------------------------------------
--  VERSION GERMAN -
--
--  ä = \195\164   Ä = \195\132   ö = \195\182   Ö = \195\150   ü = \195\188   Ü = \195\156   ß = \195\159
--
-------------------------------------

function Serenity_Localization_Speech_De()

	SERENITY_RES_MESSAGE = {
		[1] = "Gro\195\159vater hat immer gesagt, Lachen ist die beste Medizin.  Aber sie war wohl nicht gut genug um <target> am Leben zu halten.",
		[2] = "Okay, <target>, Mittagspause vorbei! Zur\195\188ck an die Arbeit!",
		[3] = "<target>, Ihr Abonnement auf Leben ist abgelaufen. M\195\182chtet Ihr es erneuern?",
		[4] = "Jaa! Ich wollte schon immer meinen eigenen <target>-Zombie!",
		[5] = "So wie es aussieht, ist <target> gr\195\182\195\159tenteils tot. Es gibt einen gro\195\159en Unterschied zwischen gr\195\182\195\159tenteils tot und ganz tot. Gr\195\182\195\159tenteils tot ist immer noch leicht am Leben.",
		[6] = "<target> hat im Leben versagt und ich gebe ihm eine zweite Chance.",
		[7] = "GAME OVER, <target>. To continue press up, up, down, down, left, right, left, right, B, A, B, A, Select + Start",
		[8] = "<target>, Dich wiederzubeleben ist einfach mana effektiver.",
		[9] = "Nun, <target>, Wenn Dein Ruf bei <player> etwas besser gewesen w\195\164re, h\195\164ttest Du vielleicht Heilung bekommen. Wie farmt man diesen Ruf? Einfach: 1g Spende = 15 Ruf",
		[10] = "Okay, <target>.  H\195\182r auf tot zu sein.",
		[11] = "Wenn Ihr diese Nachricht lest, ist <target> bereits tot.",
		[12] = "Hetz mich nicht <target>. Wenn man einen Wunderwirker hetzt bekommt man sch\195\164bige Wunder.",
		[13] = "Belebe <target> wieder. M\195\182gliche Nebenwirkungen sind: \195\156belkeit, Kopfschmerzen, Explodierende Eingeweide, Hei\195\159hunger auf Hirn und Erektionsst\195\182rungen. Bitte konsultieren Sie Ihren Heiler vor dem Sterben.",
		[14] = "Verdammt <target>, Ich bin Arzt kein Priester! .... Warte.... Schon gut. Belebe <target>",
		[15] = "Sterben macht mich traurig, <target>.",
		[16] = "<target> h\195\182r auf den Boden anzubeten auf dem ich gehe und steh auf." ,
		[17] = "Hey <target>, ist Elvis wirklich tot?... und kann er Deinen Platz in der Gruppe einnehmen?",
		[18] = "Verdammt, <target>, Hast du Dir meine ERLAUBNIS eingeholt bevor Du gestorben bist?",
		[19] = "Dem Tode trotzende Eigenschaften sich offensichtlich nicht deine St\195\164rke, <target>",
		[20] = "<target>, Indem Sie diese Wiederbelebung annehmen, verpf\195\164nden Sie ihre unsterbliche Seele an <player>. Bitte klicken Sie 'Annehmen' um die Nutzungsbedingungen zu akzeptieren.",
		[21] = "<target>, Ich hoffe dass dies kein weiterer armseliger Versuch ist, Deinen Mund auf meinen zu pressen.",
		[22] = "Steh auf <target>, und f\195\188rchte den Tod nie mehr; oder wenigstens bis zum n\195\164chsten Pull.",
		[23] = "H\195\182r auf zu faulenzen <target>. Du kannst schlafen, wenn Du . . . Oh. . . Ehm, belebe <target>",
		[24] = "Wir k\195\182nnen <target> neu erschaffen, wir k\195\182nnen ihn st\195\164rker, schneller, besser machen.... aber nicht kl\195\188ger.",
		[25] = "<target> ist hingefallen und kann alleine nicht mehr aufstehen!",
		[26] = "Bringt eure Toten raus! *schmei\195\159t <target> auf die Karre*",
		[27] = "<target>, h\195\182r auf den Geistheiler anzubaggern und komm her und t\195\182te irgendwas.",
		[28] = "<target> Ich hatte Dich gewarnt. Aber hast Du zugeh\195\182rt? Oh nein, Du wusstest es besser. Nur ein kleines harmloses *Kaninchen*, nicht wahr?",
		[29] = "Bitte, <target>! Dies soll doch ein fr\195\182hliches Ereignis sein. Lass und nicht streiten, wer wen get\195\182tet hat.",
		[30] = "Es gibt schlimmeres als den Tod, <target>. Warst Du jemals in einer Gruppe mit... oh, warte, wir sollten dar\195\188ber ja vor Dir nicht reden.",
		[31] = "Tss tss, <target>. I hab Dir doch gesagt Du h\195\164ttest die Jungfrau dem Vulkangott opfern sollen...",
		[32] = "<target> bekommt nen Mulligan.",
		[33] = "Hey <target>, wei\195\159t Du wie man den schlechtesten Absolventen der medizinischen Fakult\195\164t nennt? Doktor.",
		[34] = "Ieee!  Was riecht hier so?  Das riecht ja, als wenn hier drin was gestorben w\195\164re!  He, wo ist <target>?... Oh.",
		[35] = "Leider, <target>, musst Du f\195\188r eine Wiederbelebung mindestens *respektvoll* bei den Priestern sein. Pech f\195\188r Dich.",  
		[36] = "Nun <target>, Du hast Dein Bestes gegeben. Und offensichtlich kl\195\164glich versagt. Gute Arbeit.", 
		[37] = "Ach, <target>, schon wieder tot? Und nun willst Du vermutlich wiederbelebt werden? Was denkst Du das ich bin, ein Pries...oh...Na gut.",
		[38] = "<target> hast Du von Nethaera geh\195\182rt?  Ja, sie ist wirklich cool.  Warum ich das erw\195\164hne?  Kein besonderer Grund.",
		
	};
	SERENITY_SHACKLE_MESSAGE = {
		[1] = "DIE MACHT VON "..string.upper(UnitName("player")).." FESSELT DICH!!",
		[2] = "Fessle <target>!  Bleibt von den Ketten weg!",
		[3] = "Ich hoffe Du hast den Knebel mitgebracht <target>, denn ich habe die Ketten!",
		[4] = "Ob Du's glaubst oder nicht, <target>, ich steh auf Fesselspiele.",
		[5] = "Fessle <target>! Lass alles stehen und befrei es! ",
		[6] = "Fessle <target>. Jedes Mal wenn Du die Fesseln brichst, stirbt ein K\195\164tzchen.",
		[7] = "Fessle <target>!  Du befreist es, Du tankst es.",
		[8] = "<target> ist mein Untoter. Es gibt viele wie ihn, aber dieser ist meiner.",
		[9] = "Fessle <target> weil Untote nicht Nein sagen k\195\182nnen.",
		[10] = "In Deinen K\195\164fig, <target>!",
		[11] = "Alles was ich von Dir h\195\182re, ist 'Gehirne dies' und 'Gehirne das', <target>.  Nie wieder!",
		[12] = "Du hast mit dem Gesetz gek\195\164mpft... und verloren, <target>.",
		[13] = "<target>, gehe ins Gef\195\164ngnis. Gehe direkt dorthin. Gehe nicht \195\188ber Los, Ziehe nicht 200g ein.",
		[14] = "Das was sich niemals h\195\164tte bewegen sollen, <target>, steh noch einmal still!" ,

	};
	SERENITY_STEED_MESSAGE = {
		[1] = "Wenn's nicht f\195\188r mein <mount> gewesen w\195\164re, h\195\164tte ich nie das Jahr an der Uni verbracht.",
		[2] = "Die Anweisungen lauteten, einfach Wasser hinzugeben und.... WHOA ein <mount>!",
	};
	SERENITY_FREEZE_MESSAGE = {
		[1] = "Ich mag meine <target>s auf Eis",
		[2] = "Sieht aus als br\195\164uchte <target> nen Pullover!",
		[3] = "<3 Band der Eisesk\195\164lte",
		[4] = "Nimm ne Schatten-Tablette, <target>",
		[5] = "Das ist einfach kalt, <target>.  Nur kalt.",
		[6] = "Und das ist, wie ich die Dinosaurier get\195\182tet habe.",
		[7] = "Warum so k\195\188hl, <target>?",
		[8] = "Viel Spa\195\159 mit den 'Ihr k\195\182nnt das jetzt nicht tun' Nachrichten",
		[9] = "Eisberg! Genau voraus!",
		[10] = "Ich wei\195\159 nicht wie wir <target> jemals auftauen sollen!",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "Belebe ==> <target>",
		[2] = "Fessle ==> <target>",
	};

end




---------------------------------
-- TRADITIONAL CHINESE VERSION --
---------------------------------

function Serenity_Localization_Speech_Tw()

	SERENITY_TELEPORT_MESSAGE = {
		[1] = "ææ­£å¨æèªå·±å³éå°<target>ï¼è«å¿ææ·æåï¼",
		[2] = "æææå°æ\195\164ºæ±è¥¿ï¼æå¿é ç«å»åå¾ <target>ã",
		[3] = "é æ¯!è£åé½å£\195\164ºï¼æåå<target>\195\164ºåï¼\195\164¿®è£å»ï¼",
		[4] = "æè¦é£å<target>\195\164ºï¼éæè¦æå¹«å¿çå°æ¹åï¼",
		[5] = "ç\195\164¾æè©²å<target>\195\164º,æéå°±æ¯éé¢ï¼æåï¼",
		[6] = "å³éè¡éå§æ½å±ï¼åç§\195\164¹å¾æå°åå°<target>ã",
		[7] = "å¸æéæ¬¡å¯\195\164»¥æ­£ç¢ºçå³éå°<target>ï¼",
	};
	SERENITY_ANYTHING_MESSAGE = {
		[1] = "<player>éå§æ\195\164¾èªç©ºæåï¼æ¬ç­æ©10ç§å¾å³å°é£å¾<target>ï¼æçºæé\195\164¸åéã",
		[2] = "åå¾<target>çæå®¢è«æ³¨æï¼å³ééå³å°éå,æ¬²åå¾çæå®¢è«æ¼\195\164¸åéå§é»éã",
		[3] = "å¿«çé¿ï¼æå<target>å³ééè¶ï¼",
		[4] = "æ­å\195\164½ å¾å°\195\164ºåå¾<target>çå®ç¨æ©ç¥¨ï½",
		[5] = "è²æï¼æçå³ééå·ç§å¿«éæ\195\164ºï¼é»éçèªè¡è² è²¬",
		[6] = "å¿«é»<target>é¿ï¼è¦ç¢ºå®å°±æ¯<target>åï¼",
		[7] = "åå¥½æºååå¾<target>\195\164ºåï¼ï¼é»éï¼\195\164½ å°±æé£éå»\195\164º.....",
		[8] = "\195\164½ ç·æ¡èéæååå¸è\195\164¸ç¥åçåèªï¼é¢åçé­æ³å­è§æç¼åºå¼·ççèåï¼\195\164½ çåå¨çªç¶\195\164¸é£æ¨¡ç³\195\164¸æ¸ï¼è½ç¼é\195\164½ å°±æ¶å¤±\195\164ºã",
	};
	SERENITY_Shackle_MESSAGE = {
		["Sheep"] = {
			[1] = "<target>è®æ\195\164¸\195\164¹ç¾å©å©\195\164ºï¼",
			[2] = "ææ¯ç§ç¾\195\164ººï¼å¥ææçç¾ï¼",
			[3] = "æ­£å¨å°<target>è®ç¾",
			[4] = "å¤©ééå°ééï¼<target>ç¾å¨æ¯é»ç¾ï¼",
			[5] = "æ­£å¨å°<target>è®ç¾ï¼è...å¥æé¿ï¼",
			[6] = "æ­£å¨å°<target>ï¼æ»æåè«ç¢ºèªï¼",
			[7] = "é é¢æçç¾ï¼æééè¦ãç¾æ¯è¡«ãã",
			[8] = "<target>æ³¨æè½èï¼éè¤æèªªçè©±ãå©....",
			[9] = " >> <target> <<è¢«è®ç¾\195\164ºï¼\195\164ººå¨åå¤©å¨çï¼è«å¿é¨ææç¾ï¼",
			[10] = "<target>æ¯é»ç¾ï¼  æå°èªå·±é é¿.....",
			[11] = "<target>æ¯æçå°ç¶¿ç¾ï¼\195\164¹è¨±æå¶\195\164»é·çå¾åçï¼å¯æ¯é\195\164¸é»æå¯«åå­ï¼",
			[12] = "å©....å©....<target>ï¼æ\195\164ººéè¦ç¾æ¯åï¼?",
			[13] = "<target>ï¼ç¾å³å¯å£ççç¾èå...",
			[14] = "è®å½¢è¡æ½å±å¨<target>èº«\195\164¸ï¼å¥è¼æè§¸ç¢°æç¼çå±éªçï¼",
		},
		["Pig"] = {
			[1] = "Sooooo Weeeeee! éè£¡æé»å°è±¬ <target>ï¼å¥å·èµ°éå¡è¥èï¼",
			[2] = "è¥ç¾çè±¬è<target>....  Oink! Oink!",
			[3] = "<target> - ç¾å³å¯å£çç«è¿å¹æ ¹\195\164¸ææ²»åï¼",
			[4] = "<target>ï¼æ°é®®çè±¬è...",
			[5] = "æ\195\164½æ²çåèª¦èåèªï¼å¨èæ½åè¼çæå¼\195\164¸ï¼<target>å°è®æ\195\164¸é ­æº«é¦´çå°è±¬ï¼",
			[6] = "å¤©ééå°ééï¼<target>é¡¯åºåå½¢ï¼",
		},
		["Turtle"] = {
			[1] = "\195\164¾å§ï¼åå°¼é¾ï¼",
			[2] = "<target>æåï¼\195\164½ åè¦çµ¦æåè¬\195\164½ ååå­è³½è·çæ\195\164º\195\164ºï¼",
			[3] = "Hey <target>ï¼è½èªª\195\164½ \195\164¹æ\195\164½¿ç¾çï¼",
		},
	};
	SERENITY_STEED_MESSAGE = {
	[1] = "å¦æ\195\164¸æ¯çº\195\164ºéå<mount>ï¼æå°±\195\164¸æå¨å¤§å­¸å¤å\195\164¸å¹´\195\164ºã",
	[2] = "æéæåèªªè¦å¸¶\195\164¸æ°´ãéºµåå\195\164»éº¼\195\164¾èï¼å¦ï¼<mount>ï¼",
	[3] = "æç<mount>ååå\195\164ºæçéºµåï¼åªå¥½ååé»\195\164ºâ¦â¦",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "--> æ­£éåå³ééåå¾ <target> <--",
		[2] = "è®å½¢\195\164¸­ ==> <target>",
	};

end


--------------------------------
-- SIMPLIFIED CHINESE VERSION --
--------------------------------

function Serenity_Localization_Speech_Cn()

	SERENITY_TELEPORT_MESSAGE = {
		[1] = "ææ­£å¨\195\164¼ éèªå·±å°<target>ï¼è¯·\195\164¸è¦ææ­æå¦ã",
		[2] = "ææ³èµ·æè¿æç¹\195\164ºï¼æå¿é¡»ç«å³åå¾<target>ã",
		[3] = "555ï¼è£å¤é½å\195\164ºãæåå<target>\195\164ºå¦ï¼å»\195\164¿®è£å¤çå°æ¹æ¾æã",
		[4] = "æè¦é£å<target>\195\164ºãè¿æéè¦æå¸®å¿çå°æ¹åï¼",
		[5] = "ååï¼å \195\164¸ºæå¯\195\164»¥é£å¾<target>ï¼æççç³å°±å¯\195\164»¥ç»å®å°å¶\195\164»å°æ¹å¦ï¼",
		[6] = "è¯·\195\164¸è¦è¿å¥æçé¢ç©ºã10ç§åæå°èµ·é£åå¾<target>ã",
		[7] = "å¸æè¿æ¬¡æå¿µå¯¹\195\164ºåè¯­ã\195\164¸æ¬¡ææ¬æ³é£å¾<target>ï¼ç»ææ®éª¸æé\195\164ºæ´\195\164¸ªè¾æ³½ææ¯ï¼",
	};
	SERENITY_STUPIDSTUFF_MESSAGE = {
		[1] = "å¿«æ¥\195\164½éª<player>èªç©ºå¬å¸ç\195\164¼è´¨æå¡ï¼æ¬ç­æºåå¾<target>ã",
		[2] = "æ³¨æï¼ç¹å»æ¬\195\164¼ éé¨å¹¶\195\164¸\195\164¿è¯æ¨è½å¤å®å¨å°è¾¾<target>ã",
		[3] = "å¿«çåï¼æ\195\164¸ª\195\164¼ éé¨ï¼",
		[4] = "<player>èªç©ºå¬å¸å¾è£å¹¸\195\164¸ºæ¨æ\195\164¾åå¾<target>çåç¨é£è¡æå¡ã\195\164¸º\195\164ºé¿åææºï¼é£è¡æé´è¯·æ¨é­\195\164¸ç¼çã",
		[5] = "ééå£°æï¼æçé£è¡æ§ç§å·²ç»è¿æ\195\164ºã\195\164¸\195\164ºé£æºé£é©èªè´ï¼",
		[6] = "å¿«ç¹<target>åï¼è¦ç¡®å®å°±æ¯<target>å¦ã",
		[7] = "åå¥½åå¤åå¾<target>\195\164ºåï¼ç¹é¨ï¼\195\164¸ç¨ç¼åå¤«\195\164½ å°±å°å¦ï¼",
	};
	SERENITY_Shackle_MESSAGE = {
		["Sheep"] = {
			[1] = "<target>åæç¾å©å©\195\164ºï¼",
			[2] = "ææ¯ç§ç¾\195\164ººï¼\195\164¸è¦ç¢°æçç¾ï¼",
			[3] = "æ­£å¨å°<target>åç¾ï¼è°ææææ­è°çè¿ã",
			[4] = "å¤©èèéè«è«ï¼<target>å¿«åç¾ï¼",
			[5] = "æ­£å¨å°<target>åç¾ï¼\195\164¸è¦æ»å»å¦ï¼",
			[6] = "æ­£å¨å°<target>åç¾ï¼æ¬¢è¿\195\164½ æ¥æï¼ï¼",
			[7] = "\195\164¸è¦ææçç¾å¦ï¼æè¦æå®å»å¤§\195\164ºå¥½åªæ¯ç»æ¯è¡£å¢ã",
			[8] = "<target>å¬çï¼éå¤æè¯´çè¯ï¼å©ï¼",
			[9] = "æ­£å¨å°<target>åç¾ï¼è°æè°èªå·±æçï¼",
		},
		["Pig"] = {
			[1] = "å¤©çµçµå°çµçµï¼<target>æ¾åå½¢ï¼",
			[2] = "æ­£å¨å°<target>åçªãå¼åï¼å¼åï¼",
			[3] = "çªæ\195\164¸ææ²»ï¼",
			[4] = "å°±æ¯è¿æ ·ï¼<target>ãå°±æ¯è¿æ ·ã",
			[5] = "",
		},
		["Turtle"] = {
			[1] = "æ¥å§ï¼æ°å°¼é¾ï¼",
			[2] = "<target>æåï¼\195\164½ åè¦ç»æ\195\164»¬è®²\195\164½ ååå­èµè·çæ\195\164º\195\164ºï¼",
			[3] = "Hey <target>ï¼å¬è¯´\195\164½ \195\164¹\195\164¼\195\164½¿ç¾å¢ï¼",
		},
	};
	SERENITY_STEED_MESSAGE = {
	[1] = "å¦æ\195\164¸æ¯\195\164¸º\195\164ºè¿\195\164¸ª<mount>ï¼æå°±\195\164¸\195\164¼å¨å¤§å­¦å¤å\195\164¸å¹´\195\164ºã",
	[2] = "ææ¸¸æåè¯´è¦å¸¦\195\164¸æ°´ãé¢åå\195\164»\195\164¹æ¥çï¼å¦ï¼<mount>ï¼",
	[3] = "æç<mount>ååå\195\164ºæçé¢åï¼åªå¥½ååç¹\195\164ºâ¦â¦",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "--> æ­£å¨å¼å¯å°<target>ç\195\164¼ éé¨ <--",
		[2] = "åç¾ ==> <target>",
	};

end

-- Pour les caracté³¥s spê¤©aux :
-- Besondere Zeichen :
-- é ½ \195\169 ---- è ½ \195\168
-- à ½ \195\160 ---- â ½ \195\162
-- \195\164 ½ \195\180 ---- ê ½ \195\170
-- ë ½ \195\187 ---- \195\164 ½ \195\164
-- \195\132 = \195\132 ---- æ ½ \195\182
-- \195\150 = \195\150 ---- ì ½ \195\188
-- \195\156 = \195\156 ---- \195\159 = \195\159
-- ç ½ \195\167 ---- î ½ \195\174

