<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Routing\UrlGenerator;
use JWTAuth;
use App\Models\Survey;
use JWTAuthException;
use DB;
use Auth;
use QrCode;
use File;
use Config;


class SurveyController extends Controller
{   
    private $survey;
   
    public function __construct(Survey $survey,UrlGenerator $url)
    {
        $this->survey = $survey;
        $this->url = $url;
    }

    public function index(Request $request)
    {

        $session = DB::table('login_session')->where('user_id',Auth::user()->id)->first();


      $survey = DB::table('survey as a')->select('a.id','a.pertanyaan','a.fungsi','a.management_id','b.name','a.status')->join('management as b','a.management_id','=','b.id')->where('management_id',$session->management_id)->orderBy('a.id','asc')->get();

      $total = DB::table('survey as a')->where('management_id',$session->management_id)->count();

     
      return response()->json(['status'=>true,'data'=>$survey,'total'=>$total,'message'=>'List Data Survey']);

    }

   


    




    public function sendjwb(Request $request)
    {
        $data = json_decode(file_get_contents('php://input'), true);
     
         
         $location_id = DB::table('login_session')->where('user_id',Auth::user()->id)->first()->location_id;
        
         if($data['jawaban'] =="sp")
         {
            $jawaban = 'sp';
            $description = 'Sangat Puas';
            
         }else if($data['jawaban'] =="p"){
            $jawaban = 'p';
            $description = 'Puas';

         }else if($data['jawaban'] =="kp"){
           $jawaban = 'kp';
           $description = 'Kurang Puas';

         }else if($data['jawaban'] =="tp"){
           $jawaban = 'tp';
           $description = 'Tidak Puas';

          }else if($data['jawaban'] =="sm"){

           $jawaban = 'sm';
           $description = 'Sangat Mahal'; 

          }else if($data['jawaban'] =="ma"){ 

           $jawaban = 'ma';
           $description = 'Mahal';
          
          }else if($data['jawaban'] =="c"){ 

           $jawaban = 'c';
           $description = 'Cukup';

          }else if($data['jawaban'] =="mu"){ 

            $jawaban = 'mu';
            $description = 'Murah';

          } 


          $session = DB::table('login_session')->where('user_id',Auth::user()->id)->first();
      
           
        DB::table('survey_detail')->insert(
          [
          'survey_id'=>$data['survey_id'],
          'location_id'=> $location_id,
          'jawaban' => $jawaban,
          'description'=> $description,
          'saran_id'=>'0',
          'status'=>'1',
          'date'=> date("Y-m-d"),
          'management_id'=>$session->management_id,
          'created_at'=> DB::raw('now()')
          ]);

        $data = DB::table('survey_detail as a')->first();
        return response()->json(['status'=>true,'data'=>$data,'message'=>'List Detail Data Survey']);

    }  


   


    public function sendsaran(Request $request)
    {
        $data = json_decode(file_get_contents('php://input'), true);
     
        $session = DB::table('login_session')->where('user_id',Auth::user()->id)->first();
             

        DB::table('survey_detail')->insert(
          [
          'survey_id'=>$data['survey_id'],
          'location_id'=> $session->location_id,
          'management_id'=>$session->management_id,
          'jawaban' => 'sr',
          'description'=>'Saran',
          'saran_id'=>$data['saran_id'],
          'status'=>'1',
          'date'=>date("Y-m-d"),
          'created_at'=> DB::raw('now()')
          ]);

      
      $data = DB::table('survey_detail as a')->first();
        return response()->json(['status'=>true,'data'=>$data,'message'=>'List Data Saran']);


    }


    


     public function getsaran(Request $request)
    {

        $data = DB::table('saran')->orderBy('id','desc')->get();
        return response()->json(['status'=>true,'data'=>$data,'message'=>'List Data Saran']);
    }


