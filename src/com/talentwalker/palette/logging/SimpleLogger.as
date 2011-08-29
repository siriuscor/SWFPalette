package com.talentwalker.palette.logging
{
    public class SimpleLogger implements ILogger
    {
        public function SimpleLogger()
        {
        }
        
        public function warn(args):void {
            trace(args);
        }
        
        public function log(args):void {
            trace(args);
        }
        public function info(args):void {
            trace(args);
        }
        public function error(args):void {
            trace(args);
        }
    }
}