import 'package:calculator/model/capabilities.dart';
import 'package:units_converter/units_converter.dart';

List<Capabilities> lengthApi = [
  Capabilities('Angstroms', 'A', LENGTH.angstroms),
  Capabilities('Astronomical units', 'au', LENGTH.astronomicalUnits),
  Capabilities('Centimeters', 'cm', LENGTH.centimeters),
  Capabilities('Feet', 'ft', LENGTH.feet),
  Capabilities('Inches', 'in', LENGTH.inches),
  Capabilities('Kilometers', 'km', LENGTH.kilometers),
  Capabilities('Meters', 'm', LENGTH.meters),
  Capabilities('Millimeters', 'mm', LENGTH.millimeters),
  Capabilities('Micrometers', 'μm', LENGTH.micrometers),
  Capabilities('Miles', 'mi', LENGTH.miles),
  Capabilities('Picometers', 'pm', LENGTH.picometers),
  Capabilities('Yards', 'yd', LENGTH.yards),
  Capabilities('Light Years', 'ly', LENGTH.lightYears),
  Capabilities('Parsecs', 'pc', LENGTH.parsec),
];

List<Capabilities> areaApi = [
  Capabilities('Acres', 'ac', AREA.acres),
  Capabilities('Ares', 'a', AREA.are),
  Capabilities('Hectares', 'ha', AREA.hectares),
  Capabilities('Square Feet', 'ft²', AREA.squareFeet),
  Capabilities('Square Inches', 'in²', AREA.squareInches),
  Capabilities('square Kilometers', 'km²', AREA.squareKilometers),
  Capabilities('Square Meters', 'm²', AREA.squareMeters),
  Capabilities('Square Centimeters', 'cm²', AREA.squareCentimeters),
  Capabilities('Square Millimeters', 'mm²', AREA.squareMillimeters),
  Capabilities('Square Miles', 'mi²', AREA.squareMiles),
  Capabilities('Square Yards', 'yd²', AREA.squareYard),
];

List<Capabilities> volumeApi = [
  Capabilities('Cubic milimeters', 'mi³', VOLUME.cubicMillimeters),
  Capabilities('Cubic centimeters', 'cm³', VOLUME.cubicCentimeters),
  Capabilities('Cubic meters', 'm³', VOLUME.cubicMeters),
  Capabilities('Cubic inches', 'in³', VOLUME.cubicInches),
  Capabilities('Cubic feet', 'ft³', VOLUME.cubicFeet),
  Capabilities('Liters', 'l', VOLUME.liters),
  Capabilities('US Gallons', 'US gal', VOLUME.usGallons),
  Capabilities('Imperial Gallons', 'imp gal', VOLUME.imperialGallons),
  Capabilities('centiliters', 'cl', VOLUME.centiliters),
  Capabilities('Tablespoons', 'tsp', VOLUME.australianTablespoons),
  Capabilities('Cups', 'cup', VOLUME.cups),
  Capabilities('Pints', 'pt', VOLUME.usPints),
  Capabilities('Quarts', 'qt', VOLUME.usQuarts),
  Capabilities('Gallons', 'gal', VOLUME.usGallons),
];

List<Capabilities> timeApi = [
  Capabilities('Milliseconds', 'ms', TIME.milliseconds),
  Capabilities('Second', 's', TIME.seconds),
  Capabilities('Minutes', 'min', TIME.minutes),
  Capabilities('hours', 'h', TIME.hours),
  Capabilities('Days', 'd', TIME.days),
  Capabilities('Weeks', 'wk', TIME.weeks),
  Capabilities('Years(365)', 'y', TIME.years365),
];

List<Capabilities> tempetatureApi = [
  Capabilities('Celsius (Cuntigrade)', '°C', TEMPERATURE.celsius),
  Capabilities('Fahrenheit', '°F', TEMPERATURE.fahrenheit),
  Capabilities('Kelvin', 'K', TEMPERATURE.kelvin),
];

List<Capabilities> speedApi = [
  Capabilities('Feets per secound', 'ft/s', SPEED.feetsPerSecond),
  Capabilities('Kilometers per hour', 'km/h', SPEED.kilometersPerHour),
  Capabilities('Knots', 'kn', SPEED.knots),
  Capabilities('Meters per secound`', 'm/s', SPEED.metersPerSecond),
  Capabilities('Miles per hour', 'mi/h', SPEED.milesPerHour),
  Capabilities('Minutes per kilometer', 'min/km', SPEED.minutesPerKilometer),
  Capabilities('Knots', 'kts', SPEED.knots)
];

