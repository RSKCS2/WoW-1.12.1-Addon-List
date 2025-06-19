-------------------------------------------------------------------------------
-- French localization 
-- Last update : 04/05/2006 
-- By ( Sasmira, Cosmos Team )
-------------------------------------------------------------------------------

if (GetLocale() == "frFR") then

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "D\195\169clencheur";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Cible";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Menu d\'Options";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Marque du fauve", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Don du fauve", 60, {50,60}, {"Baie sauvage","Epinette sauvage"}};
SMARTBUFF_DRUID[2] = {"Epines", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Augure de clart\195\169", 5, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Ecorce", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Forme de f\195\169lin";
SMARTBUFF_DRUID_TRACK = "Pistage des humano\195\175des";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Intelligence des arcanes", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Illumination des arcanes", 60, {56}, {"Poudre des arcanes"}};
SMARTBUFF_MAGE[2] = {"Armure de glace", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Armure de givre", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Armure du mage", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Att\195\169nuation de la magie", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Amplification de la magie", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"^Armure d%a %a+"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Mot de pouvoir : Robustesse", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Pri\195\168re de robustesse", 60, {48,60}, {"Bougie sanctifi\195\169e","Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[2] = {"Protection contre l\'Ombre", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, nil, "Pri\195\168re de protection contre l\'Ombre", 20, {56}, {"Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[3] = {"Feu int\195\169rieur", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Esprit divin", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Pri\195\168re d'Esprit", 60, {60}, {"Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[5] = {"Mot de pouvoir : Bouclier", 0.5, SMARTBUFF_CONST_SELF, {6,12,18,24,30,36,42,48,54,60}};
SMARTBUFF_PRIEST[6] = {"Gardien de la peur", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Gr\195\162ce d\'Elune", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\169action", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Garde de l\'ombre", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Toucher de faiblesse", 10, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Armure d\195\169moniaque", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Peau de d\195\169mon", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Respiration interminable", 10, SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"D\195\169tection de l\'invisibilit\195\169 sup\195\169rieure", 10, SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"D\195\169tection de l\'invisibilit\195\169", 10, SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"D\195\169tection de l\'invisibilit\195\169 Inf\195\169rieure", 10, SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Lien spirituel", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"e D\195\169mon", "^D\195\169tection %.*l'invisibilit\195\169"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura de pr\195\169cision", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Rapid Fire", 0.2, SMARTBUFF_CONST_SELF}; -- NOT TRANSLATED
SMARTBUFF_HUNTER[3] = {"Aspect du faucon", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect du singe", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect de la nature", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspect de la b\195\170te", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect d"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Bouclier de foudre", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Arme croque-roc", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Arme de glace", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Arme langue de feu", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Arme furie-des-vents", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Respiration aquatique", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Cri de guerre", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Furie berzerker", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Rage sanguinaire", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"D\195\169tection des pi\195\168ges", 3, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"D\195\169luge de lames", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Evasion", 0.2, SMARTBUFF_CONST_SELF};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Fureur vertueuse", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Bouclier divin", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Aura de d\195\169votion", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Aura de vindicte", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Aura de concentration", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Aura de r\195\169sistance \195\160 l\'ombre", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Aura de r\195\169sistance au givre", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Aura de r\195\169sistance au feu", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Aura de saintet\195\169", -1, SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"D\195\169couverte de gisements", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"D\195\169couverte d\'herbes", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"D\195\169couverte de tr\195\169sors", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Pistage des humano\195\175des", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Pistage des b\195\170tes", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Pistage des morts-vivants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Pistage des camoufl\195\169s", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Pistage des \195\169l\195\169mentaires", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Pistage des d\195\169mons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Pistage des g\195\169ants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Pistage des draconiens", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sentir les d\195\169mons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sentir les morts-vivants", -1, SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humano\195\175de";
SMARTBUFF_DEMON     = "D\195\169mon";
SMARTBUFF_BEAST     = "B\195\170te";
SMARTBUFF_DEMONTYPE = "Diablotin";

-- Mount
SMARTBUFF_MOUNT = "Augmente la vitesse de (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "ON/OFF Smart Buff";
SMARTBUFF_OFT_MENU           = "Afficher/Cacher le menu d\'options";
SMARTBUFF_OFT_AUTO           = "Rappel";
SMARTBUFF_OFT_AUTOTIMER      = "V\195\169rifier";
SMARTBUFF_OFT_AUTOCOMBAT     = "En combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Son";
SMARTBUFF_OFT_AUTOREST       = "D\195\169sactiver dans les Capitales";
SMARTBUFF_OFT_HUNTERPETS     = "Buff: Pets Chasseur";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff: Pets D\195\169mo.";
SMARTBUFF_OFT_ARULES         = "R\195\168gles avanc\195\169es";
SMARTBUFF_OFT_GRP            = "Sous Groupe Raid \195\160 Buffer";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Ouvrir le menu d\'options, lorsque \n le sous groupe a chang\195\169";
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Buffs la cible s\195\169lectionn\195\169e";
SMARTBUFF_OFT_DONE           = "Quitter";
SMARTBUFF_OFT_APPLY          = "Appliquer";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Taille: Groupe";
SMARTBUFF_OFT_MESSAGES       = "D\195\169sactiver: Message";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Avertissement";
SMARTBUFF_OFT_MSGERROR       = "Erreur";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Hide minimap-button"; -- NOT TRANSLATED
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer"; -- NOT TRANSLATED
SMARTBUFF_OFT_SELFONLY       = "Self only"; -- NOT TRANSLATED

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "ON/OFF SmartBuff";
SMARTBUFF_OFTT_AUTO          = "ON/OFF Le rappel de buff";
SMARTBUFF_OFTT_AUTOTIMER     = "D\195\169lai en secondes entre deux v\195\169rifications.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Lance une v\195\169rification en combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Affiche dans le chat un message lorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Affiche un message au milieu de l\'\195\169cran \nlorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSOUND     = "Joue un son lorsque les buffs sont expir\195\169s.";
SMARTBUFF_OFTT_AUTOREST      = "D\195\169sactiver le rappel dans les Capitales.";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff les pets de Chasseur.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff les pets de D\195\169moniste, except\195\169 le " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Ne peut \195\170tre lanc\195\169:\n- Epines sur Mages, Pr\195\170tres et D\195\169monistes\n- Intelligence des Arcanes sur des unit\195\169s sans Mana\n- Esprit Divin sur des unit\195\169s sans Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Ouvre Automatiquement le menu d\'options de SmartBuff,\nlorsque vous changez de sous groupe.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Le nombre de joueurs que vous avez \ndans le groupe pour utiliser le Buff de groupe.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Hides the SmartBuff minimap-button."; -- NOT TRANSLATED
SMARTBUFF_OFTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = Deactivated"; -- NOT TRANSLATED
SMARTBUFF_OFTT_SELFONLY      = "Buffs only your character.\nIt does not matter if you are in\na party or raid, it buffs only you."; -- NOT TRANSLATED

-- Messages
SMARTBUFF_MSG_LOADED         = "lanc\195\169";
SMARTBUFF_MSG_NOTLOADED      = "Arr\195\170t\195\169: le joueur n\'est pas un Druide/Mage/Pr\195\170tre/D\195\169moniste/Chasseur";
SMARTBUFF_MSG_DISABLED       = "Smart Buff est d\195\169sactiv\195\169";
SMARTBUFF_MSG_SUBGROUP       = "Vous venez de rejoindre un nouveau sous groupe, merci de v\195\169rifier les options!";
SMARTBUFF_MSG_NOTHINGTODO    = "STOP, IL N\'Y A PLUS RIEN A LANCER !!! Tous les Buffs sont deja lanc\195\169s ;-)";
SMARTBUFF_MSG_BUFFED         = "vient d\'\195\170tre appliqu\195\169(e)";
SMARTBUFF_MSG_OOR            = "est hors de port\195\169 pour \195\170tre buff\195\169!";
SMARTBUFF_MSG_CD             = "vient d\'expirer!";
SMARTBUFF_MSG_CHAT           = "Impossible en mode chat!";
SMARTBUFF_MSG_SHAPESHIFT     = "Le lancement du sort ne peut pas se faire sous cette forme!";
SMARTBUFF_MSG_NOACTIONSLOT   = "a besoin d\'un emplacement dans une barre d\'action pour fonctionner correctement!";
SMARTBUFF_MSG_GROUP          = "Groupe";
SMARTBUFF_MSG_NEEDS          = "a besoin de";
SMARTBUFF_MSG_OOM            = "Vous n\'avez pas assez de mana/rage/\195\169nergie!";
SMARTBUFF_MSG_STOCK          = "Stock actuel de";
SMARTBUFF_MSG_NOREAGENT      = "Plus assez de r\195\169actif:";
SMARTBUFF_MSG_DEACTIVATED    = "d\195\169sactivat\195\169!";
SMARTBUFF_MSG_REBUFF         = "Rebuff"; -- NOT TRANSLATED
SMARTBUFF_MSG_LEFT           = "left"; -- NOT TRANSLATED (meaning of "time left")

end
