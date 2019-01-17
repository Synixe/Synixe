class Babel {
  class Languages {
    ar = "Arabic";
    en = "English";
    fa = "Farsi";
    fr = "French";
    gr = "Greek";
    ru = "Russian";
    vi = "Vietnamese";
    uk = "Ukrainian";
  };
  class Spoken {
    west[] = {"en"};
    east[] = {"ru"};
    independent[] = {"fa"};
    civilian[] = {"gr"};
  };
};

class RadioPresets {
  class standard {
    CHANNEL(1,ALPHA);
    CHANNEL(2,BRAVO);
    CHANNEL(3,CHARLIE);
    CHANNEL(4,DELTA);
    CHANNEL(5,ECHO);
    CHANNEL(6,FOXTROT);
    CHANNEL(7,COMMAND);
    CHANNEL(8,INTEL);
    CHANNEL(9,TRANSPORT);
    CHANNEL(10,AIR CONTROL);
    CHANNEL(11,SUPPORT);
    CHANNEL(12,MEDICAL);
  };
  class police {
    CHANNEL(1,DISPATCH);
  };
};

class RadioCallsigns {
  // NATO -- Infantry
  alpha = 1;
  bravo = 2;
  charlie = 3;
  delta = 4;
  echo = 5;
  foxtrot = 6;

  // COMMAND
  command = 7;
  goliath = 7;
  titan = 7;

  // INTEL -- Includes: Drones || Satellites || Recon Teams.
  intel = 8;
  hawkeye = 8;
  spectre = 8;

  // TRANSPORT -- APC || Car
  coyote = 10;
  badget = 10;
  wolf = 10;

  // AIR CONTROL -- CAS || Gunships
  torch = 12;
  cougar = 12;
  raptor = 12;

  // SUPPORT -- Artillery || Mortar
  hammer = 15;
  anvil = 15;
  patrot = 15;

  // MEDICAL -- Medevac Teams, Search && Rescue Teams
  medical = 16;
  angel = 16;
  guardian = 16;

  // APCO Project 2 -- Police
  adam = 1;
  boy = 2;
  charles = 3;
  david = 4;
  edward = 5;
  frank = 6;

  // Russian -- Infantry
  anna = 1;
  boris = 2;
  vasily = 3;
  gregory = 4;
  dmitri = 5;
  yelena = 6;
};
