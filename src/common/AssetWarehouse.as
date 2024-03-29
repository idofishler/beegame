package common
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	
	/** 
	 * The graphic elements warehouse.
	 * Using the getSkinAsset function you'll be able to get the graphic elements at runtime.
	 **/
    public class AssetWarehouse extends EventDispatcher {  
		private static var instance:AssetWarehouse;
		
		[Embed(source="../assets/bee_warehouse.swf", mimeType="application/octet-stream")] 
		public static const SWFBytes:Class; 
		
		private var assetLoader:Loader; 
		
		public function AssetWarehouse() {
			assetLoader = new Loader();
			assetLoader.loadBytes(new SWFBytes());
			assetLoader.contentLoaderInfo.addEventListener(Event.INIT, dispatchEvent, false, 0, true);
		}
	 	
		public static function getInstance():AssetWarehouse {
			if( !instance )
				instance = new AssetWarehouse;
			return instance;
		}
		
		/**
		 * Provie a display asset from the skinAsset type
		 * @skinAsset the name of the class definition
		 */
		public function getSkinAsset(skinAsset:String, diableMouseEvent:Boolean = true):DisplayObject {
			try{
				var assetClass:Class = assetLoader.contentLoaderInfo.applicationDomain.getDefinition(skinAsset) as Class;
				var disObj:DisplayObject = new assetClass();
				if (diableMouseEvent){
					if(disObj is Sprite) {//reduce childrens mouse activity
						(disObj as Sprite).mouseChildren = false;
					}
				}
				return disObj;
	        } catch(e:Error) {
	            throw new IllegalOperationError(skinAsset + " definition not found in " + assetLoader.contentLoaderInfo.loaderURL);
	        }
	        return null;
		}
		
		public function hasAsset(soundAsset:String):Boolean {
			try{
				var assetClass:Class = assetLoader.contentLoaderInfo.applicationDomain.getDefinition(soundAsset) as Class;
				return assetClass!=null;
	        } catch(e:Error) {
	        	return false;
	        }
	        return false;
		}
		
		public function getSoundAsset(soundAsset:String):Sound {
			try{
				var assetClass:Class = assetLoader.contentLoaderInfo.applicationDomain.getDefinition(soundAsset) as Class;
				return new assetClass();
	        } catch(e:Error) {
	            throw new IllegalOperationError("problem found with asset: "+soundAsset+" error: "+e);
	        }
	        
	        return null;
		}
    }
}