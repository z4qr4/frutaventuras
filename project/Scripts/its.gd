extends Node

var its_data = {
	"vih": {
		"via_contagio": [
			"Contacto sexual sin protección",
			"Transfusiones de sangre contaminada",
			"Compartición de jeringas",
			"Transmisión de madre a hijo durante el embarazo o la lactancia"
		],
		"sintomas": {
			"general": [
				"Fiebre",
				"Fatiga",
				"Inflamación de ganglios linfáticos",
				"Pérdida de peso",
				"Sudores nocturnos"
			],
			"hombres": null,
			"mujeres": null
		}
	},
	"clamidia": {
		"via_contagio": [
			"Contacto sexual sin protección"
		],
		"sintomas": {
			"general": [
				"Dolor al orinar",
				"Secreción anormal"
			],
			"hombres": [
				"Secreción del pene",
				"Dolor e inflamación en los testículos"
			],
			"mujeres": [
				"Dolor abdominal",
				"Sangrado entre periodos",
				"Flujo vaginal anormal"
			]
		}
	},
	"herpes": {
		"via_contagio": [
			"Contacto directo con llagas o secreciones infectadas durante el sexo oral, vaginal o anal"
		],
		"sintomas": {
			"general": [
				"Llagas o ampollas dolorosas en los genitales o boca",
				"Picazón",
				"Ardor al orinar"
			],
			"hombres": null,
			"mujeres": null
		}
	},
	"gonorrea": {
		"via_contagio": [
			"Contacto sexual sin protección"
		],
		"sintomas": {
			"general": [
				"Dolor al orinar",
				"Secreción anormal"
			],
			"hombres": [
				"Secreción amarillenta o blanca del pene",
				"Dolor o inflamación en los testículos"
			],
			"mujeres": [
				"Aumento del flujo vaginal",
				"Sangrado entre periodos",
				"Dolor pélvico"
			]
		}
	},
	"sifilis": {
		"via_contagio": [
			"Contacto sexual sin protección",
			"De madre a hijo durante el embarazo"
		],
		"sintomas": {
			"general": [
				"Llagas indoloras (chancros)",
				"Erupciones en la piel",
				"Fiebre",
				"Fatiga"
			],
			"hombres": null,
			"mujeres": null
		}
	}
}

func list():
	return its_data.keys()

func its(its_name):
	return its_data[its_name]

