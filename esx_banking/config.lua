Config = {
	Debug = false,
	DrawMarker = 10,
	Locale = GetConvar('esx:locale', 'es'),
	EnablePeds = true,
	AtmModels = {`prop_fleeca_atm`, `prop_atm_01`, `prop_atm_02`, `prop_atm_03`},
	Banks = {
		{
			Position = vector4(4802.0259, -2502.0046, 14.7941, 0.0),
			Blip = {
				Enabled = true,
				Color = 69,
				Label = 'Banco',
				Sprite = 108,
				Scale = 0.7
			}
		},
		{
			Position = vector4(5161.8516, -3865.0566, 14.7690, 0.0),
			Blip = {
				Enabled = true,
				Color = 69,
				Label = 'Banco',
				Sprite = 108,
				Scale = 0.7
			}
		},
		{
			Position = vector4(6385.6772, -2612.2024, 38.7919, 0.0),
			Blip = {
				Enabled = true,
				Color = 69,
				Label = 'Banco',
				Sprite = 108,
				Scale = 0.7
			}
		},
		{
			Position = vector4(6253.1841, -3084.3218, 32.2835, 0.0),
			Blip = {
				Enabled = true,
				Color = 69,
				Label = 'NewYork Banco Central',
				Sprite = 108,
				Scale = 0.7
			}
		},
	},
	Peds = {
		{
			Position = vector4(4800.7017, -2502.2063, 14.7938, 273.7797),
			Model = `ig_bankman`,
			Scenario = 'WORLD_HUMAN_CLIPBOARD'
		},
		{
			Position = vector4(5163.2192, -3864.7610, 14.7691, 93.7389),
			Model = `ig_bankman`,
			Scenario = 'WORLD_HUMAN_CLIPBOARD'
		},
		{
			Position = vector4(6386.8887, -2612.1416, 38.7920, 107.6879),
			Model = `ig_bankman`,
			Scenario = 'WORLD_HUMAN_CLIPBOARD'
		},
		{
			Position = vector4(6254.4155, -3085.0090, 32.2835, 63.3146),
			Model = `ig_bankman`,
			Scenario = 'WORLD_HUMAN_CLIPBOARD'
		},
	}
}
