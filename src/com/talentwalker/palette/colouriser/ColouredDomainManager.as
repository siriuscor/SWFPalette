//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import flash.utils.*;
    import flash.display.*;

    public class ColouredDomainManager {

        public static const MONSTER:uint = 1;
        public static const MANNEQUIN:uint = 0;

        private static var instance:ColouredDomainManager;

        private var newDomainFlag:Boolean;
        private var domains:Dictionary;
        private var currentDomain:uint;

        public function ColouredDomainManager(){
            domains = new Dictionary();
        }
        public static function getInstance():ColouredDomainManager{
            if (instance != null){
                return (instance);
            };
            return ((instance = new (ColouredDomainManager)()));
        }
        public static function destroy():void{
            var _local1:Loader;
            for each (_local1 in instance.domains) {
                _local1.unload();
            };
            instance = null;
        }

        public function putDefinition(_arg1:Loader):void{
            var _local2:Loader;
            if (domains[currentDomain] != null){
                _local2 = domains[currentDomain];
                _local2.unload();
            };
            domains[currentDomain] = _arg1;
        }
        public function useNewDomain():Boolean{
            return (newDomainFlag);
        }
        public function startNewDomainLoad(_arg1:uint):void{
            newDomainFlag = true;
            currentDomain = _arg1;
        }
        public function getDefinition(_arg1:uint):Loader{
            return (domains[_arg1]);
        }
        public function endNewDomainLoad():void{
            newDomainFlag = false;
        }

    }
}