     public function ruangan(Request $request)
    {
        $data = json_decode(file_get_contents('php://input'), true);
        
        $start = $data['datestart'];
        $finish = $data['datefinish'];
        $lokasi = $data['location_id'];

       
 

            $res1 = DB::table('survey_detail as a')
            ->join('survey as b', 'a.survey_id', '=', 'b.id')
            ->select('a.survey_id')
            ->where('b.fungsi','!=','selection')
            ->where('b.management_id',2)
            ->groupBy('a.survey_id')->get();

        

             
          $jml1 = count($res1);
          $survey1[] = '';
          $hasil1[] = '';
          $hitung1[] = '';
          $hitung2[] = '';
          $hitung3[] = '';
          $hitung4[] = '';

          $ruang1[] = null;
          
          $title[] = '';
          $sp1[] = '';
          $p1[] = '';
          $kp1[] = '';
          $tp1[] = '';

          for($i=0; $i<$jml1; $i++)
          {

             $survey1[$i] = DB::table('survey as a')
             ->select('a.pertanyaan','b.name','a.fungsi','a.sub as title')
              ->join('management as b', 'a.management_id', '=', 'b.id')
             ->where('a.management_id',2)
             ->where('a.id',$res1[$i]->survey_id)
             ->first();

              

              

            if($start =="" && $finish =="")
            {  
              
              $sp = DB::table('survey_detail')
              ->where('jawaban','sp')
              ->where(['location_id'=>$lokasi])
              ->where(['survey_id'=>$res1[$i]->survey_id])
              ->count();

               $p = DB::table('survey_detail')
               ->where('jawaban','p')
               ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $kp = DB::table('survey_detail')
               ->where('jawaban','kp')
               ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $tp = DB::table('survey_detail')
                ->where('jawaban','tp')
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                 $sm = DB::table('survey_detail')
               ->where('jawaban','sm')
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $ma = DB::table('survey_detail')
                ->where('jawaban','ma')
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $c = DB::table('survey_detail')
                ->where('jawaban','c')
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $mu = DB::table('survey_detail')
                ->where('jawaban','mu')
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

            }else{

                  $sp = DB::table('survey_detail')
              ->where('jawaban','sp')
              ->whereBetween('created_at', [$start, $finish])
              ->where(['location_id'=>$lokasi])
              ->where(['survey_id'=>$res1[$i]->survey_id])
              ->count();

               $p = DB::table('survey_detail')
               ->where('jawaban','p')
               ->whereBetween('created_at', [$start, $finish])
               ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $kp = DB::table('survey_detail')
               ->where('jawaban','kp')
               ->whereBetween('created_at', [$start, $finish])
               ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $tp = DB::table('survey_detail')
                ->where('jawaban','tp')
                ->whereBetween('created_at', [$start, $finish])
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                 $sm = DB::table('survey_detail')
               ->where('jawaban','sm')
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $ma = DB::table('survey_detail')
                ->where('jawaban','ma')
                ->whereBetween('created_at', [$start, $finish])
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $c = DB::table('survey_detail')
                ->where('jawaban','c')
                ->whereBetween('created_at', [$start, $finish])
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $mu = DB::table('survey_detail')
                ->where('jawaban','mu')
                ->whereBetween('created_at', [$start, $finish])
                ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                 }
               
              if($survey1[$i]->fungsi =="primary")
              {  
               
               $sangatpuas = array('jml'=>$sp,'description'=>'Sangat Puas');
               $puas = array('jml'=>$p,'description'=>'Puas');  
               $kurangpuas = array('jml'=>$kp,'description'=>'Kurang Puas');
               $tidakpuas = array('jml'=>$tp,'description'=>'Tidak Puas');

               $hasil1[$i] = array('jwb1'=>$sangatpuas,'jwb2'=>$puas,'jwb3'=>$kurangpuas,'jwb4'=>$tidakpuas);
               $hitung1[$i] =  array('jml'=>$sp,'description'=>'Sangat Puas');
               $hitung2[$i] =  array('jml'=>$p,'description'=>'Puas');
               $hitung3[$i] =  array('jml'=>$kp,'description'=>'Kurang Puas');
               $hitung4[$i] =  array('jml'=>$tp,'description'=>'Tidak Puas');



              }else if($survey1[$i]->fungsi =="secondary"){

               $sangatmahal = array('jml'=>$sm,'description'=>'Sangat Mahal');
               $mahal = array('jml'=>$ma,'description'=>'Mahal');     
               $cukup = array('jml'=>$c,'description'=>'Cukup');
               $murah = array('jml'=>$mu,'description'=>'Murah');

                $hasil1[$i] = array('jwb1'=>$sangatmahal,'jwb2'=>$mahal,'jwb3'=>$cukup,'jwb4'=>$murah);
                $hitung1[$i] = array('jml'=>$sm,'description'=>'Sangat Mahal');
                $hitung2[$i] =  array('jml'=>$ma,'description'=>'Mahal');
                $hitung3[$i] =  array('jml'=>$c,'description'=>'Cukup');
                $hitung4[$i] =  array('jml'=>$mu,'description'=>'Murah');
              }
             
           }
             
            for($i=0; $i<$jml1; $i++)
            {

              $ruang1[$i] = array($survey1[$i],$hasil1[$i]);
              $title[$i]  = $survey1[$i]->title;
              $sp1[$i]     = $hitung1[$i]['jml'];
              $p1[$i]     = $hitung2[$i]['jml'];
              $kp1[$i]     = $hitung3[$i]['jml'];
              $tp1[$i]     = $hitung4[$i]['jml'];
            }
                 
         if($lokasi !="0")
         {      
           $lantai = DB::table('location')->where('id',$lokasi)->first()->name;
         }else{
          $lantai = '';
         }      
               



       return response()->json([
        'status'=>'true',
        'ruangan'=>$ruang1,
        'lantai' => $lantai,
        'categories1'=>$title,
        'sp'=>$sp1,
        'p'=>$p1,
        'kp'=>$kp1,
        'tp'=>$tp1,
        'start'=>$start,
        'finish'=>$finish,
        'message'=>'Data Chart']);

          
        
    }


   

