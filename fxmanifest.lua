fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version "1.1.0"
author "ZuraxDev"
description "OX Compensation to ESX Version"

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua',
} 
client_script 'client/*.lua'