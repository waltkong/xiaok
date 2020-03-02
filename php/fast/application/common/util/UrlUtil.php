<?php
namespace app\common\util;

class UrlUtil {

    public static function getFullUrl($url){
        if(strpos($url,'http://') !== false || strpos($url,'https://') !== false){
            return $url;
        }else{
//            return 'http://192.168.56.1:8070'.$url;
            return request()->domain().$url;
        }
    }




}

