shared_script '@fiveguard/shared_fg-obfuscated.lua'
shared_script '@fiveguard/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
files {
	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/handling.meta',
	'data/**/vehiclelayouts.meta',
	'data/**/vehicles.meta',
	'data/**/*.xml',
	'data/**/*.dat',
    'data/**/*.ytyp',
}
	data_file 'HANDLING_FILE'					'data/**/handling.meta'
	data_file 'VEHICLE_METADATA_FILE'			'data/**/vehicles.meta'
	data_file 'CARCOLS_FILE'					'data/**/carcols.meta'
	data_file 'VEHICLE_VARIATION_FILE'			'data/**/carvariations.meta'
	data_file 'VEHICLE_LAYOUTS_FILE'            'data/**/vehiclelayouts.meta'
	data_file 'CONTENT_UNLOCKING_META_FILE'     'data/**/*unlocks.meta'
	data_file 'PTFXASSETINFO_FILE'              'data/**/ptfxassetinfo.meta'
client_script 'vehicle_names.lua'