<?php
namespace app\api\logic\music;

use app\admin\model\music\Ad_model;
use app\admin\model\music\Banner_model;
use app\admin\model\music\Cd_model;
use app\admin\model\music\Singer_model;
use app\admin\model\music\Song_model;
use app\api\repository\MusicRepository;
use app\common\util\UrlUtil;

class DataLogic{

    public function banner_list($pageIndex=1, $eachPage=10){
        $pageOffset = ($pageIndex-1)*$eachPage;
        $list = (new Banner_model())->where([])
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();
        foreach ($list as $k => $v){
            $list[$k]['image'] = UrlUtil::getFullUrl($v['image']);
        }
        return $list;
    }

    public function ad_list($pageIndex=1, $eachPage=10){
        $pageOffset = ($pageIndex-1)*$eachPage;
        $list = (new Ad_model())->where([])
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();
        foreach ($list as $k => $v){
            $list[$k]['image'] = UrlUtil::getFullUrl($v['image']);
        }
        return $list;
    }

    public function cd_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Cd_model();
            if(!empty($input['is_recommend'])){
                $obj = $obj->where('is_recommend',$input['is_recommend']);
            }
            if(!empty($input['name'])){
                $obj = $obj->where('name','like',"%{$input['name']}%");
            }
            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('createtime', 'desc')
            ->limit($pageOffset,$eachPage)->select();

        $list = collection($list)->toArray();

        $singerMap = MusicRepository::getSingerIdNameMap(array_column($list,'singer_id'));
        $tagMap = MusicRepository::getTagIdNameMap('',true);

        foreach ($list as $k => $item){
            $list[$k]['image'] = UrlUtil::getFullUrl($item['image']);
            $list[$k]['publishtime'] = date('Y-m-d',$item['publishtime']);
            $list[$k]['singer_name'] = $singerMap[$item['singer_id']] ?? '';
            $tagIds = trim($item['tag_ids'],',');
            $list[$k]['tag_names'] = (function () use($tagIds,$tagMap){
                $tagIds = explode(',',$tagIds);
                $ret = [];
                foreach ($tagIds as $k2 => $v2){
                    if(isset($tagMap[$v2])){
                        $ret[] = $tagMap[$v2];
                    }
                }
                return $ret;
            })();
            $list[$k]['createtime'] = date('Y-m-d',$item['createtime']);
        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;
    }

    public function cd_one($input){
        $id = $input['id'] ?? '';
        $obj = new Cd_model();
        $row = $obj->where('id',$id)->find();

        if(!empty($row)){
            $row['image'] = UrlUtil::getFullUrl($row['image']);
            $singerRow = Singer_model::where('id',$row['singer_id'])->find();
            $row['singer_name'] = $singerRow['name'];
            $row['singer_image'] = UrlUtil::getFullUrl($singerRow['one_image']);
        }

        $list = [];
        if($id > 0){
            $list =  (new Song_model())->where('cd_id',$id)->select();

            $list = collection($list)->toArray();
            $cdMap = MusicRepository::getCdIdNameMap(array_column($list,'cd_id'));
            foreach ($list as $k => $item){
                $list[$k]['image'] = UrlUtil::getFullUrl($item['image']);

                $list[$k]['voice_url'] = UrlUtil::getFullUrl($item['voice_url']);
                $list[$k]['vedio_url'] = UrlUtil::getFullUrl($item['vedio_url']);

                $list[$k]['cd_name'] = $cdMap[$item['cd_id']] ?? '';

                $list[$k]['createtime'] = date('Y-m-d',$item['createtime']);
            }
        }
        return [
            'cd_row' => $row ?? [],
            'song_list' => $list ?? [],
        ];
    }


