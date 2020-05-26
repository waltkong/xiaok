<?php
namespace app\api\logic\music;

use app\admin\model\music\Cd_model;
use app\admin\model\music\Like_model;
use app\admin\model\music\Message_model;
use app\admin\model\music\My_collections_model;
use app\admin\model\music\Singer_model;
use app\admin\model\music\Song_model;
use app\admin\model\User;
use app\common\util\UrlUtil;

class ActionLogic extends BaseLogic {

    public function add_message($input,$userInfo){
        $singer_id = $input['singer_id']?? '';
        $cd_id = $input['cd_id']?? '';
        $song_id = $input['song_id']?? '';
        $msg_id = $input['msg_id']?? '';   //所回复的消息id

        //对象类型 1歌手2cd3歌曲
        $obj_id = '';
        $obj_type = '';
        if(!empty($singer_id)){
            $obj_id = $singer_id;
            $obj_type = 1;
        }
        if(!empty($cd_id)){
            $obj_id = $cd_id;
            $obj_type = 2;
        }
        if(!empty($song_id)){
            $obj_id = $song_id;
            $obj_type = 3;
        }
        if(empty($obj_id) || empty($obj_type)){
            return [
                'code' => -1, 'msg' => '缺少数据','data'=>[]
            ];
        }
        $group_number = $this->getGroupNumber($msg_id);
        $data = [
            'msg' => $input['msg'] ?? '',
            'user_id' => $userInfo['id'] ?? '',
            'parent_id' => empty($msg_id) ?0 : (int)$msg_id,
            'group_number' => $group_number,
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
            'createtime' => time(),
        ];
        (new Message_model())->insert($data);
        return [
            'code' => 1, 'msg' => 'ok','data'=>[]
        ];
    }


    public function do_like($input,$userInfo){
        $singer_id = $input['singer_id']?? '';
        $cd_id = $input['cd_id']?? '';
        $song_id = $input['song_id']?? '';

        //对象类型 1歌手2cd3歌曲
        $obj_id = '';
        $obj_type = '';
        if(!empty($singer_id)){
            $obj_id = $singer_id;
            $obj_type = 1;
        }
        if(!empty($cd_id)){
            $obj_id = $cd_id;
            $obj_type = 2;
        }
        if(!empty($song_id)){
            $obj_id = $song_id;
            $obj_type = 3;
        }
        if(empty($obj_id) || empty($obj_type)){
            return [
                'code' => -1, 'msg' => '缺少数据','data'=>[]
            ];
        }

        $where = [
            'user_id' => $userInfo['id'] ?? '',
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
        ];

        $data = [
            'like_status' => $input['like_status'] ?? '1',
            'user_id' => $userInfo['id'] ?? '',
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
            'createtime' => time(),
        ];

        $row = (new Like_model())->where($where)->find();
        if(is_null($row)){
            (new Like_model())->insert($data);
        }else{
            (new Like_model())->save($data,$where);
        }


        return [
            'code' => 1, 'msg' => 'ok','data'=>[]
        ];
    }


    public function is_like($input,$userInfo){
        $singer_id = $input['singer_id']?? '';
        $cd_id = $input['cd_id']?? '';
        $song_id = $input['song_id']?? '';

        //对象类型 1歌手2cd3歌曲
        $obj_id = '';
        $obj_type = '';
        if(!empty($singer_id)){
            $obj_id = $singer_id;
            $obj_type = 1;
        }
        if(!empty($cd_id)){
            $obj_id = $cd_id;
            $obj_type = 2;
        }
        if(!empty($song_id)){
            $obj_id = $song_id;
            $obj_type = 3;
        }
        if(empty($obj_id) || empty($obj_type)){
            return [
                'code' => -1, 'msg' => '缺少数据','data'=>[]
            ];
        }
        $like_status = 0;
        $row = (new Like_model())
            ->where('obj_id',$obj_id)
            ->where('obj_type',$obj_type)
            ->where('user_id',$userInfo['id'])
            ->find();
        if(!is_null($row)){
            $like_status =  $row['like_status'];
        }
        return [
            'like_status' => $like_status,
        ];

    }


    private function getGroupNumber($msg_id){
        $group_number = '';
        if(!empty($msg_id)){
            $group_number = (new Message_model())->where('id',$msg_id)->value('group_number','');
        }
        if(empty($group_number)){
            $group_number = date('YmdHis').rand(10000,99999);
        }
        return $group_number;
    }


