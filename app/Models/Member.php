<?php

namespace App\Models;

use Eloquent as Model;
// use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends Model
{
     // use SoftDeletes;

    public $table = 'member';
    

   // protected $dates = ['deleted_at'];


    public $fillable = [
        'member_id',
        'name',
        'saran',
        'status'
       

     
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'member_id' => 'string',
        'name' => 'string',
        'saran' => 'string',
        'status' => 'integer'

       
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
     
    ];
}
