--[[--------------------------------------------------
DropDownMenu.lua
Authors: mrmr
Version: 1.03.1
------------------------------------------------------
Description: JGuide DropDownMenu
	1.99a
  -- Ally addition starter version
    1.03
  -- No Changes. Just adjusting "version".
     1.99x for a beta release was a weird choise.
------------------------------------------------------
Connection:
--]]--------------------------------------------------

--jp("  DropDownMenu.lua - Memory Usage at start: " .. gcinfo())

DropDownMenuFrame1 = {
  itemCount = 3,
  items = {
    [1] = { t = "v", n = "Introduction", id = 1 },
    [2] = { t = "s", n = "Lowbie Guide" },
    [3] = { t = "s", n = "Azeroth Guide" },
  }
}

DropDownMenuFrame2Horde = {
  -- [1] = {
  ["Azeroth Guide"] = {
    itemCount = 5,
    items = {
      [1] = { t = "s", n = "12-20" },
      [2] = { t = "s", n = "20-30" },
      [3] = { t = "s", n = "30-40" },
      [4] = { t = "s", n = "40-50" },
      [5] = { t = "s", n = "50-60" },
    }
  },
  -- [2] = {
  ["Lowbie Guide"] = {
    itemCount = 3,
    items = {
      [1] = { t = "s", n = "Orcs and Trolls 1-12" },
      [2] = { t = "s", n = "Taurens 1-12" },
      [3] = { t = "s", n = "Undeads 1-12" },
    }
  },
}

DropDownMenuFrame2Ally = {
  -- [1] = {
  ["Azeroth Guide"] = {
    itemCount = 5,
    items = {
      [1] = { t = "s", n = "12-20" },
      [2] = { t = "s", n = "20-30" },
      [3] = { t = "s", n = "30-40" },
      [4] = { t = "s", n = "40-50" },
      [5] = { t = "s", n = "50-60" },
    }
  },
  -- [2] = {
  ["Lowbie Guide"] = {
    itemCount = 3,
    items = {
      [1] = { t = "s", n = "Night Elf 1-12" },
      [2] = { t = "s", n = "Gnome and Dwarf 1-12" },
      [3] = { t = "s", n = "Human 1-12" },
    }
  },
}


DropDownMenuFrame3Horde = {
  ["Orcs and Trolls 1-12"] = {
    itemCount = 3,
    items = {
      [1] = { t = "v", n = "1-6 Durotar", id = 11 },
      [2] = { t = "v", n = "6-9 Durotar", id = 12 },
      [3] = { t = "v", n = "9-12 Durotar", id = 13 },
    }
  },
  ["Taurens 1-12"] = {
    itemCount = 3,
    items = {
      [1] = { t = "v", n = "1-6 Mulgore", id = 14 },
      [2] = { t = "v", n = "6-10 Mulgore", id = 15 },
      [3] = { t = "v", n = "10-12 Mulgore", id = 16 },
    }
  },
  ["Undeads 1-12"] = {
    itemCount = 3,
    items = {
      [1] = { t = "v", n = "1-6 DeathKnell", id = 17 },
      [2] = { t = "v", n = "6-10 Tirisfal Glades", id = 18 },
      [3] = { t = "v", n = "10-12 Tirisfal Glades", id = 19 },          
    }
  },
  ["12-20"] = {
    --itemCount = 7,
    itemCount = 4,
    items = {
      --[1] = { t = "v", n = "1-6 Durotar", id = 11 },
      --[2] = { t = "v", n = "6-9 Durotar", id = 12 },
      --[3] = { t = "v", n = "9-12 Durotar", id = 13 },
      [1] = { t = "v", n = "12-15 Barrens", id = 101 },
      [2] = { t = "v", n = "15-16 Stonetalon Mountains", id = 102 },
      [3] = { t = "v", n = "16-20 Barrens PART1", id = 103 },
      [4] = { t = "v", n = "16-20 Barrens PART2", id = 104 },
    }
  },
  ["20-30"] = {
    itemCount = 10,
    items = {
      [1] = { t = "v", n = "20-21 Stonetalon Mountains", id = 201 },
      [2] = { t = "v", n = "21-21 Ashenvale", id = 202 },
      [3] = { t = "v", n = "22-23 Southern Barrens", id = 203 },
      [4] = { t = "v", n = "23-25 Stonetalon Mountains", id = 204 },
      [5] = { t = "v", n = "25-25 Southern Barrens", id = 205 },
      [6] = { t = "v", n = "25-26 Thousand Needles", id = 206 },
      [7] = { t = "v", n = "26-27 Ashenvale", id = 207 },
      [8] = { t = "v", n = "27-27 Stonetalon Mountains", id = 208 },
      [9] = { t = "v", n = "27-29 Thousand Needles", id = 209 },
      [10] = { t = "v", n = "29-30 Hillsbrad Foothills", id = 210 },
    }
  },
  ["30-40"] = {
    itemCount = 11,
    items = {
      [1] = { t = "v", n = "30-30 Alterac Mountains", id = 301 },
      [2] = { t = "v", n = "30-30 Arathi Highlands", id = 302 },
      [3] = { t = "v", n = "30-31 Stranglethorn Vale", id = 303 },
      [4] = { t = "v", n = "31-32 TN (Shimmering Flats)", id = 304 },
      [5] = { t = "v", n = "32-34 Desolace", id = 305 },
      [6] = { t = "v", n = "34-35 Stranglethorn Vale", id = 306 },
      [7] = { t = "v", n = "35-37 Arathi Highlands", id = 307 },
      [8] = { t = "v", n = "37-37 Alterac Mountains", id = 308 },
      [9] = { t = "v", n = "37-37 Thousand Needles", id = 309 },
      [10] = { t = "v", n = "37-38 Dustwallow Marsh", id = 310 },
      [11] = { t = "v", n = "38-40 Stranglethorn Vale", id = 311 },
    }
  },
  ["40-50"] = {
    itemCount = 14,
    items = {
      [1] = { t = "v", n = "40-41 Badlands", id = 401 },
      [2] = { t = "v", n = "41-42 Swamp of Sorrows", id = 402 },
      [3] = { t = "v", n = "42-43 Stranglethorn Vale", id = 403 },
      [4] = { t = "v", n = "43-43 Desolace", id = 404 },
      [5] = { t = "v", n = "43-43 Dustwallow Marsh", id = 405 },
      [6] = { t = "v", n = "43-44 Tanaris", id = 406 },
      [7] = { t = "v", n = "44-46 Feralas", id = 407 },
      [8] = { t = "v", n = "46-46 Azshara", id = 408 },
      [9] = { t = "v", n = "46-47 Hinterlands", id = 409 },
      [10] = { t = "v", n = "47-47 Stranglethorn Vale", id = 410 },
      [11] = { t = "v", n = "47-48 Searing Gorge", id = 411 },
      [12] = { t = "v", n = "48-48 Swamp of Sorrows", id = 412 },
      [13] = { t = "v", n = "48-49 Ferelas", id = 413 },
      [14] = { t = "v", n = "49-50 Tanaris", id = 414 },
    }
  },
  ["50-60"] = {
    itemCount = 14,
    items = {
      [1] = { t = "v", n = "50-50 Azshara", id = 501 },
      [2] = { t = "v", n = "50-50 Hinterlands", id = 502 },
      [3] = { t = "v", n = "50-51 Blasted Lands", id = 503 },
      [4] = { t = "v", n = "51-52 Un'Goro Crater", id = 504 },
      [5] = { t = "v", n = "52-53 Burning Steppes", id = 505 },
      [6] = { t = "v", n = "53-54 Azshara", id = 506 },
      [7] = { t = "v", n = "54-54 Felwood", id = 507 },
      [8] = { t = "v", n = "54-55 Winterspring", id = 508 },
      [9] = { t = "v", n = "55-55 Felwood", id = 509 },
      [10] = { t = "v", n = "55-55 Silithus", id = 510 },
      [11] = { t = "v", n = "56-56 Western Plaguelands", id = 511 },
      [12] = { t = "v", n = "56-57 Eastern Plaguelands", id = 512 },
      [13] = { t = "v", n = "57-59 Western Plaguelands", id = 513 },
      [14] = { t = "v", n = "58-60 Winterspring", id = 514 },
    }
  },
}

DropDownMenuFrame3Ally = {
  ["Night Elf 1-12"] = {
    itemCount = 2,
    items = {
      [1] = { t = "v", n = "1-6 Teldrassil", id = 11 },
      [2] = { t = "v", n = "6-12 Teldrassil", id = 12 },
    }
  },
  ["Gnome and Dwarf 1-12"] = {
    itemCount = 2,
    items = {
      [1] = { t = "v", n = "1-6 Cold Ridge Valley", id = 13 },
      [2] = { t = "v", n = "6-12 Dun Morogh", id = 14 },

    }
  },
  ["Human 1-12"] = {
    itemCount = 2,
    items = {
      [1] = { t = "v", n = "1-10 Elywnn Forest", id = 15 },
      [2] = { t = "v", n = "10-12 Westfall and Lock Modan", id = 16 },
         
    }
  },
  ["12-20"] = {
    --itemCount = 7,
    itemCount = 4,
    items = {
      --[1] = { t = "v", n = "1-6 Teldrassil", id = 11 },
      --[2] = { t = "v", n = "6-12 Teldrassil", id = 12 },
      [1] = { t = "v", n = "12-14 Darkshore", id = 101 },
      [2] = { t = "v", n = "14-17 Darkshore", id = 102 },
      [3] = { t = "v", n = "17-18 Loch Modan", id = 103 },
      [4] = { t = "v", n = "18-20 Redredge Mountains", id = 104 },
    }
  },
  ["20-30"] = {
    itemCount = 10,
    items = {
      [1] = { t = "v", n = "20-21 Darkshore", id = 201 },
      [2] = { t = "v", n = "21-22 Ashenvale", id = 202 },
      [3] = { t = "v", n = "22-23 Stonetalon Mountains", id = 203 },
      [4] = { t = "v", n = "23-24 Darkshore", id = 204 },
      [5] = { t = "v", n = "24-25 Ashenvale", id = 205 },
      [6] = { t = "v", n = "25-27 Wetlands", id = 206 },
      [7] = { t = "v", n = "27-28 Lakeshire", id = 207 },
      [8] = { t = "v", n = "28-29 Duskwood", id = 208 },
      [9] = { t = "v", n = "29-30 Ashenvale", id = 209 },
      [10] = { t = "v", n = "30-30 Wetlands", id = 210 },
    }
  },
  ["30-40"] = {
    itemCount = 12,
    items = {
      [1] = { t = "v", n = "30-31 Hillsbrad Foothills", id = 301 },
      [2] = { t = "v", n = "31-31 Alterac Mountains", id = 302 },
      [3] = { t = "v", n = "31-32 Arathi Highlands", id = 303 },
      [4] = { t = "v", n = "32-32 Stranglethorn Vale", id = 304 },
      [5] = { t = "v", n = "32-33 Thousand Needles (Shimmering Flats)", id = 305 },
      [6] = { t = "v", n = "33-33 Stonetalon Mountains", id = 306 },
      [7] = { t = "v", n = "33-35 Desolace", id = 307 },
      [8] = { t = "v", n = "35-36 Stranglethorn Vale", id = 308 },
      [9] = { t = "v", n = "36-37 Alterac Mountains", id = 309 },
      [10] = { t = "v", n = "37-38 Arathi Highlands", id = 310 },
      [11] = { t = "v", n = "38-38 Dustwallow Marsh", id = 311 },
      [12] = { t = "v", n = "38-40 Stranglethorn Vale", id = 312 },
    }
  },
  ["40-50"] = {
    itemCount = 13,
    items = {
      [1] = { t = "v", n = "40-41 Badlands", id = 401 },
      [2] = { t = "v", n = "41-41 Swamp of Sorrows", id = 402 },
      [3] = { t = "v", n = "41-42 Desolace", id = 403 },
      [4] = { t = "v", n = "42-43 Stranglethron Vale", id = 404 },
      [5] = { t = "v", n = "43-43 Tanaris", id = 405 },
      [6] = { t = "v", n = "43-45 Feralas", id = 406 },
      [7] = { t = "v", n = "45-46 Uldaman", id = 407 },
      [8] = { t = "v", n = "46-47 The Hinterlands", id = 408 },
      [9] = { t = "v", n = "47-47 Feralas", id = 409 },
      [10] = { t = "v", n = "47-48 Tanaris", id = 410 },
      [11] = { t = "v", n = "48-48 The Hinterlands", id = 411 },
      [12] = { t = "v", n = "48-49 Stranglethorn Vale", id = 412 },
      [13] = { t = "v", n = "49-50 Blasted Lands", id = 413 },

    }
  },
  ["50-60"] = {
    itemCount = 16,
    items = {
      [1] = { t = "v", n = "50-51 Searing Gorge", id = 501 },
      [2] = { t = "v", n = "51-52 Un’Goro Crater", id = 502 },
      [3] = { t = "v", n = "52-53 Azshara", id = 503 },
      [4] = { t = "v", n = "53-54 Felwood", id = 504 },
      [5] = { t = "v", n = "54-54 Tanaris", id = 505 },
      [6] = { t = "v", n = "54-54 Felwood", id = 506 },
      [7] = { t = "v", n = "54-55 Winterspring", id = 507 },
      [8] = { t = "v", n = "55-56 Burning Steppes", id = 508 },
      [9] = { t = "v", n = "56-56 Tanaris", id = 509 },
      [10] = { t = "v", n = "56-56 Silithus", id = 510 },
      [11] = { t = "v", n = "56-57 Western Plaguelands", id = 511 },
      [12] = { t = "v", n = "57-58 Eastern Plaguelands", id = 512 },
      [13] = { t = "v", n = "58-58 Western Plaguelands", id = 513 },
      [14] = { t = "v", n = "58-58 Eastern Plaguelands", id = 514 },
      [15] = { t = "v", n = "58-59 Western Plaguelands", id = 515 },
      [16] = { t = "v", n = "59-60 Winterspring", id = 516 },
    }
  },
}
--jp("  DropDownMenu.lua - Memory Usage at end: " .. gcinfo())