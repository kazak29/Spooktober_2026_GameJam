
textboxWidth = 200;
textboxHeight = 64;

border = 8;

line_separation = 12
line_width = textboxWidth - (border*2);



page = 0;
pageNumber = 0;
text[0] = "";
textLength[0] = string_length(text[0]);
drawChar = 0;
textSpeed = 1;

setup = false;

x = VIEWPORT_WIDTH / 2;
y = VIEWPORT_HEIGHT - textboxHeight - 30;
