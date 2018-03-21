package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy14:img%2Fchip.pngy4:sizei1016y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y17:img%2Fc_arrow.pngR2i890R3R4R5R7R6tgoR0y18:img%2Fc_cursor.pngR2i932R3R4R5R8R6tgoR0y16:img%2Fc_hero.pngR2i2867R3R4R5R9R6tgoR0y18:img%2Fpanorama.pngR2i95417R3R4R5R10R6tgoR0y18:img%2Fstage0-0.csvR2i6036R3y4:TEXTR5R11R6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_chip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_c_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_c_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_c_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_panorama_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_stage0_0_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("assets/img/chip.png") #if display private #end class __ASSET__img_chip_png extends lime.graphics.Image {}
@:image("assets/img/c_arrow.png") #if display private #end class __ASSET__img_c_arrow_png extends lime.graphics.Image {}
@:image("assets/img/c_cursor.png") #if display private #end class __ASSET__img_c_cursor_png extends lime.graphics.Image {}
@:image("assets/img/c_hero.png") #if display private #end class __ASSET__img_c_hero_png extends lime.graphics.Image {}
@:image("assets/img/panorama.png") #if display private #end class __ASSET__img_panorama_png extends lime.graphics.Image {}
@:file("assets/img/stage0-0.csv") #if display private #end class __ASSET__img_stage0_0_csv extends haxe.io.Bytes {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end