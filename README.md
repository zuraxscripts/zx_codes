# 🚀 FiveM ESX + OX_LIB Voucher Codes Script

A simple and powerful **FiveM** script for **ESX** servers, integrating **OX_LIB** to allow players to redeem **voucher codes** for in-game rewards like cash, items, and special perks. Perfect for **event-based giveaways**, promotions, or rewards systems on your server. 🎮

## ⚙️ Features

- **ESX + OX_LIB Integration**: Seamlessly works with ESX servers and leverages the power of OX_LIB for performance.
- **Customizable Rewards**: Assign a variety of rewards such as in-game cash 💸, items 🛠️, and special abilities ✨.
- **Easy Command Setup**: Admins can easily configure and use commands to manage voucher codes.
- **Lightweight & Efficient**: Designed to have minimal performance impact on your server.
- **Optimalization**: Runs on 0.00ms in Peak of Use!

## 🛠️ Installation

1. Download the repository or clone it into your server's resource folder.
2. Import the `IMPORT.sql` file to your Database.
3. Configure the `config.lua` file to define voucher rewards and settings.
4. Add `ensure zx_codes` to your `server.cfg`.
5. Restart your server to apply the changes.

## 🔧 Configuration

The configuration file (`config.lua`) allows you to customize:

- **Command Name**: Change the command name for admin / user commands.
- **Webhook**: Change the Log webhook ( Discord ).

```lua
Config = {}

Config.Webhook = "YOUR_DISCORD_WEBHOOK_URL" -- Change this to your Discord webhook
Config.AdminCommand = "createcode"
Config.ClaimCommand = "claim"
```
