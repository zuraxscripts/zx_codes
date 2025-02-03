fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "ZuraxDev"
description "OX Compensation to ESX Version"

shared_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

server_script 'server/*.lua'
client_script 'client/*.lua'