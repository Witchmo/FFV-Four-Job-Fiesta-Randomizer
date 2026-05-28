# FFV-Four-Job-Fiesta-Randomizer
A simple FFV Four Job Fiesta randomizer built in Godot. Features built-in .ips patch generation for applying job selection to a Super Famicom or Gameboy Advance ROM.

Unlike a traditional Four Job Fiesta, this automatically sets your character's job to the randomly chosen one. Equipment will be supplied to characters based on what the selected job can equip and what equipment the character would normally start with.

If playing on the Super Famicom version, it's recommended to use this in conjuction with the "Mime Galuf Battle Sprites in FFV" hack, unless you want an invisible Mime Galuf: https://www.romhacking.net/hacks/8668/

If playing on the Gameboy Advance version, you can use the "Galuf Bonus Job Battle Sprites in FFVA" hack to make Galuf visible when set to Mime or advance classes: https://www.romhacking.net/hacks/8672/

Usage:

1. Select your desired options.
2. Press the "Randomize" button or manually select your desired jobs.
3. Press the "Create patch" button and save the .ips file somewhere.
4. Use Lunar IPS to apply the patch to a Final Fantasy V ROM file. Lunar IPS can be found here: https://www.romhacking.net/utilities/240/
5. Enjoy!


Compatilibility:

The patch expects an unheadered ROM. This should be fully compatible with most ROM hacks, although it doesn't take into account any balance changes. If another hack has modified job stat modifiers or equipment, the patch will ignore them when initially calculating character stats but is otherwise compatible.

Obviously, don't apply a GBA patch to the Super Famicom version and vice versa.
