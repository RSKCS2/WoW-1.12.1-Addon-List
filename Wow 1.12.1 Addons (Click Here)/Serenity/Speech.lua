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
			[6] = "M�me un murloc est mignon une fois mouton.",
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
--  � = \195\164   � = \195\132   � = \195\182   � = \195\150   � = \195\188   � = \195\156   � = \195\159
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
		[1] = "我正在把自己傳送到<target>！請勿打斷我喔！",
		[2] = "我感應到某\195\164��東西，我必須立刻前往 <target>。",
		[3] = "靠杯!裝備都壞\195\164��！我先回<target>\195\164��喔，\195\164��裝去！",
		[4] = "我要飛回<target>\195\164��！還有要我幫忙的地方嗎？",
		[5] = "看\195\164��我該回<target>\195\164��,時間就是金錢，朋友！",
		[6] = "傳送術開始施展，十秒\195\164��後我將回到<target>。",
		[7] = "希望這次可\195\164��正確的傳送到<target>！",
	};
	SERENITY_ANYTHING_MESSAGE = {
		[1] = "<player>開始提\195\164��航空服務，本班機10秒後即將飛往<target>，持續時間\195\164��分鐘。",
		[2] = "前往<target>的旅客請注意！傳送門即將開啟,欲前往的旅客請於\195\164��分鐘內點門。",
		[3] = "快看阿！有個<target>傳送門耶！",
		[4] = "恭喜\195\164��得到\195\164��前往<target>的單程機票～",
		[5] = "聲明：我的傳送門執照快過期\195\164��，點門的自行負責",
		[6] = "快點<target>阿！要確定就是<target>喔？",
		[7] = "做好準備前往<target>\195\164��嗎？？點門！\195\164��就會飛過去\195\164��.....",
		[8] = "\195\164��緊握著雙手喃喃唸著\195\164��知名的咒語，面前的魔法六角星發出強烈的藍光，\195\164��的四周突然\195\164��陣模糊\195\164��清，轉眼間\195\164��就消失\195\164��。",
	};
	SERENITY_Shackle_MESSAGE = {
		["Sheep"] = {
			[1] = "<target>變成\195\164��\195\164��羊咩咩\195\164��！",
			[2] = "我是牧羊\195\164��，別搞我的羊！",
			[3] = "正在將<target>變羊",
			[4] = "天靈靈地靈靈，<target>現在是隻羊！",
			[5] = "正在將<target>變羊，肏...別打阿！",
			[6] = "正在將<target>！攻擊前請確認！",
			[7] = "遠離我的羊，我還需要『羊毛衫』。",
			[8] = "<target>注意聽著，重複我說的話。咩....",
			[9] = " >> <target> <<被變羊\195\164��，\195\164��在做天在看，請勿隨意打羊！",
			[10] = "<target>是隻羊！  打到自己頂阿.....",
			[11] = "<target>是我的小綿羊，\195\164��許有其\195\164��長的很像的，可是這\195\164��隻有寫名字！",
			[12] = "咩....咩....<target>，有\195\164��需要羊毛嗎？?",
			[13] = "<target>，美味可口的燉羊肉喔...",
			[14] = "變形術施展在<target>身\195\164��，別輕易觸碰會發生危險的！",
		},
		["Pig"] = {
			[1] = "Sooooo Weeeeee! 這裡有隻小豬 <target>，別偷走這塊肥肉！",
			[2] = "肥美的豬肉<target>....  Oink! Oink!",
			[3] = "<target> - 美味可口的火腿培根\195\164��明治喔！",
			[4] = "<target>：新鮮的豬肉...",
			[5] = "我\195\164��沉的吟誦著咒語，在聖潔光輝的指引\195\164��，<target>將變成\195\164��頭溫馴的小豬！",
			[6] = "天靈靈地靈靈，<target>顯出原形！",
		},
		["Turtle"] = {
			[1] = "\195\164��吧，傑尼龜！",
			[2] = "<target>朋友，\195\164��又要給我們講\195\164��和兔子賽跑的故\195\164��\195\164��？",
			[3] = "Hey <target>，聽說\195\164��\195\164��會\195\164��盾牆？",
		},
	};
	SERENITY_STEED_MESSAGE = {
	[1] = "如果\195\164��是為\195\164��這個<mount>，我就\195\164��會在大學多呆\195\164��年\195\164��。",
	[2] = "旅遊指南說要帶\195\164��水、麵包和\195\164��麼\195\164��著？哦，<mount>！",
	[3] = "我的<mount>又吃光\195\164��我的麵包！只好再做點\195\164��……",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "--> 正開啟傳送門前往 <target> <--",
		[2] = "變形\195\164�� ==> <target>",
	};