List<Capabilities> massApi = [
  Capabilities('Milligrams', 'mg', MASS.milligrams),
  Capabilities('Micrograms', 'μg', MASS.micrograms),
  Capabilities('Nanograms', 'ng', MASS.nanograms),
  Capabilities('Picograms', 'pg', MASS.picograms),
  Capabilities('Grams', 'g', MASS.grams),
  Capabilities('Ettograms', 'hg', MASS.ettograms),
  Capabilities('Kilograms', 'kg', MASS.kilograms),
  Capabilities('Pounds', 'lb', MASS.pounds),
  Capabilities('Tons', 't', MASS.tons),
  Capabilities('Ounces', 'oz', MASS.ounces),
  Capabilities('Stones', 'st.', MASS.stones),
  Capabilities('Carats', 'ct', MASS.carats),
  Capabilities('Pennyweights', 'dwt', MASS.pennyweights),
];

List<Capabilities> forceApi = [
  Capabilities('Newton', 'N', FORCE.newton),
  Capabilities('Kilogram force', 'kgf', FORCE.kilogramForce),
  Capabilities('Pounds force', 'lbf', FORCE.poundForce),
  Capabilities('poundal', 'pdl', FORCE.poundal),
  Capabilities('dyne', 'dyn', FORCE.dyne),
];

List<Capabilities> pressureApi = [
  Capabilities('Pascals', 'Pa', PRESSURE.pascal),
  Capabilities('Atmospheres', 'atm', PRESSURE.atmosphere),
  Capabilities('Bar', 'bar', PRESSURE.bar),
  Capabilities('Millibar', 'mbar', PRESSURE.millibar),
  Capabilities('Hectopascal', 'hPa', PRESSURE.hectoPascal),
  Capabilities('Inch of mercury', 'inHg', PRESSURE.inchOfMercury),
  Capabilities('KiloPascals', 'kPa', PRESSURE.kiloPascal),
  Capabilities('Pounds per square inch', 'psi', PRESSURE.psi),
  Capabilities('Torricelli', 'torr', PRESSURE.torr),
];

List<Capabilities> energyApi = [
  Capabilities('Calories', 'cal', ENERGY.calories),
  Capabilities('Joule', 'J', ENERGY.joules),
  Capabilities('Kilocalories', 'kcal', ENERGY.kilocalories),
  Capabilities('Kilojoule', 'kJ', ENERGY.kilojoules),
  Capabilities('Kilowatt hour', 'kWh', ENERGY.kilowattHours),
  Capabilities('Foot-pound', 'ft-lb', ENERGY.energyFootPound),
  Capabilities('Electron volt', 'eV', ENERGY.electronvolts),
];

List<Capabilities> powerAPi = [
  Capabilities('Watts', 'W', POWER.watt),
  Capabilities('Milliwatts', 'mW', POWER.milliwatt),
  Capabilities('Kilowatts', 'kW', POWER.kilowatt),
  Capabilities('Megawatts', 'MW', POWER.megawatt),
  Capabilities('Gigawatts', 'GW', POWER.gigawatt),
  Capabilities('European HorsePower', 'hp(M)', POWER.europeanHorsePower),
  Capabilities('Imperial HorsePower', 'hp(I)', POWER.imperialHorsePower),
];

List<Capabilities> anglesApi = [
  Capabilities('Degree', '°', ANGLE.degree),
  Capabilities('Minutes', "'", ANGLE.minutes),
  Capabilities('Seconds', '"', ANGLE.seconds),
  Capabilities('Radians', 'rad', ANGLE.radians),
];

List<Capabilities> shoesizeApi = [
  Capabilities('Inches', 'in', SHOE_SIZE.inches),
  Capabilities('Centimeters', 'cm', SHOE_SIZE.centimeters),
  Capabilities('European China', '', SHOE_SIZE.euChina),
  Capabilities('Japan', '', SHOE_SIZE.japan),
  Capabilities('UK India Child', '', SHOE_SIZE.ukIndiaChild),
  Capabilities('UK India Man', '', SHOE_SIZE.ukIndiaMan),
  Capabilities('UK India Woman', '', SHOE_SIZE.ukIndiaWoman),
  Capabilities('US Canada Child', '', SHOE_SIZE.usaCanadaChild),
  Capabilities('US Canada Man', '', SHOE_SIZE.usaCanadaMan),
  Capabilities('US Canada Woman', '', SHOE_SIZE.usaCanadaWoman),
];

