extends Node

func double_population(values, traits):
	values.population = values.population * 2

func greenhouse_effect_func(values, traits):
	if values.hunger <= 1:
		values.hunger = values.hunger + 1

func chloroplast_func(values, traits):
	values.hunger = values.hunger + 2

func herbivore_func(values, traits):
	values.hunger = values.hunger + 1

func frugivore_func(values, traits):
	values.hunger = values.hunger + 1
	values.happiness = values.happiness + 1

func predator_func(values, traits):
	values.hunger = values.hunger + 2

func mimicry_func(values, traits):
	values.population = values.population + 10

func camouflage_func(values, traits):
	values.population = values.population + 10


var day_shift = [
	{
		"title":"Hermaphroditism",
		"type": "Reproduction",
		"description": "Population is not affected if Distress card targets only one gender",
		"one_time_effect": null,
		"constant_effect": "hermaphroditism",
	},

	{
		"title":"Androdioecy",
		"type": "Reproduction",
		"description": "Version of hermaphroditism. Population is not affected if Distress card targets only one gender. Instant effect: double the population",
		"one_time_effect": "population: x2",
		"constant_effect": "hermaphroditism",
	},

	{
		"title":"Gynodioecy",
		"type": "Reproduction",
		"description": "Version of hermaphroditism. Population is not affected if Distress card targets only one gender. Instant effect: double the population",
		"one_time_effect": "population: x2",
		"constant_effect": "hermaphroditism",
	},

	{
		"title":"Trioecy",
		"type": "Reproduction",
		"description": "Version of hermaphroditism. Population is not affected if Distress card targets only one gender. Instant effect: double the population",
		"one_time_effect": "population: x2",
		"constant_effect": "hermaphroditism",
	},

	{
		"title":"Fragmentation",
		"type": "Reproduction",
		"description": "Vulnerable to changing environments, parasites",
		"one_time_effect": null,
		"constant_effect": "fragmentation",
	},

	{
		"title":"Gills",
		"type": "Breath",
		"description": "Breathe underwater, always covered with moist on the ground",
		"one_time_effect": null,
		"constant_effect": "gills",
	},

	{
		"title":"Cutaneous respiration",
		"type": "Breath",
		"description": "Breathe with skin, no lungs",
		"one_time_effect": null,
		"constant_effect": "thin skin",
	},

	{
		"title":"Lungs",
		"type": "Breath",
		"description": "Breathe with oxygen",
		"one_time_effect": null,
		"constant_effect": "lungs",
	},

	{
		"title":"Immune response",
		"type": "Immune",
		"description": "Viruses has no affect",
		"one_time_effect": null,
		"constant_effect": "immune",
	},

	{
		"title":"Greenhouse effect",
		"type": "Environment Impact",
		"description": "+1 hunger if it equals 1 or less. Constant",
		"one_time_effect": null,
		"constant_effect": funcref(self, "greenhouse_effect_func"),
	},

	{
		"title":"Photosynthesis",
		"type": "Nutrition",
		"description": "Chloroplast. Convert light into chemical energy. +2 hunger",
		"one_time_effect": "hunger: +2",
		"constant_effect": null,
	},

	{
		"title":"Go ashore",
		"type": "Locomotion",
		"description": "Leave water and live on the ground",
		"one_time_effect": "training: +1",
		"constant_effect": "terrestial",
	},

	{
		"title":"Herd instinct",
		"type": " ",
		"description": "Live together (forest)",
		"one_time_effect": "discipline: +2",
		"constant_effect": null,
	},

	{
		"title":"Herbivore",
		"type": "Nutrition",
		"description": "Eat plants +1 Hunger",
		"one_time_effect": "hunger: +1",
		"constant_effect": null,
	},

	{
		"title":"Frugivore",
		"type": "Nutrition",
		"description": "Eat fruits",
		"one_time_effect": "hunger: +1; happiness: +1",
		"constant_effect": null,
	},

	{
		"title":"Xylophagous",
		"type": "Nutrition",
		"description": "Diet consists of wood",
		"one_time_effect": null,
		"constant_effect": "xylophagous",
	},

	{
		"title":"Predator",
		"type": "Nutrition",
		"description": "Eat other animals, scavenging sometimes, +2 Hunger",
		"one_time_effect": "hunger: +2",
		"constant_effect": null,
	},

	{
		"title":"Mimicry",
		"type": "Deterrent",
		"description": "Antipredator adaptation. +10 population",
		"one_time_effect": "population: +10",
		"constant_effect": null,
	},

	{
		"title":"Camouflage",
		"type": "Deterrent",
		"description": "Antipredator adaptation. +10 population",
		"one_time_effect": "population: +10",
		"constant_effect": null,
	},

	{
		"title":"Spine",
		"type": "Locomotion",
		"description": "The population grew a backbone or possibly spinal column",
		"one_time_effect": "training: +1",
		"constant_effect": "vertebrate",
	},

	{
		"title":"Thorns",
		"type": "Deterrent",
		"description": "Population protected from predators",
		"one_time_effect": null,
		"constant_effect": "deterrent",
	},

	{
		"title":"Spores",
		"type": "Reproduction",
		"description": "Seeds/eggs/spores whichever applies to the current spices",
		"one_time_effect": "training: +1",
		"constant_effect": null,
	}
]


