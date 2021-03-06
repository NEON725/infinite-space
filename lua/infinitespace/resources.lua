BASE_RESOURCE=
{
	volume=1,
	equivalents={},
	type="gas",
	abstract=false
}
IS_RESOURCES=
{
	Heating=
	{
		abstract=true,
		type="energy",
		equivalents=
		{
			["LV Electricity"]=1,
			["MV Electricity"]=5,
			["HV Electricity"]=25
		}
	},
	Cooling=
	{
		abstract=true,
		type="energy",
		equivalents=
		{
			Water=1,
			["Liquid Nitrogen"]=20,
			["Liquid Hydrogen"]=20
		}
	},
	Oxygen={},
	Nitrogen={},
	Hydrogen={},
	["Vespene Gas"]={volume=5},
	Water={type="liquid",volume=3},
	["Carbon Dioxide"]={volume=3},
	["LV Electricity"]=
	{
		type="energy",
		equivalents=
		{
			["MV Electricity"]=5,
			["HV Electricity"]=25
		}
	},
	["MV Electricity"]=
	{
		type="energy",
		equivalents={["HV Electricity"]=5}
	},
	["HV Electricity"]={type="energy"},
	Energy=
	{
		type="energy",
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
	if(tab.equivalents==BASE_RESOURCE.equivalents) then tab.equivalents={} end
	tab.equivalents[res]=1
end

function GetEquivalencyRatio(wanted,offered)
	return GetResourceData(wanted).equivalents[offered]
end

function GetResourceData(wanted) return IS_RESOURCES[wanted] end