List<Capabilities> digitaldataApi = [
  Capabilities('Bit', 'b', DIGITAL_DATA.bit),
  Capabilities('Kilobit', 'kb', DIGITAL_DATA.kilobit),
  Capabilities('Kibibit', 'Kibit', DIGITAL_DATA.kibibit),
  Capabilities('Megabit', 'Mb', DIGITAL_DATA.megabit),
  Capabilities('Mebibit', 'Mibit', DIGITAL_DATA.mebibit),
  Capabilities('Gigabit', 'Gb', DIGITAL_DATA.gigabit),
  Capabilities('Gibibit', 'Gibit', DIGITAL_DATA.gibibit),
  Capabilities('Terabit', 'Tb', DIGITAL_DATA.terabit),
  Capabilities('Tebibit', 'Tibit', DIGITAL_DATA.tebibit),
  Capabilities('Petabit', 'Pb', DIGITAL_DATA.petabit),
  Capabilities('Pebibit', 'Pibit', DIGITAL_DATA.pebibit),
  Capabilities('Byte', 'B', DIGITAL_DATA.byte),
  Capabilities('Kilobytes', 'KB', DIGITAL_DATA.kilobyte),
  Capabilities('Kibibytes', 'KiB', DIGITAL_DATA.kibibyte),
  Capabilities('Megabytes', 'MB', DIGITAL_DATA.megabyte),
  Capabilities('Mebibytes', 'MiB', DIGITAL_DATA.mebibyte),
  Capabilities('Gigabytes', 'GB', DIGITAL_DATA.gigabyte),
  Capabilities('Gibibytes', 'GiB', DIGITAL_DATA.gibibyte),
  Capabilities('Terabytes', 'TB', DIGITAL_DATA.terabyte),
  Capabilities('Tebibytes', 'TiB', DIGITAL_DATA.tebibyte),
  Capabilities('Petabytes', 'PB', DIGITAL_DATA.petabyte),
  Capabilities('Pebibytes', 'PiB', DIGITAL_DATA.pebibyte),
];

List<Capabilities> sIprefixesApi = [
  Capabilities('Base', '', SI_PREFIXES.base),
  Capabilities('Atto', 'a', SI_PREFIXES.atto),
  Capabilities('Centi-', 'c-', SI_PREFIXES.centi),
  Capabilities('Deca-', 'da-', SI_PREFIXES.deca),
  Capabilities('Deci-', 'd-', SI_PREFIXES.deci),
  Capabilities('Exa-', 'Ea-', SI_PREFIXES.exa),
  Capabilities('Femto-', 'f-', SI_PREFIXES.femto),
  Capabilities('Giga-', 'G-', SI_PREFIXES.giga),
  Capabilities('Hecto-', 'h-', SI_PREFIXES.hecto),
  Capabilities('Kilo-', 'k-', SI_PREFIXES.kilo),
  Capabilities('Mega-', 'M-', SI_PREFIXES.mega),
  Capabilities('Micro-', 'μ-', SI_PREFIXES.micro),
  Capabilities('Milli-', 'm-', SI_PREFIXES.milli),
  Capabilities('Nano-', 'n-', SI_PREFIXES.nano),
  Capabilities('Peta-', 'P-', SI_PREFIXES.peta),
  Capabilities('Pico-', 'p-', SI_PREFIXES.pico),
  Capabilities('Tera-', 'T-', SI_PREFIXES.tera),
  Capabilities('Yocto-', 'y-', SI_PREFIXES.yocto),
  Capabilities('Zepto-', 'Z-', SI_PREFIXES.zepto),
];

List<Capabilities> torqueApi = [
  Capabilities('Newtons-meters', 'N·m', TORQUE.newtonMeter),
  Capabilities('Dynes-meters', 'dyn·m', TORQUE.dyneMeter),
  Capabilities('Kilogram-Force-Meter', 'kgf·m', TORQUE.kilogramForceMeter),
  Capabilities('Pound-Force-Feet', 'lbf·ft', TORQUE.poundForceFeet),
  Capabilities('Poundal-meter', 'pdl·m', TORQUE.poundalMeter),
];

