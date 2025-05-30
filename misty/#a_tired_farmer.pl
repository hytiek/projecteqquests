## A Tired Farmer
## Quest: Part of "Ranger Epic 1.5 Pre-Quest"
## NpcID:         33150
## SpawngroupID:   54848
## Created on April 21, 2010 by mrhodes
# items: 62632, 62633

## Poem of the Storms:             62632
## Tear-stained Poem of the Storms: 62633

sub EVENT_SAY {
  if(plugin::check_hasitem($client, 62632)) { #Poem of the Storms
    if($text=~/hail/i) {
      quest::emote("looks worn out. His boots are stained with mud and his clothing is torn and frayed.");
      quest::say("Hello there. I hope things are going well for you, at least better than they are for me. I wish I had time to be more social, but I need rest before I go out and battle with the weather again.");
    }
    if($text=~/friend of the storm lord/i) {
      quest::say("Please, not another lecture. I know, I know, I need to accept that it will rain when it rains. Rain is good, it grows my crops. I understand all that. But now the rain is rotting my crops on the vine. It's flooding out my seeds. It's ruining me. I want to remain true to Karana, but I can't be quiet while my family and friends starve. I understand why Karana is worthy of worship. I want to have faith, but I just can't afford to feed my family without my crops!");
    }
  }
}

sub EVENT_ITEM {
  if (quest::handin({"platinum" => 300, 62632 => 1})) { #300pp and Poem of the Storms
    $client->Message(0,"The farmer looks at you with a stunned expression on his face. He carefully sets the coins down in a neat stack on the ground and slowly unfolds the paper. As he reads the poem, heavy tears form in the corners of his eyes and drop onto the page. When he is done reading he carefully folds it back up and hands the page back to you. He then wipes his nose with his sleeve.");
    quest::spawn2(33159, 0, 0, -1152, -362, 1.19, 0); #a_faithful_farmer
    quest::say("I think I understand a little better about faith. Maybe my faith brought you here, maybe yours did, I don't know. I don't think it matters. You've shown me something about kindness as well. Thank you so much!");
    quest::summonitem(62633); #Tear-stained Poem of the Storms
    quest::depop_withtimer();
  }
}

sub EVENT_SPAWN {
   quest::depop(33159); #a_faithful_farmer
}