       public function resepsionis(Request $request)
    {
        $data = json_decode(file_get_contents('php://input'), true);
        
        $start = $data['datestart'];
        $finish = $data['datefinish'];
        $lokasi = $data['location_id'];

       
 

            $res1 = DB::table('survey_detail as a')
            ->join('survey as b', 'a.survey_id', '=', 'b.id')
            ->select('a.survey_id')
            ->where('b.fungsi','!=','selection')
            ->where('b.management_id',1)
            ->groupBy('a.survey_id')->get();

        

             
          $jml1 = count($res1);
          $survey1[] = '';
          $hasil1[] = '';
          $ruang1[] = null;
           $hitung1[] = '';
          $hitung2[] = '';
          $hitung3[] = '';
          $hitung4[] = '';

          $title[] = '';
          $sp1[] = '';
          $p1[] = '';
          $kp1[] = '';
          $tp1[] = '';

          for($i=0; $i<$jml1; $i++)
          {

             $survey1[$i] = DB::table('survey as a')
             ->select('a.pertanyaan','b.name','a.fungsi','a.sub as title')
              ->join('management as b', 'a.management_id', '=', 'b.id')
             ->where('a.management_id',1)
             ->where('a.id',$res1[$i]->survey_id)
             ->first();

             

                if($start =="" && $finish =="")
                {  

                $sp = DB::table('survey_detail')
              ->where('jawaban','sp')
               ->where(['location_id'=>$lokasi])
              ->where(['survey_id'=>$res1[$i]->survey_id])
              ->count();

                $p = DB::table('survey_detail')
               ->where('jawaban','p')
                ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $kp = DB::table('survey_detail')
               ->where('jawaban','kp')
                ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $tp = DB::table('survey_detail')
                ->where('jawaban','tp')
                 ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $sm = DB::table('survey_detail')
               ->where('jawaban','sm')
                ->where(['location_id'=>$lokasi])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $ma = DB::table('survey_detail')
                ->where('jawaban','ma')
                 ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $c = DB::table('survey_detail')
                ->where('jawaban','c')
                 ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $mu = DB::table('survey_detail')
                ->where('jawaban','mu')
                 ->where(['location_id'=>$lokasi])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                }else{


               $sp = DB::table('survey_detail')
              ->where('jawaban','sp')
               ->where(['location_id'=>$lokasi])
              ->whereBetween('created_at', [$start, $finish])
              ->where(['survey_id'=>$res1[$i]->survey_id])
              ->count();

                $p = DB::table('survey_detail')
               ->where('jawaban','p')
                ->where(['location_id'=>$lokasi])
               ->whereBetween('created_at', [$start, $finish])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $kp = DB::table('survey_detail')
               ->where('jawaban','kp')
                ->where(['location_id'=>$lokasi])
               ->whereBetween('created_at', [$start, $finish])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

                $tp = DB::table('survey_detail')
                ->where('jawaban','tp')
                 ->where(['location_id'=>$lokasi])
                ->whereBetween('created_at', [$start, $finish])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $sm = DB::table('survey_detail')
               ->where('jawaban','sm')
                ->where(['location_id'=>$lokasi])
               ->whereBetween('created_at', [$start, $finish])
               ->where(['survey_id'=>$res1[$i]->survey_id])
               ->count();

               $ma = DB::table('survey_detail')
                ->where('jawaban','ma')
                 ->where(['location_id'=>$lokasi])
                ->whereBetween('created_at', [$start, $finish])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $c = DB::table('survey_detail')
                ->where('jawaban','c')
                 ->where(['location_id'=>$lokasi])
                ->whereBetween('created_at', [$start, $finish])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count();

                $mu = DB::table('survey_detail')
                ->where('jawaban','mu')
                 ->where(['location_id'=>$lokasi])
                ->whereBetween('created_at', [$start, $finish])
                ->where(['survey_id'=>$res1[$i]->survey_id])
                ->count(); 

                }
              
              if($survey1[$i]->fungsi =="primary")
              {  
               
               $sangatpuas = array('jml'=>$sp,'description'=>'Sangat Puas');
               $puas = array('jml'=>$p,'description'=>'Puas');  
               $kurangpuas = array('jml'=>$kp,'description'=>'Kurang Puas');
               $tidakpuas = array('jml'=>$tp,'description'=>'Tidak Puas');

               $hasil1[$i] = array('jwb1'=>$sangatpuas,'jwb2'=>$puas,'jwb3'=>$kurangpuas,'jwb4'=>$tidakpuas);
               $hitung1[$i] =  array('jml'=>$sp,'description'=>'Sangat Puas');
               $hitung2[$i] =  array('jml'=>$p,'description'=>'Puas');
               $hitung3[$i] =  array('jml'=>$kp,'description'=>'Kurang Puas');
               $hitung4[$i] =  array('jml'=>$tp,'description'=>'Tidak Puas');

              }else if($survey1[$i]->fungsi =="secondary"){

               $sangatmahal = array('jml'=>$sm,'description'=>'Sangat Mahal');
               $mahal = array('jml'=>$ma,'description'=>'Mahal');     
               $cukup = array('jml'=>$c,'description'=>'Cukup');
               $murah = array('jml'=>$mu,'description'=>'Murah');

                $hasil1[$i] = array('jwb1'=>$sangatmahal,'jwb2'=>$mahal,'jwb3'=>$cukup,'jwb4'=>$murah);
                $hitung1[$i] = array('jml'=>$sm,'description'=>'Sangat Mahal');
                $hitung2[$i] =  array('jml'=>$ma,'description'=>'Mahal');
                $hitung3[$i] =  array('jml'=>$c,'description'=>'Cukup');
                $hitung4[$i] =  array('jml'=>$mu,'description'=>'Murah');
              }


             
           }
             
            for($i=0; $i<$jml1; $i++)
            {

              $ruang1[$i] = array($survey1[$i],$hasil1[$i]);
              $title[$i]  = $survey1[$i]->title;
              $sp1[$i]     = $hitung1[$i]['jml'];
              $p1[$i]     = $hitung2[$i]['jml'];
              $kp1[$i]     = $hitung3[$i]['jml'];
              $tp1[$i]     = $hitung4[$i]['jml'];
            }

              
        if($lokasi !="0")
         {      
           $lantai = DB::table('location')->where('id',$lokasi)->first()->name;
         }else{
          $lantai = '';
         }         

    return response()->json([
      'status'=>'true',
      'resepsionis'=>$ruang1,
      'lantai' => $lantai,
      'categories'=>$title,
      'sp'=>$sp1,
      'p'=>$p1,
      'kp'=>$kp1,
      'tp'=>$tp1,
     
      'start'=>$start,
      'finish'=>$finish,
      'message'=>'Data Chart'
    ]);




          
        
    }