List<Capabilities> amountofsubstanceApi = [
  Capabilities('Femtometer', 'fM', AMOUNT_OF_SUBSTANCE.femtomoles),
  Capabilities('Micrometer', 'μm', AMOUNT_OF_SUBSTANCE.micromoles),
  Capabilities('Millimole', 'mmol', AMOUNT_OF_SUBSTANCE.millimoles),
  Capabilities('Mole', 'mol', AMOUNT_OF_SUBSTANCE.moles),
  Capabilities('Nanomole', 'nmol', AMOUNT_OF_SUBSTANCE.nanomoles),
  Capabilities('Picomole', 'pmol', AMOUNT_OF_SUBSTANCE.picomoles),
];

List<Capabilities> densityApi = [
  Capabilities(
      'Grams per cubic centimeter', 'g/cm³', DENSITY.gramsPerCubicCentimeter),
  Capabilities('Grams per deciliter', 'g/dl', DENSITY.gramsPerDeciliter),
  Capabilities('Grams per liter', 'g/l', DENSITY.gramsPerLiter),
  Capabilities('Grams per milliliter', 'g/ml', DENSITY.gramsPerMilliliter),
  Capabilities(
      'Kilograms per cubic meter', 'kg/m³', DENSITY.kilogramsPerCubicMeter),
  Capabilities('Kilograms per liter', 'kg/l', DENSITY.kilogramsPerLiter),
  Capabilities(
      'Micrograms per deciliter', 'μg/dl', DENSITY.microgramsPerDeciliter),
  Capabilities('Micrograms per liter', 'μg/l', DENSITY.microgramsPerLiter),
  Capabilities(
      'Micrograms per milliliter', 'μg/ml', DENSITY.microgramsPerMilliliter),
  Capabilities('Milligrams per cubic centimeter', 'mg/cm³',
      DENSITY.milligramsPerCubicCentimeter),
  Capabilities(
      'Milligrams per cubic meter', 'mg/m³', DENSITY.milligramsPerCubicMeter),
  Capabilities(
      'Milligrams per deciliter', 'mg/dl', DENSITY.milligramsPerDeciliter),
  Capabilities('Milligrams per liter', 'mg/l', DENSITY.milligramsPerLiter),
  Capabilities(
      'Milligrams per milliliter', 'mg/ml', DENSITY.milligramsPerMilliliter),
  Capabilities('Nanograms per liter', 'ng/l', DENSITY.nanogramsPerLiter),
  Capabilities(
      'Nanograms per milliliter', 'ng/ml', DENSITY.nanogramsPerMilliliter),
  Capabilities('Picograms per liter', 'pg/l', DENSITY.picogramsPerLiter),
  Capabilities(
      'Picograms per milliliter', 'pg/ml', DENSITY.picogramsPerMilliliter),
];

List<Capabilities> molarmassApi = [
  Capabilities('grams per femtomole', 'g/fmol', MOLAR_MASS.gramsPerFemtomole),
  Capabilities('grams per micromole', 'g/μmol', MOLAR_MASS.gramsPerMicromole),
  Capabilities('grams per millimole', 'g/mmol', MOLAR_MASS.gramsPerMillimole),
  Capabilities('grams per mole', 'g/mol', MOLAR_MASS.gramsPerMole),
  Capabilities('grams per nanomole', 'g/nmol', MOLAR_MASS.gramsPerNanomole),
  Capabilities('grams per picomole', 'g/pmol', MOLAR_MASS.gramsPerPicomole),
  Capabilities(
      'kilograms per millimole', 'kg/mmol', MOLAR_MASS.kilogramsPerMillimole),
  Capabilities('kilograms per mole', 'kg/mol', MOLAR_MASS.kilogramsPerMole),
  Capabilities(
      'milligrams per femtomole', 'mg/fmol', MOLAR_MASS.milligramsPerFemtomole),
  Capabilities(
      'milligrams per micromole', 'mg/μmol', MOLAR_MASS.milligramsPerMicromole),
  Capabilities(
      'milligrams per millimole', 'mg/mmol', MOLAR_MASS.milligramsPerMillimole),
  Capabilities('milligrams per mole', 'mg/mol', MOLAR_MASS.milligramsPerMole),
  Capabilities(
      'milligrams per nanomole', 'mg/nmol', MOLAR_MASS.milligramsPerNanomole),
  Capabilities(
      'milligrams per picomole', 'mg/pmol', MOLAR_MASS.milligramsPerPicomole),
];