    public function song_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Song_model();
            if(!empty($input['is_recommend'])){
                $obj = $obj->where('is_recommend',$input['is_recommend']);
            }
            if(!empty($input['name'])){
                $obj = $obj->where('name',"%{$input['name']}%");
            }
            if(!empty($input['singer_id'])){
                $obj = $obj->where('singer_id',$input['singer_id']);
            }
            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('createtime', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();
        $singerMap = MusicRepository::getSingerIdNameMap(array_column($list,'singer_id'));
        $tagMap = MusicRepository::getTagIdNameMap('',true);
        $cdMap = MusicRepository::getCdIdNameMap(array_column($list,'cd_id'));

        foreach ($list as $k => $item){
            $list[$k]['image'] = UrlUtil::getFullUrl($item['image']);

            $list[$k]['voice_url'] = UrlUtil::getFullUrl($item['voice_url']);
            $list[$k]['vedio_url'] = UrlUtil::getFullUrl($item['vedio_url']);

            $list[$k]['singer_name'] = $singerMap[$item['singer_id']] ?? '';
            $list[$k]['cd_name'] = $cdMap[$item['cd_id']] ?? '';
            $tagIds = trim($item['tag_ids'],',');
            $list[$k]['tag_names'] = (function () use($tagIds,$tagMap){
                $tagIds = explode(',',$tagIds);
                $ret = [];
                foreach ($tagIds as $k2 => $v2){
                    if(isset($tagMap[$v2])){
                        $ret[] = $tagMap[$v2];
                    }
                }
                return $ret;
            })();
            $list[$k]['createtime'] = date('Y-m-d',$item['createtime']);
        }

        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;

    }


    public function song_one($input){
        $id = $input['id'] ?? '';
        $obj = new Song_model();
        $row = $obj->where('id',$id)->find();
        if(!empty($row)){

            $singerMap = MusicRepository::getSingerIdNameMap($row['singer_id']);
            $cdMap = MusicRepository::getCdIdNameMap($row['cd_id']);

            $row['image'] = UrlUtil::getFullUrl($row['image']);
            $row['voice_url'] = UrlUtil::getFullUrl($row['voice_url']);
            $row['vedio_url'] = UrlUtil::getFullUrl($row['vedio_url']);
            $row['singer_name'] = $singerMap[$row['singer_id']] ?? '';
            $row['cd_name'] = $cdMap[$row['cd_id']] ?? '';

        }
        return [
            'song_row' => $row ?? [],
        ];
    }


    public function singer_one($input){
        $id = $input['id'] ?? '';
        $obj = new Singer_model();
        $row = $obj->where('id',$id)->find();


        if(!empty($row)){
            $row['one_image'] = UrlUtil::getFullUrl($row['one_image']);
        }

        $list = [];

        if($id > 0){
            $list =  (new Song_model())->where('singer_id',$id)->order('createtime', 'desc')
                ->limit(0,8)->select();   //只推荐8个

            $list = collection($list)->toArray();
            $cdMap = MusicRepository::getCdIdNameMap(array_column($list,'cd_id'));
            foreach ($list as $k => $item){
                $list[$k]['image'] = UrlUtil::getFullUrl($item['image']);

                $list[$k]['voice_url'] = !empty($item['voice_url']) ? UrlUtil::getFullUrl($item['voice_url']) : '';
                $list[$k]['vedio_url'] = !empty($item['vedio_url']) ? UrlUtil::getFullUrl($item['vedio_url']) : '';

                $list[$k]['cd_name'] = $cdMap[$item['cd_id']] ?? '';

                $list[$k]['createtime'] = date('Y-m-d',$item['createtime']);
            }
        }
        return [
            'singer_row' => $row ?? [],
            'song_list' => $list ?? [],
        ];
    }


    public function singer_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Singer_model();
            if(!empty($input['name'])){
                $obj = $obj->where('name','like',"%{$input['name']}%");
            }
            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('createtime', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();

        foreach ($list as $k => $item){
            $list[$k]['one_image'] = UrlUtil::getFullUrl($item['one_image']);

            $list[$k]['many_images'] = (function() use($item){
                $images = explode(',',$item['many_images']);
                $_ret = [];
                foreach ($images as $k2 => $v2){
                    $_ret[] =  UrlUtil::getFullUrl($v2);
                }
                return implode(',',$_ret);
            })();

            $list[$k]['createtime'] = date('Y-m-d',$item['createtime']);
        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;

    }





}

