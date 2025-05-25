> **Goes without saying: always back up your files first (unless you're an adventurous risk taker)**

Here's a simple way to switch between the Steam version of PES 2021 and Football Life 2025 within the same folder.

Files needed are on Github:

https://github.com/emerald-winnie/pes21_fl25_switcher/

> NOTE:
> Don't use the .exe files if you don't trust them, stick to the .bat scripts
> Due to their behaviour of renaming files, your AV may flag them as a virus, but this is a false positive.
> What do they do?
> They literally run the corresponding .bat file in the folder which you can anaylse (more on this later).

So, I know what you're thinking, "WHY?"

Well, Football Life 2025 has everything I need:
- It's up to date
- I only play single player
- It's the most stable out of everything I've used (Evoweb causes problems for me and doesn't play nice with others)
- Without faces, you're looking at around 50-75gb
- With faces, my current file size is around 124gb.
- So, you're not dealing with 200gb - 500gb total file sizes.

But, sometimes I like to play the original PES with a modified gameplay mod, or maybe I just want to play online with a friend.

So, this is the workaround I developed to allow that without having two versions of the game installed in separate folders.

# Setup 

## Before you start

- Install PES 2021 on Steam and load it up, go through the set up and go to options > edit data and create the edit file.
- Install Football Life 2025 to a separate folder
- Install everything you want to install for FL 2025 (the updates, facepacks, soundtracks etc.)
- Make sure your Football Life 2025 is working nice and smooth. Test it out.

All done? Great. Let's kick things off.

## Prepare to transfer Football Life 2025 assets

Go to where you installed Football Life 2025 and go into the data folder. My install location was here:

`D:\Football Life 2025`

Okay, this next bit is very important, delete or rename these files (they could break stuff):

```
steam_api64.dll > a crack file we don't need > can rename to >  steam_api64.backup
steamclient64.dll >  a crack file we don't need >  can rename to >  steamclient64.backup
settings.exe > not needed > can rename to > settings.backup to avoid later confusion
```

In this repo, inside "fl25_data_folder", you will find a "convert_fl25_cpk_files.bat" file:

https://github.com/emerald-winnie/pes21_fl25_switcher/tree/main/fl25_data_folder

Place the "convert_fl25_cpk_files.bat" script inside the Football Life 2025 > data folder and run it e.g.:

`D:\Football Life 2025\Data`

What does it do? It takes the following files and changes the extension to `.fl25_cpk` (feel free to do it manually):

```
- dt00_4K_x64.cpk > dt00_4K_x64.fl25_cpk
- dt00_x64.cpk > dt00_x64.fl25_cpk
- dt10_x64.cpk > dt10_x64.fl25_cpk
- dt11_4K_x64.cpk > dt11_4K_x64.fl25_cpk
- dt11_x64.cpk > dt11_x64.fl25_cpk
- dt12_g4.cpk > dt12_g4.fl25_cpk
- dt13_all.cpk > dt13_all.fl25_cpk
- dt14_all.cpk > dt14_all.fl25_cpk
- dt15_x64.cpk > dt15_x64.fl25_cpk
- dt16_all.cpk > dt16_all.fl25_cpk
- dt17_x64.cpk > dt17_x64.fl25_cpk
- dt18_all.cpk > dt18_all.fl25_cpk
- dt19_x64.cpk > dt19_x64.fl25_cpk
- dt20_eng_x64.cpk > dt20_eng_x64.fl25_cpk
- dt20_use_x64.cpk > dt20_use_x64.fl25_cpk
- dt30_g4.cpk > dt30_g4.fl25_cpk
- dt32_g4.cpk > dt32_g4.fl25_cpk
- dt33_g4.cpk > dt33_g4.fl25_cpk
- dt34_g4.cpk > dt34_g4.fl25_cpk
- dt35_g4.cpk > dt35_g4.fl25_cpk
- dt36_g4.cpk > dt36_g4.fl25_cpk
- dt40_all.cpk > dt40_all.fl25_cpk
- dt41_eng_all.cpk > dt41_eng_all.fl25_cpk
- dt41_jpn_all.cpk > dt41_jpn_all.fl25_cpk
- dt42_all.cpk > dt42_all.fl25_cpk
- dt43_eng_all.cpk > dt43_eng_all.fl25_cpk
- dt43_jpn_all.cpk > dt43_jpn_all.fl25_cpk
- dt44_all.cpk > dt44_all.fl25_cpk
- dt70_x64.cpk > dt70_x64.fl25_cpk
```

Now, before we continue...

Make absolutely sure you have deleted or renamed the following inside the Football Life 2025 folder:

```
steam_api64.dll
steamclient64.dll
settings.exe
```

## Let's transfer

You might want to back up your Steam PES 2021 folder first, or play it risky like I do and delete everything and verify when it all goes wrong ;)

Now move all the files from the Football Life 2025 folder to your Steam PES 2021 install location and overwrite.

Try launching `PES2021.exe` it should do the following:

- Launch just fine because you've done it right.
- The game might run a general update which sometimes breaks things if the Football Life 2025 Data files are not renamed to `.fl25_cpk`
- So, make sure they are renamed.

## Update sider.ini

Now that you've transferred all the files to your Steam PES 2021 folder location, it's time to update sider.ini:

- Go to the SiderAddons folder
- Right click on sider.ini and open / edit with notepad

Now, it's time to add the PES2021.exe to it

- Under `match.stats` add `exe.name "\PES2021.exe"`
- If you have gameplay mods that have an .exe file, add it here too like: `exe.name = "\custom_gameplay.exe"`
- Where you rename custom_gameplay.exe > to the gameplay file name (provided an example with PES6 gameplay mod)

```
[sider]
debug = 0
close.on.exit = 1
start.minimized = 1
free.side.select = 1
livecpk.enabled = 1
match-stats.enabled = 1
exe.name = "\FL_2025.exe"
exe.name = "\FL 2025.PES6.exe"
exe.name = "\PES2021.exe"
```

## Stop Steam from updating your game:

Just like the above, sometimes Steam will randomly try to "update" the game even though there's nothing to update and this can break everything. So, let's stop it from doing that.

> NOTE: this method should for any game.
> So, you're welcome people of the future looking for how to stop Steam from updating games in this random guide for PES 2021.
> This will obviously make multiplayer games stop working as they require to be up-to-date.

First, make sure Steam isn't running. If it is, close it down.

Go to the Steamapps folder where the Steam version of the game is installed e.g.

> C:\Program Files (x86)\Steam\steamapps
> Maybe you installed it on the D drive?
> D:\SteamLibrary\steamapps

You are looking for this file: `appmanifest_appID.acf`
- appID = the Steam number ID of the app
- In this case it's 1259970
- So, `appmanifest_1259970.acf`

> If you are doing this for another game, go to the store page of the game and look at the url.
> The ID is here: "/app/123456/game_name/" --> appID = 123456
> e.g. Resident Evil's store url is this: https://store.steampowered.com/app/304240/Resident_Evil/
> Therefore the app manifest file for Resident Evil (304240) would be: appmanifest_304240.acf

With most games, changing "State Flags" to "4" should do the trick, so:

- Right click on the manifest
- Open with notepad
- Change the value of "State Flags" to "4". Should look like this:

```
"appid""1259970"
"universe""1"
"LauncherPath""C:\\Program Files (x86)\\Steam\\steam.exe"
"name""eFootball PES 2021 SEASON UPDATE"
"StateFlags""4"
"installdir""eFootball PES 2021"
```

For other games, you might need to update the build ID too, which you can find at: https://steamdb.info/

> So, for Resident Evil, I would go to: https://steamdb.info/app/304240/patchnotes/
> Find the latest build ID of: 16494431
> And then update it in the manifest for the build ID:
> "buildid"	"11542096" > "buildid" "16494431"

You might also decide to dive deeper and fill out the updated depot ID's, the sizes and other manifest data, which can be found by clicking on the patch inside the patch notes. This is a manual process and Steam doesn't make it easy.

> Look at the Resident Evil ones here: https://steamdb.info/patchnotes/11542096/

In this case though, simply changing the flag state to 4 is enough.

## Game folder

In this repo, there is a "game_folder" with .bat scripts and .exe files:

https://github.com/emerald-winnie/pes21_fl25_switcher/tree/main/game_folder

```
FL2025_Launcher.bat
FL2025_Launcher.exe
PES2021_Launcher.bat
PES2021_Launcher.exe
PES_Game_Launcher.bat
PES_Game_Launcher.exe
PES_Version_Switcher.bat
PES_Version_Switcher.exe
currentversion_PES21
```

Places the files where you have installed Steam PES 2021 game, default location:

`C:\Program Files (x86)\Steam\steamapps\common\eFootball PES 2021`

**If you don't like running random .exe files you've downloaded on the internet (you smart cookie) then don't download / delete them and stick to the .bat files that you can read and analyse.**

### Exe files and bat scripts explained

Because of the way the files behave, your AV might flag it. While, I can assure you it's safe, I don't want you to just willy nilly run random .exe files on your computer without taking precautions.

Here's what they do: the .exe files do is simply run the relevant .bat script.

Why create .exe files that just run .bat scripts? So, you can add them to Steam and not have to faff around too much with creating shortcuts and using command prompt.

You are welcome to do that though. Or you can create your own .exe files with something like:

https://github.com/Makazzz/BatToExePortable

**currentversion_PES21**
This is a marker file. The scripts will look for this file to determine what to rename the other files.
This will switch between `currentversion_PES21` and `currentversion_FL25` each time you run the switcher.

**PES_Version_Switcher.exe runs PES_Version_Switcher.bat**
This checks the currentversion and switches to the other.

**PES_Game_Launcher.exe runs PES_Game_Launcher.bat**
This looks at the currentversion and launches the relevant game exe.
This also launches sider.exe

By default, it will launch this .exe of Football Life 2025: FL_2025.exe

If you have a different game version, like the PES6 gameplay .exe, you can change it to that version via:

Right click on PES_Game_Launcher.bat and find this line:

`set FL25_EXE=FL_2025.exe`

Change it to your new exe e.g.

`set FL25_EXE=Custom_FL_2025.exe`

**PES2021_Launcher.exe runs PES2021_Launcher.bat**
This converts all files to the original Steam PES 2021 and then runs `PES_Game_Launcher.bat`

FL2025_Launcher.exe runs FL2025_Launcher.bat
This converts all files to Football Life 2025 and then runs `PES_Game_Launcher.bat`

## Launch options for running a different .exe or .bat for a Steam game

You can change the .exe file that Steam launches, or launch a .bat file, instead using this method (works for any game).

- Right click on PES 2021
- Add this under advanced options: `<full path to exe or bat file>" %command%`

```
Examples:
"C:\Program Files (x86)\Steam\steamapps\common\eFootball PES 2021\PES_Game_Launcher.exe" %command%
"C:\Program Files (x86)\Steam\steamapps\common\eFootball PES 2021\PES_Game_Launcher.bat" %command%
```

Alternatively, you can use something like Steam Edit: https://steamedit.tg-software.com/

Steam Edit would even allow you to create a pop-up menu of different launch options.

## Save folder

Before we get into it, the Steam version of PES 2021 needs to set up some files:

**You must run the Steam version of PES 2021 and go through the setup stage first so it creates the option, system and edit files.**

- Launch the game and go through the steps until the main menu
- At the main menu go to options > edit data
- Create the edit file.
- It will create a series of files in the save location that look like this:

```
EDIT00000000
FILELIST00000000
GRAPHICS000000
SYSTEM00000000
```

Now, you're ready for the next steps.

In this repo, you will find "save_folder" folder, which has the backups of the Football Life 2025 save files already named for you:

https://github.com/emerald-winnie/pes21_fl25_switcher/tree/main/save_folder

Alternatively, You can also find these and rename them yourself here (default location):

```
C:\Users\Username\OneDrive\Documents\KONAMI\eFootball PES 2021 SEASON UPDATE\2025\save

%USERPROFILE%\Documents\KONAMI\eFootball PES 2021 SEASON UPDATE\2025\save
```

Rename them as such:

```
EDIT00000000 > EDIT00000000.fl25_save
FILELIST00000000 > FILELIST00000000.fl25_save
GRAPHICS000000 > GRAPHICS000000.fl25_save
SYSTEM00000000 > SYSTEM00000000.fl25_save
```

- Download and copy the files from the "save_folder"
- or the ones in the "/2025/save" folder
- To the PES 2021 save location, which is usually in:

```
C:\Users\Username\OneDrive\Documents\KONAMI\eFootball PES 2021 SEASON UPDATE\76561197990587099\save`

`%USERPROFILE%\Documents\KONAMI\eFootball PES 2021 SEASON UPDATE\76561197990587099\save
```

> (optional)
> Place or create the marco.txt file in the save location.
> It is there for debugging purposes and let you know if the scripts are working. It should switch between "marco" and "polo" each time you run the switcher.

So, the save files will have the following extensions on them `.fl25_save` these are the Football Life 2025 files.

Upon running the script, it will change the ones without an extension to `.pes21_save`

Example of what I mean:

```
EDIT00000000 > EDIT00000000.pes21_save
FILELIST00000000 > FILELIST00000000.pes21_save
GRAPHICS000000 > GRAPHICS000000.pes21_save
SYSTEM00000000 > SYSTEM00000000.pes21_save

EDIT00000000.fl25_save > EDIT00000000
FILELIST00000000.fl25_save > FILELIST00000000
GRAPHICS000000.fl25_save > GRAPHICS000000
ML00000000.fl25_save > ML00000000
SYSTEM00000000.fl25_save > SYSTEM00000000

marco.txt > polo.txt
```

### Test them out and you're all done

Run the .bat files and see how they work.

Was there a better solution? Perhaps. But, this has been working fine for me.

Enjoy the game!
