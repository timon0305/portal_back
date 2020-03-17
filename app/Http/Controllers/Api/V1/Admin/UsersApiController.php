<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Resources\Admin\UserResource;
use App\User;
use App\Role;
use Gate;

use function GuzzleHttp\Promise\all;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Laravel\Passport\Passport;
use Psy\Util\Json;
use Symfony\Component\HttpFoundation\Response;

class UsersApiController extends Controller

{
    public function __construct()
    {
        //$this->middleware('test');
    }

    public function index()
    {
        abort_if(Gate::denies('user_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new UserResource(User::with(['roles'])->get());
    }

    public function store(StoreUserRequest $request)
    {
        $user = User::create($request->all());
        $user->roles()->sync($request->input('roles', []));

        return (new UserResource($user))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function show(User $user)
    {
        abort_if(Gate::denies('user_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return new UserResource($user->load(['roles']));
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $user->update($request->all());
        $user->roles()->sync($request->input('roles', []));

        return (new UserResource($user))
            ->response()
            ->setStatusCode(Response::HTTP_ACCEPTED);
    }

    public function destroy(User $user)
    {
        abort_if(Gate::denies('user_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $user->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $token = auth()->attempt($credentials);

        // var_dump(Hash::make($credentials['password']));
        // var_dump($token);

        if ($token)
            return $token;
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    public function register(Request $request)
    {
//        return array("success" => true, "message"=> "Register Successful!");

        $name = $request['data']['name'];
        $email = $request['data']['email'];
        $role = $request['data']['role'];
        $password = bcrypt($request['data']['password']);
        DB::table('users')->insert(
            ['name' => $name,
                'email' => $email,
                'password' => $password
            ]);
        $query = DB::table('users')->where('email', '=', $email)->get('id');
        DB::table('role_user')->insert(['role_id' => $role, 'user_id' => $query[0]->id]);
        return array("success" => true, "message" => "Register Successful!");

    }

    public function edit_user(Request $request)
    {
        $name = $request['data']['name'];
        $email = $request['data']['email'];
        $role = $request['data']['role'] === "Admin" ? 1 : 2;
        $update_data = [
            'name' => $name
        ];
        if ($request['data']['password']) {
            $update_data['password'] = bcrypt($request['data']['password']);
        }

        DB::table('users')->where('email', '=', $email)
            ->update($update_data);
        $query = DB::table('users')->where('email', '=', $email)->get('id');
        DB::table('role_user')->where('user_id', '=', $query[0]->id)->update(['role_id' => $role]);
        return array('queyr' => $role);
    }


    public function login(Request $request)
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')], false, false)) {
            $user = Auth::user();
            $user_data = DB::table('users')
                ->rightJoin('role_user', 'users.id', '=', 'role_user.user_id')
                ->rightJoin('roles', 'role_user.role_id', '=', 'roles.id')
                ->where('users.id', '=', $user['id'])
                ->get();
            $success['token'] = $user->createToken('MyApp')->accessToken;
            return response()->json(['success' => $success, 'info' => $user_data, 'isLogin' => true], 200);
        } else {
            $email = $request['email'];
            $password = md5($request['password']);
            $query = DB::table('customer')
                ->where('email', '=', $email)
                ->where('password', '=', $password)
                ->get();
            if (count($query)) {
                $query[0]->title = 'Customer';
                return response()->json(['info' => $query, 'isLogin' => true], 200);
            } else {
                return array('isLogin' => false);
            }
        }
    }

    public function edit(Request $request)
    {
        $name = $request['data']['name'];
        $email = $request['data']['email'];
        $role = $request['data']['role'];
        $password = bcrypt($request['data']['password']);
        return array('kkk' => $name);
    }

    public function delete(Request $request)
    {
        $query = $request['data'];
        DB::table('users')->where('email', '=', $query)->delete();
    }

    public function getUsers(Request $request)
    {
        $users = DB::table('users')
            ->rightJoin('role_user', 'users.id', '=', 'role_user.user_id')
            ->rightJoin('roles', 'role_user.role_id', '=', 'roles.id')
            ->where('users.deleted_at', '=', null)
            ->get();
        return $users;

    }

    public function getCustomers(Request $request)
    {
        $customers = DB::table('customer')
            ->where('deleted_at', '=', null)
            ->get();
        return $customers;
    }

    public function getProperties(Request $request)
    {
        $properties = DB::table('property')->get();
        return $properties;
    }

    public function customer_edit(Request $request)
    {

    }

    public function editProperties(Request $request)
    {
        $property_id = $request['property_id'];

        $data = DB::table('customer')
            ->rightJoin('customer_property', 'customer_property.customer_id', '=', 'customer.id')
            ->rightJoin('property', 'property.id', '=', 'customer_property.property_id')
            ->where('property.id', '=', $property_id)
            ->get();
        if (count($data)) {
            return $data;
        } else {
            return null;
        }

    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }

    private function guard()
    {
        // return auth()->guard('api');
        return auth('api');
    }
}
