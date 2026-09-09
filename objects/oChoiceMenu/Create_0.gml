// Options array passed from variable definitions: [{ key, scr, args }, ...]
options = options ?? [];
optionCount = array_length(options);

selectedIndex = 0;

btnWidth = 400;
btnHeight = 48;
btnSpacing = 12;

startX = (VIEWPORT_WIDTH / 2) - (btnWidth / 2);
startY = (VIEWPORT_HEIGHT / 2) - ((optionCount * (btnHeight + btnSpacing)) / 2);
