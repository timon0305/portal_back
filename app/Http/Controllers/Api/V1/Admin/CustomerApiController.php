<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Symfony\Component\VarDumper\Cloner\Data;
use DateTime;

class CustomerApiController extends Controller
{
    public function custom_register(Request $request) {
        // Customer_Info
        $customer_no = $request['data']['customer_no'];
        $name = $request['data']['name'];
        $email = $request['data']['email'];
        $password = md5($request['data']['password']);
        $customer_type = $request['data']['customer_type'];
        $pre_contract = $request['data']['pre_contract'];
        $pre_contract_date = $request['data']['pre_contract_date'];
        $query = explode('T', $pre_contract_date)[0];
        $purchase_contract = $request['data']['purchase_contract'];

        // Customer_Legal_Info

        $pre_contract_legal = $request['data']['pre_contract_legal'];
        $pre_contract_date_legal = $request['data']['pre_contract_date_legal'];
        $query1 = explode('T', $pre_contract_date_legal)[0];
        $created_at = new DateTime();
        $query2 = $created_at->format('y-m-d');
        $recent_id = DB::table('customer')->insertGetId(
            ['customer_no'=>$customer_no,
                'name' =>$name,
                'email' =>$email,
                'password'=>$password,
                'customer_type' =>$customer_type,
                'pre_contract' =>$pre_contract,
                'pre_contract_date'=>$query,
                'purchase_contract' =>$purchase_contract
            ]);
        if ($pre_contract_legal !== null && $pre_contract_date_legal !== null)
        {

            DB::table('legal_info')->insert(
                [
                    'pre_contract'=>$pre_contract_legal,
                    'pre_contract_date'=>$query1,
                    'created_at'=>$query2,
                    'customer_id'=>$recent_id
                ]
            );
        }

        return array("success" => $recent_id, "message"=> "Customer Register Successful!");
    }


    public function customer_edit(Request $request) {
        //return array('success'=>$request->data['name']);
        $original_id = $request->data['original_id'];
        $customer_no = $request->data['customer_no'];
        $name = $request->data['name'];
        $email = $request->data['email'];
        $customer_type = $request->data['customer_type'];
        $pre_contract = $request->data['pre_contract'];
        $pre_contract_date = $request->data['pre_contract_date'];
        $query = explode('T', $pre_contract_date)[0];
        $purchase_contract = $request->data['purchase_contract'];

        // Customer_Legal_Info

        $pre_contract_legal =$request->data['pre_contract_legal'];
        $pre_contract_date_legal = $request->data['pre_contract_date_legal'];
        $query1 = explode('T', $pre_contract_date_legal)[0];
        $updated_at = new DateTime();
        $query2 = $updated_at->format('y-m-d');
        $password = '';
        $update_data = [
            'customer_no'=>$customer_no,
            'name' => $name,
            'customer_type' =>$customer_type,
            'pre_contract' =>$pre_contract,
            'pre_contract_date'=>$query,
            'purchase_contract' =>$purchase_contract
        ];
        if ($request->data['password'])
        {
            $update_data['password'] = md5($request->data['password']);
        }

        $recent_id = DB::table('customer')
            ->where('id', '=', $original_id)
            ->update($update_data);
        if ($pre_contract_legal !== null && $pre_contract_date_legal !== null )
        {

            DB::table('legal_info')
                ->where('id', '=', $original_id)
                ->insert(
                [
                    'pre_contract'=>$pre_contract_legal,
                    'pre_contract_date'=>$query1,
                    'updated_at'=>$query2,
                    'customer_id'=>$recent_id
                ]
            );
        }

        return array("success" => $recent_id, "message"=> "Customer Register Successful!");
    }

    public function upload(Request $request) {
        $id = $request->id;
        $uploads_dir = public_path('uploads/customer');
        $originOldName = $request->file->getClientOriginalName();
        $request->file->move($uploads_dir, $originOldName);
        DB::table('customer')->where('id', '=', $id)
            ->update(
                [
                    'pre_contract' => $originOldName,

                ]
            );
    }



    public function custom_delete(Request $request) {
        $query = $request['data'];
        $data = DB::table('customer')->where('email', '=', $query)->get('id');
        DB::table('legal_info')->where('id', '=', $data[0]->id)->delete();

        DB::table('customer')->where('email', '=', $query)->delete();
    }

