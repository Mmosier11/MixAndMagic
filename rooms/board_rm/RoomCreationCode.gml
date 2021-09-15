// game initialization script

// declare variables and initialize

	// width x height of board
	globalvar boardWidth, boardHeight;
	boardWidth = 4;
	boardHeight = 3;
	
	// vars for deck
	globalvar deck;
	deck = ds_list_create();
	
	// vars for board
	globalvar board;
	var xx, yy, i, j;
	
	// initialize instance
	var instance_lyr = layer_get_id("Instances_1");
	
	// variable for turn count and shuffle count
	globalvar turnCount;
	turnCount = 0;
	globalvar turnsToShuffle;
	turnsToShuffle = 5;

// create cards on board
xx = 10;
// outer loop along width
for (i = 0; i < boardWidth; i++){
	// inner loop along height
	yy = 350;
	for (j = 0; j < boardHeight; j++) {
		// create card
		board[i, j] = instance_create_layer(xx, yy, instance_lyr, card_obj);
		
		// offset new card by size of old card plus distance in between cards
		yy += sprite_get_height(card_back_spr);
		}
		
		// offset new card by width of old card plus distance in between cards
		xx += sprite_get_width(card_back_spr) - 10;
	}
	
// randomize deck order
ds_list_add(deck, "air", "air", 
				  "earth", "earth", 
				  "fire", "fire", 
				  "water", "water", 
				  "spirit", "spirit", 
				  "shadow", "shadow");

// randomize deck order
randomize();
for (i = 0; i < 10; i++){
	ds_list_shuffle(deck);
	}


show_debug_message(string(ds_list_size(deck)));
for (i = 0; i < 12; i++;){
	show_debug_message(ds_list_find_value(deck, i));
	}
				  