<?php

namespace App\Models;

use Eloquent as Model;
// use Illuminate\Database\Eloquent\SoftDeletes;

class Survey extends Model
{
     // use SoftDeletes;

    public $table = 'survey';
    

   // protected $dates = ['deleted_at'];


    public $fillable = [
    	'management_id',
        'pertanyaan',
        'fungsi',
        'status'
       

     
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'management_id' => 'integer',
        'pertanyaan'=>'string',
        'status' => 'integer'

       
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'management_id' => 'required',
        'pertanyaan' => 'required',
        'status'=>'required'
    ];
}
