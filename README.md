# HaxeFlixel-Overlap-Test
Project to demonstrate overlap issue.

The larger, gray boxes are test objects to overlap the smaller square with.
The white lines are drawn where the 4 quadrant borders are.
Move the small square with the arrow keys to overlap a test object.
While overlapping, press ENTER to print "justPressed" with trace().
If the squares overlap on a quadrant border, the keys justPressed happens multiple times.
If the small square overlaps a white line it gets justPressed twice.
If the small square overlaps 2 white lines (center square), it gets justPressed 4 times.
This is with FlxG.worldDivisions = 1.
If worldDivisions = 6, it happens in other areas too, since there are more divisions.
It happens with justReleased, too. 
