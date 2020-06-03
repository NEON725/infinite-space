BASE_RESOURCE=
{
	volume=1,
	equivalents={},
	type="Gas"
}
IS_RESOURCES=
{
	Oxygen={},
	Nitrogen={},
	Hydrogen={},
	["Vespene Gas"]={type="Liquid",volume=5},
	Water={type="Liquid",volume=3},
	["Carbon Dioxide"]={volume=3},
	["LV Electricity"]=
	{
		type="Energy",
		equivalents=
		{
			["MV Electricity"]=5,
			["HV Electricity"]=25
		}
	},
	["MV Electricity"]=
	{
		type="Energy",
		equivalents={["HV Electricity"]=5}
	},
	["HV Electricity"]={type="Energy"},
	Energy=
	{
		type="Energy",
		equivalents=
		{
			["LV Electricity"]=1,
			["MV Electricity"]=5,
			["HV Electricity"]=25
		}
	}
}

for res,tab in pairs(IS_RESOURCES)
do
	for i,v in pairs(BASE_RESOURCE)
	do
		if tab[i]==nil then tab[i]=v end
	end
end

function GetEquivalencyRatio(wanted,offered)
	return GetResourceData(wanted).equivalents[offered]
end

function GetResourceData(wanted) return IS_RESOURCES[wanted] end
