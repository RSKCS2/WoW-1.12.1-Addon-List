-- Initialize data
FrowningCircle_Data = {
  IDs = {
    [1] = {};
    [2] = {};
    [3] = {};
    [4] = {};
  };
  -- Spellname to be used by CastSpellByName
  Spells = {
    [1] = {};
    [2] = {};
    [3] = {};
    [4] = {};
  };
  Totems = {
    [1] = {};
    [2] = {};
    [3] = {};
    [4] = {};
  };
  Offensive = {
    [1] = {};
    [2] = {};
    [3] = {};
    [4] = {};
  };

  Initialized = false;
};

FrowningCircle_TotemDB = {
	["EARTHBIND TOTEM"] = "Earth",
	["STONECLAW TOTEM"] = "Earth",
	["STONESKIN TOTEM"] = "Earth",
	["STRENGTH OF EARTH TOTEM"] = "Earth",
	["TREMOR TOTEM"] = "Earth",
	["FIRE NOVA TOTEM"] = "Fire",
	["MAGMA TOTEM"] = "Fire",
	["SEARING TOTEM"] = "Fire",
	["FLAMETONGUE TOTEM"] = "Fire",
	["FROST RESISTANCE TOTEM"] = "Fire",
	["FIRE RESISTANCE TOTEM"] = "Water",
	["DISEASE CLEANSING TOTEM"] = "Water",
	["HEALING STREAM TOTEM"] = "Water",
	["MANA SPRING TOTEM"] = "Water",
	["POISON CLEANSING TOTEM"] = "Water",
	["GRACE OF AIR TOTEM"] = "Air",
	["GROUNDING TOTEM"] = "Air",
	["NATURE RESISTANCE TOTEM"] = "Air",
	["SENTRY TOTEM"] = "Air",
	["WINDFURY TOTEM"] = "Air",
	["WINDWALL TOTEM"] = "Air",
	["TRANQUIL AIR TOTEM"] = "Air",
};


function FrowningCircle_ScanSpells()

  local count = {};
  count[1] = 2;
  count[2] = 2;
  count[3] = 2;
  count[4] = 2;

  local last = nil;
  local i = 1

  while true do

    local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL);
    if not spellName then
      break;
    end

    if (string.find(spellName, '.* Totem$') ~= nil) then

      local school = nil;
      local schoolname = FrowningCircle_TotemDB[string.upper(spellName)];
        
        if (schoolname ~= nil) then
          local j = 0;
          for j=1, 4 do
            if (TotemSchools[j] == schoolname) then
              school = j;
              
              break;
            end
          end
        end


      if (school ~= nil) then
        if (last == spellName) then
          count[school] = count[school] - 1;
        else
          last = spellName;
        end

        FrowningCircle_Data.Offensive[school][count[school]] = FrowningCircle_TotemIsOffensive();
        FrowningCircle_Data.Spells[school][count[school]] = spellName .. '(' .. spellRank .. ')';
        FrowningCircle_Data.Totems[school][count[school]] = spellName;
        FrowningCircle_Data.IDs[school][count[school]] = i;
	 
        count[school] = count[school] + 1;
       end
    end

    i = i + 1
  end


  for i = 1, 4 do
    for j = count[i], 7 do
      FrowningCircle_Data.Offensive[i][j] = nil;
      FrowningCircle_Data.Spells[i][j] = nil;
      FrowningCircle_Data.Totems[i][j] = nil;
      FrowningCircle_Data.IDs[i][j] = nil;
    end
  end

  FrowningCircle_Data.Initialized = true;
end

function FrowningCircle_TotemIsOffensive()
  local i, j;
  for i = 1, TotemHTT:NumLines() do
    local text = getglobal("TotemHTTTextLeft" .. i);
    j = 1;
    while (FrowningCircle_OffensiveDetection[j] ~= nil) do
      if (string.find(text:GetText(), FrowningCircle_OffensiveDetection[j]) ~= nil) then
        return true;
      end
      j = j + 1;
    end
    j = 1;
    while (FrowningCircle_FriendlyDetection[j] ~= nil) do
      if (string.find(text:GetText(), FrowningCircle_FriendlyDetection[j]) ~= nil) then
        return false;
      end
      j = j + 1;
    end
  end
  return true;
end