end


--------------------------------
-- SIMPLIFIED CHINESE VERSION --
--------------------------------

function Serenity_Localization_Speech_Cn()

	SERENITY_TELEPORT_MESSAGE = {
		[1] = "我正在\195\164��送自己到<target>，请\195\164��要打断我哦。",
		[2] = "我想起我还有点\195\164��，我必须立即前往<target>。",
		[3] = "555，装备都坏\195\164��。我先回<target>\195\164��哦，去\195\164��装备的地方找我。",
		[4] = "我要飞回<target>\195\164��。还有需要我帮忙的地方吗？",
		[5] = "哈哈，因\195\164��我可\195\164��飞往<target>，我的炉石就可\195\164��绑定到其\195\164��地方啦！",
		[6] = "请\195\164��要进入我的领空。10秒后我将起飞前往<target>。",
		[7] = "希望这次我念对\195\164��咒语。\195\164��次我本想飞往<target>，结果残骸撒遍\195\164��整\195\164��艾泽拉斯！",
	};
	SERENITY_STUPIDSTUFF_MESSAGE = {
		[1] = "快来\195\164��验<player>航空公司的\195\164��质服务，本班机前往<target>。",
		[2] = "注意：点击本\195\164��送门并\195\164��\195\164��证您能够安全到达<target>。",
		[3] = "快看啊！有\195\164��\195\164��送门！",
		[4] = "<player>航空公司很荣幸\195\164��您提\195\164��前往<target>的单程飞行服务。\195\164��\195\164��避免晕机，飞行期间请您闭\195\164��眼睛。",
		[5] = "郑重声明：我的飞行执照已经过期\195\164��。\195\164��\195\164��飞机风险自负！",
		[6] = "快点<target>啊，要确定就是<target>哦。",
		[7] = "做好准备前往<target>\195\164��吗？点门，\195\164��眨眼功夫\195\164��就到啦！",
	};
	SERENITY_Shackle_MESSAGE = {
		["Sheep"] = {
			[1] = "<target>变成羊咩咩\195\164��！",
			[2] = "我是牧羊\195\164��！\195\164��要碰我的羊！",
			[3] = "正在将<target>变羊，谁打我打断谁的腿。",
			[4] = "天苍苍野茫茫，<target>快变羊！",
			[5] = "正在将<target>变羊，\195\164��要攻击哦！",
			[6] = "正在将<target>变羊，欢迎\195\164��来打！？",
			[7] = "\195\164��要打我的羊哦！我要把它养大\195\164��好剪毛织毛衣呢。",
			[8] = "<target>听着！重复我说的话：咩！",
			[9] = "正在将<target>变羊！谁打谁自己扛着！",
		},
		["Pig"] = {
			[1] = "天灵灵地灵灵，<target>显原形！",
			[2] = "正在将<target>变猪。呼噜！呼噜！",
			[3] = "猪排\195\164��明治！",
			[4] = "就是这样，<target>。就是这样。",
			[5] = "",
		},
		["Turtle"] = {
			[1] = "来吧，杰尼龟！",
			[2] = "<target>朋友，\195\164��又要给我\195\164��讲\195\164��和兔子赛跑的故\195\164��\195\164��？",
			[3] = "Hey <target>，听说\195\164��\195\164��\195\164��\195\164��盾墙？",
		},
	};
	SERENITY_STEED_MESSAGE = {
	[1] = "如果\195\164��是\195\164��\195\164��这\195\164��<mount>，我就\195\164��\195\164��在大学多呆\195\164��年\195\164��。",
	[2] = "旅游指南说要带\195\164��水、面包和\195\164��\195\164��来着？哦，<mount>！",
	[3] = "我的<mount>又吃光\195\164��我的面包！只好再做点\195\164��……",
	};
	SERENITY_SHORT_MESSAGES = {
		[1] = "--> 正在开启到<target>的\195\164��送门 <--",
		[2] = "变羊 ==> <target>",
	};

end

-- Pour les caract鳥s spꤩaux :
-- Besondere Zeichen :
-- 頽 \195\169 ---- 蠽 \195\168
-- ࠽ \195\160 ---- ⠽ \195\162
-- \195\164�� \195\180 ---- ꠽ \195\170
-- 렽 \195\187 ---- \195\164�� \195\164
-- \195\132�= \195\132 ---- 栽 \195\182
-- \195\150�= \195\150 ---- 젽 \195\188
-- \195\156�= \195\156 ---- \195\159�= \195\159
-- 砽 \195\167 ----  \195\174

