package;

import flixel.ui.FlxButton;
import flixel.ui.FlxSpriteButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class DisclaimerSubState extends MusicBeatState
{
    public static var isFlashing:Bool = true;
    var cooldownman:Bool = true;

    var cooltxt:FlxText;
  

    override function create()
    {
        super.create();
        DiscordClient.changePresence("In the disclaimer", null);

        if (Date.now().getHours() == 3)
        {
            var funnitxt = new FlxText(0, 640, FlxG.height / 2 - 600, 'OMG VEK AT 3 AM!!!!', 32);
            funnitxt.x = FlxG.width / 2 - 165;
            funnitxt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(255, 0, 0));
            funnitxt.borderColor = FlxColor.BLACK;
            funnitxt.borderSize = 3;
            funnitxt.borderStyle = FlxTextBorderStyle.OUTLINE;
            add(funnitxt);
        }

        var txt:FlxText = new FlxText(0, 0, FlxG.height, 
            'WARNING! PLEASE READ!' 
            + "\nThis mod contains flashing lights,"
            + "\nso if you have epilepsy or some shit, talk to a doctor"
            + "\n(idk what should you do tbh just don't play the mod ig)"
            + '\n(Oh also you can toggle them by pressing f)'
            + '\n'
            + '\n'
            + '\nPRESS ENTER TO CONTINUE OR ESC TO GO BACK',
            32);

        txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
        
        cooltxt = new FlxText(0, 640, FlxG.height / 2, 'if you are reading this, you are a retard B)', 32);
        cooltxt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
        cooltxt.borderColor = FlxColor.BLACK;
        cooltxt.borderSize = 3;
        cooltxt.borderStyle = FlxTextBorderStyle.OUTLINE;
        cooltxt.alpha = 0;
        add(cooltxt);

    
        var fard:FlxButton = new FlxButton(FlxG.width / 2 - 50, FlxG.height / 2 + 100, "fard", function()
        {
            FlxG.sound.play(Paths.sound('Fard'));
        });

        FlxG.mouse.visible = true;
    }

    
    override function update(elapsed:Float)
    {
        if (controls.ACCEPT)
        {
            FlxG.sound.play(Paths.sound('funniAmogus'));
            FlxG.switchState(new MainMenuState());
            FlxG.mouse.visible = false;
        }
        if (controls.BACK)
        {
            FlxG.switchState(new TitleState());
        }
        if (FlxG.keys.justPressed.F)
        {
            if (isFlashing == true)
            {
                if (cooldownman == true)
                {
                    cooldownman = false;
                    cooltxt.text = 'Flashing lights disabled';
                    FlxG.sound.play(Paths.sound('toggleflashsound'));
                    cooltxt.alpha = 100;
                    FlxTween.tween(cooltxt, {alpha: 0}, 1, {
                        onComplete: function(tween:FlxTween)
                        {
                            cooldownman = true;
                        }
                    });
                    isFlashing = false;
                }
            }
            else if (isFlashing == false)
            {
                if (cooldownman == true)
                {
                    cooldownman = false;
                    cooltxt.text = 'Flashing lights enabled';
                    FlxG.sound.play(Paths.sound('toggleflashsound'));
                    cooltxt.alpha = 100;
                    FlxTween.tween(cooltxt, {alpha: 0}, 1, {
                        onComplete: function(tween:FlxTween)
                        {
                            cooldownman = true;
                        }
                    });
                    isFlashing = true;
                }
            }

        }
        super.update(elapsed);
    }
}