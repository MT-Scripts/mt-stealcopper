fx_version 'cerulean'

game 'gta5'

author 'PassPar2'

description 'pp2-stealboxes'

version '0.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
	'config/config.lua',
}

server_scripts{
    'server/server.lua',
}

client_scripts{
    'client/client.lua',
}

lua54 'yes'
