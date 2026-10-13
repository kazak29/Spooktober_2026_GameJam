//continue line sequence 1 frame after surface is saved
if lineStop {
	with oDirector { LineProgress(1, true); }
	lineStop = false;
}