<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use JWTAuthException;
use DB;
use Auth;

class UserController extends Controller
{   
    private $user;
    public function __construct(User $user){
        $this->user = $user;
    }
   
    public function register(Request $request){

        $data = json_decode(file_get_contents('php://input'), true);

        $emailID = DB::table('users')->where(['email'=>$data['email']])->first();
        // email nda cocok
        if(empty($emailID))
        {
            $phoneID = DB::table('users')->where(['phone'=>$data['phone']])->first();
            if(empty($phoneID))
            {
                
                 $username = DB::table('users')->where(['name'=>$data['username']])->first();
                 
                if(empty($username))
                {
                
                //phone nda cocok # register
                $user = $this->user->create([
                  'name' => $data['name'],
                  'email' => $data['email'],
                  'phone' => $data['phone'],
                  'password' => bcrypt($data['password'])
                ]);

            $login['email'] = $data['email'];
            $login['password'] = $data['password'];  
            
            try {
               if (!$token = JWTAuth::attempt($login))
               {
                    if($nol=="0")
                    {
                         $status="phone";      
                         $message = "invalid_phone_or_password";
                    }else{
                         $status="email";     
                         $message = "invalid_email_or_password";
                    }    
                    return response()->json(['status'=>$status,'message'=>$message]);
                  
               }
            } catch (JWTAuthException $e) {
                return response()->json(['failed_to_create_token'], 500);
            }
          
            return response()->json(compact('token'));

                }else{
                    
                      return response()->json(['status'=>false,'message'=>'username sudah ready']);
                    
                }


            }else{

                //phone cocok
                 return response()->json(['status'=>'phone','message'=>'data telp sudah ready']);

            }    

        }else{
            // email cocok
            return response()->json(['status'=>'email','message'=>'data email sudah ready']);

        }    

       
    }
    
    public function login(Request $request){

        $credentials = json_decode(file_get_contents('php://input'), true);
        
       
        
        $check = DB::table('users')->where('name', $credentials['username'])->get();
        
        
       
      if(count($check)==0)
      {
              $status = '1';
              $message = "Akun belum terdaftar!!";
              return response()->json(['status'=>$status,'message'=>$message]);
        
      }else{
          
          if($check[0]->type =='admin')
          {
              
             $status = '4';
            $message = "Akses tidak di izinkan!!";
            return response()->json(['status'=>false,'message'=>$message]);
              
          }else{
           
                    $session = DB::table('login_session')->where('user_id',$check[0]->id)->get();
           
                    if(count($session) !=0)
                    {
                          $status = '2';
                          $message = "Akun sudah dipakai!!";
                          return response()->json(['status'=>$status,'message'=>$message]);
                        
                    }else{
                        
                        
                        $login['email'] =  $check[0]->email;
                        $login['password'] =  $credentials['password'];
                        try {
                          if (!$token = JWTAuth::attempt($login))
                          {
                              $status = '3';
                              $message = "Login gagal password salah!!";
                              return response()->json(['status'=>false,'message'=>$message]);
                               
                          }
                          
                        } catch (JWTAuthException $e) {
                            return response()->json(['failed_to_create_token'], 500);
                        } 
                        
                        DB::table('login_session')->insert(['user_id'=>Auth::user()->id,'location_id'=>$credentials['location_id'],'management_id'=>$credentials['management_id']]);
                        
                        return response()->json(compact('token'));
                          
                    }
          }
      }
        
        
        
     
    }

    public function loginadmin(Request $request){

        $credentials = json_decode(file_get_contents('php://input'), true);
        
        $nol = substr($credentials['email'],0,1);
        $user = DB::table('users')->where(['phone'=>$credentials['email']])->first();
        if(!empty($user))
        {
            //login by phone
              
            $token = null;
            $login['email'] =  $user->email;
            $login['password'] =  $credentials['password'];   
              
               
        }else{
              

             //login by email    
            $token = null;
            $login['email'] =  $credentials['email'];
            $login['password'] =  $credentials['password'];
            
               
        }    
        
         try {
               if (!$token = JWTAuth::attempt($login))
               {
                    if($nol=="0")
                    {
                         $status="phone";      
                         $message = "invalid_phone_or_password";
                    }else{
                         $status="email";     
                         $message = "invalid_email_or_password";
                    }    
                    return response()->json(['status'=>$status,'message'=>$message]);
                  
               }
            } catch (JWTAuthException $e) {
                return response()->json(['failed_to_create_token'], 500);
            }
   
           
            if(Auth::user()->type == "admin")
            { 
              return response()->json(compact('token'));
            }else{
              $status="admin";     
              $message = "akses_tidak_valid";
              return response()->json(['status'=>$status,'message'=>$message]);
            } 
         

        
    }


     public function logoutadmin(Request $request) {
        $credentials = json_decode(file_get_contents('php://input'), true);

        

            // try {

            //     JWTAuth::invalidate($credentials['token']);
            //     return response()->json(['success' => true, 'message'=> "You have successfully logged out."]);
            // } catch (JWTException $e) {
            //     // something went wrong whilst attempting to encode the token
            //     return response()->json(['success' => false, 'error' => 'Failed to logout, please try again.'], 500);
            // }

        
    }

   public function logout(Request $request) {
        $credentials = json_decode(file_get_contents('php://input'), true);

        if (!Auth::validate(array('email' => $credentials['email'] , 'password' => $credentials['password'])))
        {
            $data  = null;
            return response()->json(['success' => true, 'data'=>$data,'message'=> "Email / Password tidak valid !!"]);
        
        }else{

            try {

                JWTAuth::invalidate($credentials['token']);
                DB::table('login_session')->where(['user_id'=>Auth::user()->id])->delete();
                $data = 'valid';
                return response()->json(['success' => true, 'data'=>$data, 'message'=> "You have successfully logged out."]);
            } catch (JWTException $e) {
                // something went wrong whilst attempting to encode the token
                return response()->json(['success' => false, 'error' => 'Failed to logout, please try again.'], 500);
            }

        }
    }

    public function getAuthUser(Request $request){
        $user = JWTAuth::toUser($request->token);
        return response()->json(['status'=>true,'data' => $user,'message'=>'data user']);
    }

    public function gedung(Request $request){
        
        $data = DB::table('location')->where('type','gedung')->orderBy('id','desc')->get();
        return response()->json(['status'=>true,'data' => $data,'message'=>'data gedung']);
    }


    public function resepsionis(Request $request){
        
        $data = DB::table('location')->where('type','resepsionis')->orderBy('id','desc')->get();
        return response()->json(['status'=>true,'data' => $data,'message'=>'data gedung']);
    }


}