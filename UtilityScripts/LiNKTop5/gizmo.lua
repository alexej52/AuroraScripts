local Gizmo = {};         -- public namespace
local GP = {};            -- private namespace
local Xui = {};

function Gizmo.run( scriptData )
  local hGizmo = GizmoUI.CreateInstance();
  if hGizmo ~= nil then  
    hGizmo:RegisterCallback( XuiMessage.Init, GP.fnOnInit ); 
    hGizmo:RegisterCallback( XuiMessage.Command, GP.fnOnCommand );    
    
    return hGizmo:InvokeUI(Script.GetBasePath(), "LiNK Top 5", "scene.xur", "skin.xur", scriptData );
  end
end

function GP.fnOnInit( this, initData )
  -- Find our total controls 
  Xui["totalusers"] = this:RegisterControl( XuiObject.Label, "totalusers" );
  Xui["totalonline"] = this:RegisterControl( XuiObject.Label, "totalonline" );

  -- Find our game1 controls 
  Xui["g1img"] = this:RegisterControl( XuiObject.Image, "game1img" );
  Xui["g1title"] = this:RegisterControl( XuiObject.Label, "game1title" );
  Xui["g1users"] = this:RegisterControl( XuiObject.Label, "game1users" );
  
  -- Find our game2 controls 
  Xui["g2img"] = this:RegisterControl( XuiObject.Image, "game2img" );
  Xui["g2title"] = this:RegisterControl( XuiObject.Label, "game2title" );
  Xui["g2users"] = this:RegisterControl( XuiObject.Label, "game2users" );

  -- Find our game3 controls 
  Xui["g3img"] = this:RegisterControl( XuiObject.Image, "game3img" );
  Xui["g3title"] = this:RegisterControl( XuiObject.Label, "game3title" );
  Xui["g3users"] = this:RegisterControl( XuiObject.Label, "game3users" );

  -- Find our game4 controls 
  Xui["g4img"] = this:RegisterControl( XuiObject.Image, "game4img" );
  Xui["g4title"] = this:RegisterControl( XuiObject.Label, "game4title" );
  Xui["g4users"] = this:RegisterControl( XuiObject.Label, "game4users" );

  -- Find our game5 controls 
  Xui["g5img"] = this:RegisterControl( XuiObject.Image, "game5img" );
  Xui["g5title"] = this:RegisterControl( XuiObject.Label, "game5title" );
  Xui["g5users"] = this:RegisterControl( XuiObject.Label, "game5users" );  
 
  -- Disable the A button
  this:SetCommandEnabled( GizmoCommand.A, true ); 
  this:SetCommandText( GizmoCommand.A, "Refresh" );
 
  -- Apply total counts 
  Xui.totalusers:SetText( (initData.total) .. " Users" );
  Xui.totalonline:SetText( (initData.online) .. " Players Online" );
  
 
  -- Apply images
  Xui.g1img:SetImagePath( "gameicons\\" .. initData.rooms[1].titleid .. ".png" );
  Xui.g2img:SetImagePath( "gameicons\\" .. initData.rooms[2].titleid .. ".png" );
  Xui.g3img:SetImagePath( "gameicons\\" .. initData.rooms[3].titleid .. ".png" );
  Xui.g4img:SetImagePath( "gameicons\\" .. initData.rooms[4].titleid .. ".png" );
  Xui.g5img:SetImagePath( "gameicons\\" .. initData.rooms[5].titleid .. ".png" );
  
  -- Apply Titles 
  Xui.g1title:SetText( initData.rooms[1].room );
  Xui.g2title:SetText( initData.rooms[2].room );
  Xui.g3title:SetText( initData.rooms[3].room );
  Xui.g4title:SetText( initData.rooms[4].room );
  Xui.g5title:SetText( initData.rooms[5].room );
  
  -- Apply Player Count 
  Xui.g1users:SetText( (initData.rooms[1].users) .. " Players" );
  Xui.g2users:SetText( (initData.rooms[2].users) .. " Players" );
  Xui.g3users:SetText( (initData.rooms[3].users) .. " Players" );
  Xui.g4users:SetText( (initData.rooms[4].users) .. " Players" );
  Xui.g5users:SetText( (initData.rooms[5].users) .. " Players" );    
end

function GP.fnOnCommand( this, commandType )
  if commandType == GizmoCommand.A then
    -- A button was pressed- so let's dismiss our UI and refresh
    this:Dismiss("refresh");  
  end
end 

-- Return our script functionality
return Gizmo;