    public function pertanyaan(Request $request){
      $data = json_decode(file_get_contents('php://input'), true);
        
      $survey_id = $data['survey_id'];

      
      foreach ($res as $row) 
      {
         $data = DB::table('survey')->where('id',$survey_id)->get();
         return $data;
      }
   

    }

  

     public function addlokasi(Request $request)
    {
         $data = json_decode(file_get_contents('php://input'), true);
         DB::table('location')->where('type','gedung')->insert(['name'=>$data['name'],'type'=>'gedung','created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]); 

            return response()->json(['status'=>true, 'message'=>'Tambah berhasil']);

    }

    public function lokasi(Request $request)
    {
       $data = DB::table('location')->where('type','gedung')->orderBy('id','asc')->get();
       return response()->json(['status'=>true,'data'=>$data, 'message'=>'Data lokasi']);
    }

    public function updatelokasi(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('location')->where('id',$data['id'])->update(['name'=>$data['name']]);
       return response()->json(['status'=>true, 'message'=>'Update berhasil']);
       
    }


    public function destroylokasi(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('location')->where('id',$data['id'])->delete();
       return response()->json(['status'=>true, 'message'=>'Hapus berhasil']);
       
    }



     public function addresep(Request $request)
    {
         $data = json_decode(file_get_contents('php://input'), true);
         DB::table('location')->where('type','resepsionis')->insert(['name'=>$data['name'], 'type'=>'resepsionis','created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]); 

            return response()->json(['status'=>true, 'message'=>'Tambah berhasil']);

    }

    public function resep(Request $request)
    {
       $data = DB::table('location')->where('type','resepsionis')->orderBy('id','asc')->get();
       return response()->json(['status'=>true,'data'=>$data, 'message'=>'Data lokasi']);
    }

    public function updateresep(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('location')->where('id',$data['id'])->update(['name'=>$data['name']]);
       return response()->json(['status'=>true, 'message'=>'Update berhasil']);
       
    }


    public function destroyresep(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('location')->where('id',$data['id'])->delete();
       return response()->json(['status'=>true, 'message'=>'Hapus berhasil']);
       
    }


      public function addsoal(Request $request)
    {
         $data = json_decode(file_get_contents('php://input'), true);
         DB::table('survey')->insert(['management_id'=>$data['management_id'],'pertanyaan'=>$data['pertanyaan'],'sub'=>$data['sub'],'fungsi'=>$data['fungsi'],'status'=>1,'created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]); 

            return response()->json(['status'=>true, 'message'=>'Tambah berhasil']);

    }

    public function soal(Request $request)
    {
       $data = DB::table('survey as a')->select('a.id','a.pertanyaan','b.name','a.sub','a.management_id','a.fungsi')->join('management as b','a.management_id','=','b.id')->orderBy('a.id','asc')->get();
       return response()->json(['status'=>true,'data'=>$data, 'message'=>'Data lokasi']);
    }

    public function updatesoal(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('survey')->where('id',$data['id'])->update(['management_id'=>$data['management_id'],'pertanyaan'=>$data['pertanyaan'],'sub'=>$data['sub'],'fungsi'=>$data['fungsi'],'created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]);
       return response()->json(['status'=>true, 'message'=>'Update berhasil']);
       
    }


    public function destroysoal(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('survey')->where('id',$data['id'])->delete();
       return response()->json(['status'=>true, 'message'=>'Hapus berhasil']);
       
    }


       public function addadmin(Request $request)
    {
         $data = json_decode(file_get_contents('php://input'), true);
         DB::table('users')->insert(['name'=>$data['name'],'email'=>$data['email'],'password'=>bcrypt($data['password']),'phone'=>$data['phone'],'type'=>$data['type'],'created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]); 

            return response()->json(['status'=>true, 'message'=>'Tambah berhasil']);

    }

    public function admin(Request $request)
    {
       $data = DB::table('users')->orderBy('id','desc')->get();
       return response()->json(['status'=>true,'data'=>$data, 'message'=>'Data admin']);
    }

    public function updateadmin(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('users')->where('id',$data['id'])->update(['name'=>$data['name'],'email'=>$data['email'],'phone'=>$data['phone'],'type'=>$data['type'],'created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]);
       return response()->json(['status'=>true, 'message'=>'Update berhasil']);
       
    }


    public function destroyadmin(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('users')->where('id',$data['id'])->delete();
       return response()->json(['status'=>true, 'message'=>'Hapus berhasil']);
       
    }


     public function addsaran(Request $request)
    {
         $data = json_decode(file_get_contents('php://input'), true);
         DB::table('saran')->insert(['name'=>$data['name'],'created_at'=> DB::raw('now()'),'updated_at'=>DB::raw('now()')]); 

            return response()->json(['status'=>true, 'message'=>'Tambah berhasil']);

    }

    public function saran(Request $request)
    {
       $data = DB::table('saran')->orderBy('id','asc')->get();
       return response()->json(['status'=>true,'data'=>$data, 'message'=>'Data saran']);
    }

    public function updatesaran(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('saran')->where('id',$data['id'])->update(['name'=>$data['name']]);
       return response()->json(['status'=>true, 'message'=>'Update berhasil']);
       
    }


    public function destroysaran(Request $request)
    {
       $data = json_decode(file_get_contents('php://input'), true);
       DB::table('saran')->where('id',$data['id'])->delete();
       return response()->json(['status'=>true, 'message'=>'Hapus berhasil']);
       
    }

     public function reportpasienrep(Request $request)
    {

      $data = json_decode(file_get_contents('php://input'), true);
        
        $start = $data['datestart'];
        $finish = $data['datefinish'];
        $lokasi = $data['location_id'];

       if($start=='')
       {
        
         $res1 = DB::table('survey_detail as a')
         ->select('a.saran_id')
         ->where(['a.jawaban'=>'sr','management_id'=>1,'a.location_id'=>$lokasi])
         ->groupBy('a.saran_id')
         ->get();

      }else{

         $res1 = DB::table('survey_detail as a')
       ->select('a.saran_id')
        ->where(['a.jawaban'=>'sr','management_id'=>1,'a.location_id'=>$lokasi])
       ->groupBy('a.saran_id')
       ->get();

     }

        $jml1 = count($res1);
        $saran[] = '';
         

          for($i=0; $i<$jml1; $i++)
          {

             $saran[$i] = DB::table('saran as a')
             ->select('a.name')
             ->where('a.id',$res1[$i]->saran_id)
             ->first();

               if($start =="")
               {

                $hasil[$i]  = DB::table('survey_detail')
                ->where(['jawaban'=>'sr','management_id'=>1,'location_id'=>$lokasi])
                ->where(['saran_id'=>$res1[$i]->saran_id])
                ->count();

               }else{

                  $hasil[$i]  = DB::table('survey_detail')
               ->where(['jawaban'=>'sr','management_id'=>1,'location_id'=>$lokasi])
                ->where(['saran_id'=>$res1[$i]->saran_id])
                 ->whereBetween('date', [$start, $finish])
                ->count(); 

               }

               $report[$i] = array($saran[$i],$hasil[$i]);
               $grsaran[$i] =  $saran[$i]->name;
               $jml[$i] = $hasil[$i];
          }   



       return response()->json(['status'=>true,'data'=>$report,'grafik'=>$grsaran,'jml'=>$jml, 'message'=>'Data saran']);
    }
    
      public function reportpasienlok(Request $request)
    {

       $data = json_decode(file_get_contents('php://input'), true);
        
        $start = $data['datestart'];
        $finish = $data['datefinish'];
        $lokasi = $data['location_id'];
      
        if($start=='')
        {
   
           $res1 = DB::table('survey_detail as a')
          ->select('a.saran_id')
         ->where(['a.jawaban'=>'sr','management_id'=>2,'a.location_id'=>$lokasi])
        // ->where('a.location_id', '<>', '0')
       //->where(['a.jawaban'=>'sr','a.location_id'=>$lokasi])
       ->groupBy('a.saran_id')
       ->get();   

        }else{


          if($lokasi !=0)
          {  

        
          $res1 = DB::table('survey_detail as a')
       ->select('a.saran_id')
        ->where(['a.jawaban'=>'sr','a.location_id'=>$lokasi,'management_id'=>2])
        
       ->groupBy('a.saran_id')
       ->get();

         }else{
 
          $res1 = DB::table('survey_detail as a')
       ->select('a.saran_id')
        ->where(['a.jawaban'=>'sr','management_id'=>2])
        
       ->groupBy('a.saran_id')
       ->get();


         }

        } 


        $jml1 = count($res1);
        $saran[] = '';
         
        if($jml1 ==0)
        {

               $report[0] = array();
               $grsaran[0] =  '';
               $jml[0] = [];
        

        }else{

          for($i=0; $i<$jml1; $i++)
          {

             
             $saran[$i] = DB::table('saran as a')
             ->select('a.name')
             ->where('a.id',$res1[$i]->saran_id)
             ->first();


            
              if($start =="")
              {

              $hasil[$i]  = DB::table('survey_detail')
                ->where(['jawaban'=>'sr','management_id'=>2,'location_id'=>$lokasi])
              ->where(['saran_id'=>$res1[$i]->saran_id])
              ->count();

            }else{

                 if($lokasi !=0)
                {

                    $hasil[$i]  = DB::table('survey_detail')
                    ->where(['saran_id'=>$res1[$i]->saran_id,'jawaban'=>'sr','location_id'=>$lokasi,'management_id'=>2])
                    ->whereBetween('date', [$start, $finish])
                    ->count();

                }else{

                       $hasil[$i]  = DB::table('survey_detail')
                    ->where(['saran_id'=>$res1[$i]->saran_id,'jawaban'=>'sr','management_id'=>2])
                    ->whereBetween('date', [$start, $finish])
                    ->count();

                }


            }
                 
               $report[$i] = array($saran[$i],$hasil[$i]);
               $grsaran[$i] =  $saran[$i]->name;
               $jml[$i] = $hasil[$i];
          }   

        }

      return response()->json(['status'=>true,'data'=>$report, 'grafik'=>$grsaran,'jml'=>$jml,'message'=>'Data saran']);
    }

    public function lantai(Request $request)
    {

      $lantai = DB::table('survey_detail as a')->select('b.id','b.name')
       ->join('location as b', 'a.location_id', '=', 'b.id')
       ->where('type','gedung')
       ->groupBy('b.id')
      ->get();


      return response()->json(['status'=>true,'data'=>$lantai,'message'=>'Data gedung']);
    }


    public function reseps(Request $request)
    {

      $lantai = DB::table('survey_detail as a')->select('b.id','b.name')
       ->join('location as b', 'a.location_id', '=', 'b.id')
        ->where('type','resepsionis')
       ->groupBy('b.id')
      ->get();


      return response()->json(['status'=>true,'data'=>$lantai,'message'=>'Data gedung']);
    }

}