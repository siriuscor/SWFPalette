package com.talentwalker.palette.logging
{
    public interface ILogger
    {
        function warn(args):void;
        function log(args):void;
        function info(args):void;
        function error(args):void;
    }
}