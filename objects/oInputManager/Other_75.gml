
if (ASYNC_LOAD_TYPE == GAMEPAD_DISCOVERED)
{
    var _pad = ASYNC_LOAD_PAD;
    if (gamepad_id == GAMEPAD_DISCONNECTED)
	{
        gamepad_id = _pad;
        //show_debug_message("Gamepad discovered via Async: slot "+string(_pad));
    }
}
else if (ASYNC_LOAD_TYPE == GAMEPAD_LOST)
{
    if (ASYNC_LOAD_PAD == gamepad_id)
	{
        gamepad_id = GAMEPAD_DISCONNECTED;
        //show_debug_message("Gamepad lost via Async");
    }
}
