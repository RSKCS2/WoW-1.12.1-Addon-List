if not ace:LoadTranslation("ReagentFu") then

	if (GetLocale() == "enUS") then
		ReagentFuLocals = {
			NAME = "FuBar - ReagentFu",
			DESCRIPTION = "Keeps track of your reagents for buffing.",
			COMMANDS = {"/reagentfu"},
			CMD_OPTIONS = {},
			
			ARGUMENT_SHORT = "short";
			
			MENU_SHOW_SHORT_NAMES = "Show short names",
			MENU_FILTER = "Reagents",
			
			REAGENT_NONE_TO_TRACK	= "No reagents to track.",
			
			-- reagents
			--mage	
			REAGENT_ARCANE_POWDER                  = "Arcane Powder";
			REAGENT_RUNE_TELEPORT                  = "Rune of Teleportation";
			REAGENT_RUNE_PORTAL                    = "Rune of Portals";
			REAGENT_LIGHT_FEATHER		           = "Light Feather";
			-- shorttnames for Reagents
			REAGENT_SH_ARCANE_POWDER               = "Powder: ";
			REAGENT_SH_RUNE_TELEPORT               = "Teleport: ";
			REAGENT_SH_RUNE_PORTAL                 = "Portal: ";
			REAGENT_SH_LIGHT_FEATHER               = "Feather: ";
			--priest
			REAGENT_HOLY_CANDLE                    = "Holy Candle";
			REAGENT_SACRED_CANDLE                  = "Sacred Candle";
			-- shorttnames for Reagents
			REAGENT_SH_HOLY_CANDLE           = "Holy: ";
			REAGENT_SH_SACRED_CANDLE		 = "Sacred: ";
			-- rogue
			REAGENT_FLASH                    = "Flash Powder";
			REAGENT_BLIND                    = "Blinding Powder";
		    REAGENT_THISTLE                  = "Thistle Tea";
		    REAGENT_POISON_INSTANT           = "Instant Poison";
		    REAGENT_POISON_DEADLY            = "Deadly Poison";
		    REAGENT_POISON_CRIPPLING         = "Crippling Poison";
		    REAGENT_POISON_MINDNUMB          = "Mind-numbing Poison";
		    REAGENT_POISON_WOUND             = "Wound Poison";
		    --Shortnames
		    REAGENT_SH_FLASH                 = "Flash: ";
			REAGENT_SH_BLIND                 = "Blinding: ";
		    REAGENT_SH_THISTLE               = "Thistle: ";
		    REAGENT_SH_POISON                = "Poison: ";
			--druid
			REAGENT_WILDBERRY   	            = "Wild Berries";
			REAGENT_THORNROOT                  	= "Wild Thornroot";
			REAGENT_MAPLE_SEED					= "Maple Seed";
			REAGENT_STRANGLE_SEED				= "Stranglethorn Seed";
			REAGENT_ASH_SEED					= "Ashwood Seed";
			REAGENT_HORN_SEED					= "Hornbeam Seed";
			REAGENT_IRON_SEED					= "Ironwood Seed";
			--Shortnames
			REAGENT_SH_WILDBERRY				= "Berry: ";
			REAGENT_SH_THORNROOT				= "Thornroot: ";
			REAGENT_SH_MAPLE_SEED				= "Maple: ";
			REAGENT_SH_STRANGLE_SEED			= "Stranglethorn: ";
			REAGENT_SH_ASH_SEED					= "Ashwood: ";
			REAGENT_SH_HORN_SEED				= "Hornbeam: ";
			REAGENT_SH_IRON_SEED				= "Ironwood: ";
			-- Paladin
			REAGENT_SYMBOL_DIVINITY             = "Symbol of Divinity";
			REAGENT_SYMBOL_KINGS                = "Symbol of Kings";
			-- Shortnames
			REAGENT_SH_SYMBOL_DIVINITY          = "Divinity: ";
			REAGENT_SH_SYMBOL_KINGS             = "Kings: ";
		    -- Shaman
			REAGENT_ANKH                    = "Ankh";
			REAGENT_FISHSCALES              = "Shiny Fish Scales";
			REAGENT_FISHOIL                 = "Fish Oil";
		    --Shortnames
			REAGENT_SH_ANKH                 = "Ankh: ";
			REAGENT_SH_FISHSCALES           = "Scales: ";
			REAGENT_SH_FISHOIL              = "Oil: ";
			-- warlock
			REAGENT_SOULSHARD                = "Soul Shard";
			REAGENT_HEALTHSTONE              = "Healthstone";
		    REAGENT_SOULSTONE                = "Soulstone";
		    REAGENT_SPELLSTONE               = "Spellstone";
		    REAGENT_FIRESTONE                = "Firestone";
		}
	end
	
	if (GetLocale() == "deDE") then
		ReagentFuLocals = {
			NAME = "FuBar - ReagentFu",
			DESCRIPTION = "Verfolgt Ihre Reagenzien f\195\188r das Polieren.",
			COMMANDS = {"/reagentfu"},
			CMD_OPTIONS = {},
			
			ARGUMENT_SHORT = "short";
			
			MENU_SHOW_SHORT_NAMES = "Zeigen Sie kurze Namen",
			MENU_FILTER = "Reagenzien",
			
			REAGENT_NONE_TO_TRACK	= "Keine aufzusp\195\188renden Reagenzien.",
			
			-- reagents
			--mage	
			REAGENT_ARCANE_POWDER                  = "Arkanes Pulver";
			REAGENT_RUNE_TELEPORT                  = "Rune der Teleportation";
			REAGENT_RUNE_PORTAL                    = "Rune der Portale";
			REAGENT_LIGHT_FEATHER		           = "Leichte Feder";
			-- shorttnames for Reagents
			REAGENT_SH_ARCANE_POWDER               = "Pulver: ";
			REAGENT_SH_RUNE_TELEPORT               = "Teleport: ";
			REAGENT_SH_RUNE_PORTAL                 = "Portal: ";
			REAGENT_SH_LIGHT_FEATHER               = "Feder: ";
			--priest
			REAGENT_HOLY_CANDLE                    = "Heilige Kerze";
			REAGENT_SACRED_CANDLE                  = "Hochheilige Kerze";
			-- shorttnames for Reagents
			REAGENT_SH_HOLY_CANDLE          = "Heilige: ";
			REAGENT_SH_SACRED_CANDLE		= "Hochheilige: ";
			-- rogue
			REAGENT_FLASH                    = "Blitzstrahlpulver";
			REAGENT_BLIND                    = "Blendungspulver";
		    REAGENT_THISTLE                  = "Disteltee";
		    REAGENT_POISON_INSTANT           = "Sofort wirkendes Gift";
		    REAGENT_POISON_DEADLY            = "T\195\182dliches Gift";
		    REAGENT_POISON_CRIPPLING         = "Verkr\195\188ppelndes Gift";
		    REAGENT_POISON_MINDNUMB          = "Gedankenbenebelndes Gift";
		    REAGENT_POISON_WOUND             = "Wundgift";
		    --Shortnames
		    REAGENT_SH_FLASH                 = "Blitz: ";
			REAGENT_SH_BLIND                 = "Blend: ";
		    REAGENT_SH_THISTLE               = "Distel: ";
		    REAGENT_SH_POISON                = "Gift: ";
			--druid
			REAGENT_WILDBERRY   	            = "Wilde Beeren";
			REAGENT_THORNROOT                  	= "Wilder Dornwurz";
			REAGENT_MAPLE_SEED					= "Ahornsamenkorn";
			REAGENT_STRANGLE_SEED				= "Stranglethorn-Samenkorn";
			REAGENT_ASH_SEED					= "Eschenholzsamenkorn";
			REAGENT_HORN_SEED					= "Hainbuchensamenkorn";
			REAGENT_IRON_SEED					= "Eisenholzsamenkorn";
			--Shortnames
			REAGENT_SH_WILDBERRY				= "Beeren: ";
			REAGENT_SH_THORNROOT				= "Dornwurz: ";
			REAGENT_SH_MAPLE_SEED				= "Ahornholz: ";
			REAGENT_SH_STRANGLE_SEED			= "Stranglethorn: ";
			REAGENT_SH_ASH_SEED					= "Eschenholz: ";
			REAGENT_SH_HORN_SEED				= "Hainbuchen: ";
			REAGENT_SH_IRON_SEED				= "Eisenholz: ";
			-- Paladin
			REAGENT_SYMBOL_DIVINITY             = "Symbol der Offenbarung";
			REAGENT_SYMBOL_KINGS                = "Symbol der K\195\182nige";
			-- Shortnames
			REAGENT_SH_SYMBOL_DIVINITY          = "Offenb.: ";
			REAGENT_SH_SYMBOL_KINGS             = "K\195\182nige: ";
		    -- Shaman
			REAGENT_ANKH                    = "Ankh";
			REAGENT_FISHSCALES              = "Gl\195\164nzende Fischschuppen";
			REAGENT_FISHOIL                 = "Fisch\195\182l";
		    --Shortnames
			REAGENT_SH_ANKH                 = "Ankh: ";
			REAGENT_SH_FISHSCALES           = "Schuppen: ";
			REAGENT_SH_FISHOIL              = "\195\182l: ";
			-- warlock
			REAGENT_SOULSHARD             		   = "Seelensplitter";
			REAGENT_HEALTHSTONE                    = "Gesundheitsstein";
		    REAGENT_SOULSTONE                      = "Seelenstein";
		    REAGENT_SPELLSTONE                     = "Zauberstein";
		    REAGENT_FIRESTONE                      = "Feuerstein";
		}
	end
	
	if (GetLocale() == "frFR") then
		ReagentFuLocals = {
			NAME = "FuBar - ReagentFu",
			DESCRIPTION = "Compte vos r\195\169actifs pour les am\195\169liorations.",
			COMMANDS = {"/reagentfu"},
			CMD_OPTIONS = {},
			
			ARGUMENT_SHORT = "short";
			
			MENU_SHOW_SHORT_NAMES = "Montrez les noms courts ",
			MENU_FILTER = "R\195\169actifs",
			
			REAGENT_NONE_TO_TRACK	= "Aucun r\195\169actifs \195\162 compter.",
			
			-- reagents
			--mage	
			REAGENT_ARCANE_POWDER                  = "Poudre des arcanes";
			REAGENT_RUNE_TELEPORT                  = "Rune de t\195\169l\195\169portation";
			REAGENT_RUNE_PORTAL                    = "Rune des portails";
			REAGENT_LIGHT_FEATHER		           = "Plume l\195\169g\195\168re";
			-- shorttnames for Reagents
			REAGENT_SH_ARCANE_POWDER               = "Poudre: ";
			REAGENT_SH_RUNE_TELEPORT               = "T\195\169l\195\169portation: ";
			REAGENT_SH_RUNE_PORTAL                 = "Portail: ";
			REAGENT_SH_LIGHT_FEATHER               = "Plume: ";
			--priest
			REAGENT_HOLY_CANDLE                    = "Bougie sanctifi\195\169e";
			REAGENT_SACRED_CANDLE                  = "Bougie sacr\195\169e";
			-- shorttnames for Reagents
			REAGENT_SH_HOLY_CANDLE                = "Sanctifi\195\169e: ";
			REAGENT_SH_SACRED_CANDLE			  = "Sacr\195\169e: ";
			-- rogue
			REAGENT_FLASH                    = "Poudre \195\169clipsante";
			REAGENT_BLIND                    = "Poudre aveuglante";
		    REAGENT_THISTLE                  = "Th\195\169 de chardon";
		    REAGENT_POISON_INSTANT           = "Poison instantan\195\169";
		    REAGENT_POISON_DEADLY            = "Poison mortel";
		    REAGENT_POISON_CRIPPLING         = "Poison affaiblissant";
		    REAGENT_POISON_MINDNUMB          = "Poison de distraction mentale";
		    REAGENT_POISON_WOUND             = "Poison douloureux";
		    --Shortnames
		    REAGENT_SH_FLASH                 = "\195\169clipsante: ";
			REAGENT_SH_BLIND                 = "Aveuglante: ";
		    REAGENT_SH_THISTLE               = "Chardon: ";
		    REAGENT_SH_POISON                = "Poison: ";
			--druid
			REAGENT_WILDBERRY   	            = "Baie sauvage";
			REAGENT_THORNROOT                  	= "Ronceterre sauvage";
			REAGENT_MAPLE_SEED					= "Graine d'\195\169rable";
			REAGENT_STRANGLE_SEED				= "Graine de strangleronce";
			REAGENT_ASH_SEED					= "Graine de fr\195\170ne";
			REAGENT_HORN_SEED					= "Graine de charme";
			REAGENT_IRON_SEED					= "Graine de bois de fer";
			--Shortnames
			REAGENT_SH_WILDBERRY				= "Baie: ";
			REAGENT_SH_THORNROOT				= "Ronceterre: ";
			REAGENT_SH_MAPLE_SEED				= "\195\137rable: ";
			REAGENT_SH_STRANGLE_SEED			= "Strangleronce: ";
			REAGENT_SH_ASH_SEED					= "Fr\195\170ne: ";
			REAGENT_SH_HORN_SEED				= "Charme: ";
			REAGENT_SH_IRON_SEED				= "Bois de fer: ";
			-- Paladin
			REAGENT_SYMBOL_DIVINITY             = "Symbole de divinit\195\169";
			REAGENT_SYMBOL_KINGS                = "Symbole des rois";
			-- Shortnames
			REAGENT_SH_SYMBOL_DIVINITY          = "Divinit\195\169: ";
			REAGENT_SH_SYMBOL_KINGS             = "Rois: ";
		    -- Shaman
			REAGENT_ANKH                    = "Ankh";
			REAGENT_FISHSCALES              = "Ecailles de poisson brillantes";
			REAGENT_FISHOIL                 = "Huile de poisson";
		    --Shortnames
			REAGENT_SH_ANKH                 = "Ankh: ";
			REAGENT_SH_FISHSCALES           = "Ecailles: ";
			REAGENT_SH_FISHOIL              = "Huile: ";
			-- warlock
			REAGENT_SOULSHARD             		   = "Fragment d'\195\162me";
			REAGENT_HEALTHSTONE                    = "Pierre de soins";
		    REAGENT_SOULSTONE                      = "Pierre d'\195\162me";
		    REAGENT_SPELLSTONE                     = "Pierre de sort";
		    REAGENT_FIRESTONE                      = "Pierre de feu";
		}
	end
	
	ReagentFuLocals.CMD_OPTIONS = {
		{
			option = ReagentFuLocals.ARGUMENT_SHORT,
			desc = "Toggle to show short names.",
			method = "ToggleShowingShortNames"
		}
	}

end