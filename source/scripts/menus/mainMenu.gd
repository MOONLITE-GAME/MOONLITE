extends Control

var stringRNG = RandomNumberGenerator.new();
var rndmString:int;
var curButton:int = 1;
var textSpeed:float = 350.0;

func _ready() -> void:
	rndmString = stringRNG.randi_range(1, 12);

func _process(delta: float) -> void:
	$text.position.x -= textSpeed * delta;
	
	if $text.position.x < -10000:
		$text.position.x = 967;
		rndmString = stringRNG.randi_range(1, 12);

	match rndmString:
		1:
			$text.text = "VERSION ALPHA 0.0.3 - COMPLETE ENGINE REWRITE";
		2:
			$text.text = "BROUGHT TO YOU BY RED ECLIPSE STUDIO";
		3:
			$text.text = "THE FATE OF THE UNIVERSE DEPENDS ON YOU. WHAT ARE YOU WAITING FOR?";
		4: 
			$text.text = "SHOUTOUT TO MY MOM. I LOVE YOU MOM";
		5:
			$text.text = "PLEASE DON'T BLAM US. WE'RE TRYING OUR BEST";
		6:
			$text.text = "A GAME FOR SOCIOPATHS, LOSERS, AND ALL SORTS OF OTHER FREAKS";
		7:
			$text.text = "MAN, I COULD GO FOR SOME CHICKEN RIGHT NOW";
		8:
			$text.text = "THIS ONE'S FOR YOU, HARAMBE";
		9:
			$text.text = "WARNING: THIS PRODUCT CONTAINS BLACK PEOPLE (literally)";
		10:
			$text.text = "IN LOVING MEMORY OF CHARLIE KIRK";
		11:
			$text.text = "THE ANSWER IS DIVINE INTELLECT";
		12:
			$text.text = "NOT FUNDED BY THE IDF";