    public function get_owner(Request $request) {
        $query = DB::table('customer') -> get(['id', 'name']);
        return array('names' => $query);
    }

    public function customer_property(Request $request) {
        $owner = $request['data']['name'];
        $contract_start = explode('T', $request['data']['contract_start'])[0];
        $pea_file = $request['data']['pea_file'];
        $keys  = $request['data']['keys'];

        $data = DB::table('property')->insertGetId(
            [
                'contract_date'=>$contract_start,
                'pea_file'=>$pea_file,
                'keys'=>$keys
            ]
        );

        foreach ( $owner as $item) {
            DB::table('customer_property')
                ->insert(
                    [
                        'customer_id' => $item,
                        'property_id' => $data
                    ]
                );
        }
        return array('id'=>$data);
    }

    public function property_upload(Request $request) {
        $id = $request->id;
        $uploads_dir = public_path('uploads/property');
        $originOldName = $request->file->getClientOriginalName();
        $request->file->move($uploads_dir, $originOldName);
        DB::table('property')->where('id', '=', $id)
            ->update(
                [
                    'pea_file' => $originOldName,

                ]
            );
    }


    public function property_delete(Request $request) {
        $query = $request['data'];
        DB::table('customer_property')->where('property_id', '=', $query)->delete();
        DB::table('property')->where('id', '=', $query)->delete();
        return array('success' => true);
    }

    public function getBasicUser(Request $request) {
        $id = $request['data'];
        $data = DB::table('customer')->where('id', '=', $id)->get();
        return array('success'=>true, 'customer'=>$data);
    }

    public function basic_info_download(Request $request) {

        $file_name = DB::table('customer')->where('id', '=', $request['customer_id'])->get('pre_contract');
        if(count($file_name)) {
            return response()->download(public_path().'/uploads/customer/'.$file_name[0]->pre_contract);
        }

        return array('msg' => "file is not exited");
    }

    public function legal_fileupload(Request $request) {
        $id = $request->id;
        $uploads_dir = public_path('uploads/legal');
        $originOldName = $request->file->getClientOriginalName();
        $request->file->move($uploads_dir, $originOldName);
        DB::table('legal_info')->where('customer_id', '=', $id)
            ->update(
                [
                    'pre_contract' => $originOldName,

                ]
            );
    }

    public function getCustomerProperty(Request $request) {
        $id = $request['data'];
        $property_id = DB::table('customer_property')
            ->where('customer_id', '=', $id) ->get('property_id');
        $result = [];
        for ($i = 0; $i < count($property_id); $i++) {
          $data = DB::table('property')
                ->where('id', '=', $property_id[$i]->property_id)->get();
          if(count($data)) {
              array_push($result, $data[0]);
          }


        }
        return $result;
    }

    public function updateProperties(Request $request) {
        $data = $request['update_data'];
        try {
            $update_data = [
                'contract_date' => $data['contract_start'],
                'keys' => $data['keys']
            ];
            if($data['pea_file']) {
                $update_data['pea_file'] = $data['pea_file'];
            }
            DB::table('property')->where('id', '=', $data['id'])
                ->update($update_data);
            DB::table('customer_property')->where('property_id', '=', $data['id'])->delete();
            foreach ($data['name'] as $item) {
                DB::table('customer_property')
                    ->insert(
                        [
                            'customer_id' => $item,
                            'property_id' => $data['id']
                        ]
                    );
            }
            return array('success'=> true, 'message' => "Update successful!", 'id' => $data['id']);
        }
        catch (\Exception $e) {
            return array('success' => false, "message" => $e);
        }



    }

    public function getLegalInfo(Request $request) {
        $query = $request['data'];
        $data = DB::table('legal_info')
                ->where('customer_id', '=', $query) ->get();
        if (count($data))
        {
            return array('success'=>true, 'legal'=>$data);
        }
        else
        {
            return array('success'=>false);
        }
    }

    public function getCustomerLegalInfo(Request $request) {
        $query = DB::table('legal_info')->
                where('customer_id', '=', $request->detail)->get();
        return array('result'=>$query);
    }


    public function legal_FileDownload(Request $request) {

        $file_name = DB::table('legal_info')->where('customer_id', '=', $request['customer_id'])->get('pre_contract');
        if(count($file_name)) {
            return response()->download(public_path().'/uploads/legal/'.$file_name[0]->pre_contract);
        }

        return array('msg' => "file is not exited");
    }
}