func asteroid_func(values, traits):
	values.population = values.population - 10
	values.hunger = values.hunger - 2

func plague_func(values, traits):
	if not ('lungs' in traits):
		return
	if values.population <= 10:
		values.population = 1
	else:
		values.population = 10

func ice_age_func(values, traits):
	values.hunger = values.hunger - 2
	if 'giant' in traits:
		values.population = 0

func henatophagy_func(values, traits):
	values.hunger = values.hunger - 1

func appulse_func(values, traits):
	values.discipline = values.discipline  - 2

func giant_func(values, traits):
	values.hunger = values.hunger - 1
	traits.append("giant")

func parasites_func(values, traits):
	values.hunger = values.hunger - 1

func global_warming(values, traits):
	values.happiness = values.happiness - 1

func heterotrophism_func(values, traits):
	values.hunger = values.hunger - 1

func global_flood_func(values, traits):
	values.happiness = values.happiness - 1
	values.discipline = values.discipline  - 1

var night_shift = [
	{
		"title":"Asteroid",
		"type": "Environment Impact",
		"description": "-10 population -2 hunger",
		"one_time_effect": "population: -10; hunger: -2",
		"constant_effect": null,
	},

	{
		"title":"Virus",
		"type": "Immune",
		"description": "Virus incorporates its DNA into the host system and alters it. Randomly remove one trait. Does nothing if the population is immune",
		"one_time_effect": funcref(self, "virus_func"),
		"constant_effect": null,
	},

	{
		"title":"Plague",
		"type": "Breath",
		"description": "Population becomes 10 or 1 if current population was 10. Not affecting if population has no lungs",
		"one_time_effect": funcref(self, "plague_func"),
		"constant_effect": null,
	},

	{
		"title":"Ice Age",
		"type": "Environment Impact",
		"description": "Population of giants dies.",
		"one_time_effect": "hunger: -2",
		"constant_effect": null,
	},

	{
		"title":"Hematophagy",
		"type": "Nutrition",
		"description": "Vampire trait - has to consume blood to feed their hunger. Hunger -1 on every day",
		"one_time_effect": null,
		"constant_effect": funcref(self, "hematophagy_func"),
	},

	{
		"title":"Genetic recombination",
		"type": "Interference",
		"description": "It's time to apply extracurricular DNA samples of pink hair and scaly tail",
		"one_time_effect": funcref(self, "genetic_recombination_func"),
		"constant_effect": null,
	},

	{
		"title":"Parade of the planets",
		"type": "Environment Impact",
		"description": "Appulse. Once in a million years Mercury, Venus, Mars, Jupiter and Saturn all lined up in Space which causes a gravitational effect equal to influence of x10 Moons. Discipline -2",
		"one_time_effect": "discipline: -3",
		"constant_effect": null,
	},

	{
		"title":"Giants",
		"type": "Locomotion",
		"description": "Slow, but mighty",
		"one_time_effect": "hunger: -1",
		"constant_effect": "giants",
	},

	{
		"title":"Parasites",
		"type": "Nutrition",
		"description": "They make you to eat more",
		"one_time_effect": "hunger: -1",
		"constant_effect": null,
	},

	{
		"title":"Global warming",
		"type": "Environment Impact",
		"description": "You are a small worm on this planet, how are you going to change climate alone? It's depressing",
		"one_time_effect": "happiness: -1",
		"constant_effect": null,
	},

	{
		"title":"Heterotrophism",
		"type": "Nutrition",
		"description": "Cannot produce nutrition by itself, must consume plants or animals",
		"one_time_effect": "hunger: -1",
		"constant_effect": null,
	},

	{
		"title":"Global flood",
		"type": "Environment Impact",
		"description": "You jump on a boat, but after that you are in the new place without old friends",
		"one_time_effect": "happiness: -1; discipline: -1",
		"constant_effect": null,
	},

]

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func get_new_deck(shift):
	var deck = day_shift if shift == "day" else night_shift
	return deck.duplicate(true)

func draw_cards(n, deck):
	if deck.size() < n:
		push_error("the deck is small")

	var hand = []
	for i in range(n):
		var k = rng.randi_range(0, deck.size() - 1)
		var card = deck.pop_at(k)
		hand.append(card)
	return hand


