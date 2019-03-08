program helico;
{$UNIPATH\SDL2}

uses SDL2;
VAR
sdlSurface1:PSDL_Surface;
sdlWindow1:PSDL_Window;
sdlRectangle:TSDL_Rect;
sdlRenderer:PSDL_Renderer;
sdlTexture1:PSDL_Texture;


BEGIN

//initialisation des trucs
if SDL_Init(SDL_INIT_VIDEO)<0 then HALT;

if SDL_CreateWindowAndrenderer (500,500,SDL_WINDOW_SHOWN,@sdlWindow1,@sdlRenderer)<>0 then HALT;

//reglage echelle
SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY,'nearest');


//image
sdlSurface1:=SDL_LoadBMP('rider.bmp');
IF sdlSurface1=nil THEN Halt;

//chargement image dos
sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer,sdlSurface1);
IF sdlTexture1=nil THEN Halt;

if SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,nil)<>0 then Halt;


//rectangle
sdlRectangle.x := 12;
sdlRectangle.y := 25;
sdlRectangle.h := 178;
sdlRectangle.w := 116;

//texturemachin
SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,@sdlRectangle);

{
if SDL_CreateWindowAndRenderer(500,500,SDL_WINDOW_SHOWN,@sdlWindow1,@sdlRenderer) <> then HALT;}

SDL_RenderPresent(sdlRenderer);
SDL_Delay(10000);
SDL_DestroyTexture(sdlTexture1);
SDL_FreeSurface(sdlSurface1);
SDL_DestroyRenderer(sdlRenderer);
SDL_DestroyWindow(sdlWindow1);
SDL_Quit;
















END.