    public function message_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Message_model();
            $singer_id = $input['singer_id']?? '';
            $cd_id = $input['cd_id']?? '';
            $song_id = $input['song_id']?? '';
            $msg_id = $input['msg_id']?? '';   //所回复的消息id
            //对象类型 1歌手2cd3歌曲
            $obj_id = '';
            $obj_type = '';
            if(!empty($singer_id)){
                $obj_id = $singer_id;
                $obj_type = 1;
            }
            if(!empty($cd_id)){
                $obj_id = $cd_id;
                $obj_type = 2;
            }
            if(!empty($song_id)){
                $obj_id = $song_id;
                $obj_type = 3;
            }
            $obj = $obj->where('obj_type','=',$obj_type)
                ->where('obj_id',$obj_id);

            if(empty($msg_id)){
                $obj = $obj->where('parent_id',0);
            }else{
                $group_number = (new Message_model())->where('id',$msg_id)->value('group_number','');
                $obj = $obj->where('parent_id','<>',0)
                    ->where('group_number',$group_number);
            }

            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();

        $userIds = array_column($list,'user_id');
        $userMap = ( new User)->getMap($userIds);

        foreach ($list as $k => $item){
            $list[$k]['username'] = $userMap[$item['user_id']]['username'] ?? '--';

            $avatar = $userMap[$item['user_id']]['avatar'] ?? '--';

            $list[$k]['createtime'] = date('Y-m-d H:i',$item['createtime']);

            $list[$k]['avatar'] = UrlUtil::getFullUrl($avatar);

        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;
    }



    public function collection_box_list($input,$userInfo){
        $names = (new My_collections_model)->where('user_id',$userInfo['id'])->column('name');
        if(empty($names)){
            return [
                '默认',
            ];
        }else{
            $names = array_unique($names);
            if(!in_array('默认',$names)){
                array_push($names,'默认');
            }
            return $names;
        }
    }


    public function collection_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;

        $obj_type = $input['obj_type']?? 1;   //   //对象类型 1歌手2cd3歌曲

        $objFunc = function () use($input,$obj_type){
            $obj = new My_collections_model();
            $obj = $obj->where('name','=',$input['name'])
                ->where('user_id',parent::$userinfo['id'])
                ->where('obj_type',$obj_type);
            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();

        foreach ($list as $k => $item){

            if($obj_type == 1){
                $resource_row = Singer_model::where('id',$item['obj_id'])->find();
            }elseif ($obj_type == 2){
                $resource_row = Cd_model::where('id',$item['obj_id'])->find();
            }else{
                $resource_row = Song_model::where('id',$item['obj_id'])->find();
                if(!empty($resource_row)){
                    $resource_row['cd_name'] = Cd_model::where('id',$resource_row['cd_id'])->value('name');
                    $resource_row['singer_name'] = Singer_model::where('id',$resource_row['singer_id'])->value('name');
                }
            }

            $list[$k]['resource_name'] = $resource_row['name'];
            $list[$k]['image'] =  UrlUtil::getFullUrl( $resource_row['image'] );
            $list[$k]['createtime'] = date('Y-m-d H:i',$item['createtime']);

        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;

    }


    public function add_collection($input){
        $singer_id = $input['singer_id']?? '';
        $cd_id = $input['cd_id']?? '';
        $song_id = $input['song_id']?? '';
        $name = $input['name']?? '';


        $addOrMinus = $input['addOrMinus']?? 'add';


        //对象类型 1歌手2cd3歌曲
        $obj_id = '';
        $obj_type = '';
        if(!empty($singer_id)){
            $obj_id = $singer_id;
            $obj_type = 1;
        }
        if(!empty($cd_id)){
            $obj_id = $cd_id;
            $obj_type = 2;
        }
        if(!empty($song_id)){
            $obj_id = $song_id;
            $obj_type = 3;
        }
        if(empty($obj_id) || empty($obj_type)){
            return [
                'code' => -1, 'msg' => '缺少数据','data'=>[]
            ];
        }

        $model = new My_collections_model();
        $insert = [
            'name' => $name,
            'user_id' => parent::$userinfo['id'],
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
            'createtime' => time(),
        ];
        $findres = $model->where([
            'name' => $name,
            'user_id' => parent::$userinfo['id'],
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
        ])->find();
        if($addOrMinus == 'add'){
            if(empty($findres)){
                (new My_collections_model())->insert($insert);
            }
        }else{
          if(!empty($findres)){
              $findres->delete();
          }
        }

        return [
            'code' => 1, 'msg' => 'ok','data'=>[]
        ];
    }



}