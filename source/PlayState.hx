package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var _player:FlxSprite;
	private var _testObjectGroup:FlxGroup;
	private var _testObjects:Array<FlxSprite>;
	
	override public function create():Void 
	{
		FlxG.worldDivisions = 1;
		
		_testObjectGroup = new FlxGroup();
		_testObjects = new Array();
		
		var spacing = 30;
		var playerSize = 20;
		var objSize = 40;
		var objX:Float = ((FlxG.width - objSize) / 2) - objSize - spacing;
		var objY:Float = ((FlxG.height - objSize) / 2) - objSize - spacing;
		var lineStyle:LineStyle = { color: 0xFFFFFFFF, thickness: 1 };
		
		for (i in 0...9)
		{
			if (i % 3 == 0)
				objX = ((FlxG.width - objSize) / 2) - objSize - spacing;
			else if ((i - 1) % 3 == 0)
				objX = ((FlxG.width - objSize) / 2);
			else if ((i - 2) % 3 == 0)
				objX = ((FlxG.width - objSize) / 2) + objSize + spacing;
			
			if (i == 3 || i == 6)
				objY += (objSize + spacing);				
			
			_testObjects[i] = new FlxSprite(objX, objY).makeGraphic(objSize, objSize, 0xFF666666, true);
			
			if ((i - 1) % 3 == 0)
				FlxSpriteUtil.drawLine(_testObjects[i], objSize / 2, 0, objSize / 2, objSize, lineStyle);
			
			if (i > 2 && i < 6)
				FlxSpriteUtil.drawLine(_testObjects[i], 0, objSize / 2, objSize, objSize / 2, lineStyle);
			
			_testObjectGroup.add(_testObjects[i]);
		}
		
		add(_testObjectGroup);
		
		_player = new FlxSprite((FlxG.width / 2) - (playerSize / 2), (FlxG.height / 2) - (playerSize / 2)).makeGraphic(playerSize, playerSize, 0xFF00CCCC);
		_player.maxVelocity.set(100, 100);
		
		add(_player);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.overlap(_player, _testObjectGroup, test);
		
		_player.velocity.set(0, 0);
		
		if (FlxG.keys.pressed.LEFT)
			_player.velocity.x = -_player.maxVelocity.x;
		
		if (FlxG.keys.pressed.RIGHT)
			_player.velocity.x = _player.maxVelocity.x;
			
		if (FlxG.keys.pressed.UP)
			_player.velocity.y = -_player.maxVelocity.y;
		
		if (FlxG.keys.pressed.DOWN)
			_player.velocity.y = _player.maxVelocity.y;
		
		if (_player.x < 0)
			_player.x = 0;
		
		if (_player.x + _player.width > FlxG.width)
			_player.x = FlxG.width - _player.width;
		
		if (_player.y < 0)
			_player.y = 0;
		
		if (_player.y + _player.height > FlxG.height)
			_player.y = FlxG.height - _player.height;
	}
	
	private function test(obj1:FlxObject, obj2:FlxObject):Void
	{
		if (FlxG.keys.justPressed.ENTER)
			trace("justPressed");
	}
}
